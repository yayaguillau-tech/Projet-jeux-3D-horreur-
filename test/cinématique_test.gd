extends StaticBody3D
# Godot 4.5 - script pour gérer une cinématique et revenir à la caméra joueur

# Path relatif/configurable vers la caméra du player (modifie si nécessaire dans l'inspecteur)
@export var player_cam_path: NodePath = "../player/CharacterBody3D/Head/Camera3D"

@onready var cinematic_cam: Camera3D = $Camera3D
@onready var anim_player: AnimationPlayer = $AnimationPlayer

var player_cam: Camera3D = null

func _ready() -> void:
	# Par défaut, la caméra de cinématique n'est pas active.
	if cinematic_cam:
		cinematic_cam.current = false

	# Connecte le signal d'animation (sécurisé si connecté plusieurs fois)
	if anim_player:
		if not anim_player.is_connected("animation_finished", Callable(self, "_on_animation_player_animation_finished")):
			anim_player.animation_finished.connect(_on_animation_player_animation_finished)

	# Initialise la recherche de la caméra joueur de façon différée/non-bloquante
	call_deferred("_init_player_cam_async")

# Recherche asynchrone de la caméra joueur (attend si l'instance arrive plus tard)
func _init_player_cam_async() -> void:
	var tries := 0
	var max_tries := 100  # 100 * 0.05s = 5s max d'attente ; adapte si besoin
	while tries < max_tries and player_cam == null:
		player_cam = get_node_or_null(player_cam_path)
		if player_cam:
			print("✅ Player camera trouvée :", player_cam.get_path())
			break
		tries += 1
		# attends 0.05s de façon non bloquante puis réessaie
		await get_tree().create_timer(0.05).timeout

	if player_cam == null:
		push_warning("⚠️ Impossible de trouver la caméra joueur au chemin : %s" % player_cam_path)

# Appelé depuis l'éditeur (signal) ou depuis un click pour démarrer la cinématique
func on_clicked() -> void:
	_start_cinematic()

func _start_cinematic() -> void:
	# Si on a la caméra joueur, on la désactive proprement
	if player_cam:
		player_cam.current = false
	else:
		push_warning("player_cam est null dans _start_cinematic(), la cinématique démarre quand même.")

	# Active la caméra cinématique
	if cinematic_cam:
		cinematic_cam.make_current()
	else:
		push_warning("cinematic_cam introuvable (vérifie le nœud $Camera3D).")

	# Lance l'animation (adapter le nom de l'anim si besoin)
	if anim_player:
		anim_player.play("test_cinématique")
	else:
		print("🔔 Pas d'AnimationPlayer trouvé — pense à ajouter une animation ou à lancer la fin manuellement.")
	print("🎥 Cinematic started")

# Handler appelé quand une animation finit
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	# Si tu veux agir seulement sur une animation précise, décommente la condition suivante :
	# if String(anim_name) != "test_cinématique":
	#     return

	# Désactive la cam cinématique
	if cinematic_cam:
		cinematic_cam.current = false

	# Restaure la cam joueur si elle existe
	if player_cam:
		player_cam.make_current()
	else:
		push_warning("player_cam est toujours null à la fin de la cinématique ; impossible de restaurer la vue joueur.")

	print("🎮 Cinematic ended (anim: %s)" % String(anim_name))
