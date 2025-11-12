extends StaticBody3D

@onready var player_cam: Camera3D = get_node("../player/CharacterBody3D/Head/Camera3D")
@onready var cinematic_cam: Camera3D = $Camera3D

func _ready() -> void:
	# par défaut, on laisse la caméra joueur active
	cinematic_cam.current = false

# exemple : quand on clique sur l'objet de cinématique (ou quand tu veux lancer la cinématique)
func on_clicked() -> void:
	_start_cinematic()

func _start_cinematic() -> void:
	# désactive la caméra joueur et active la caméra de cinématique
	if player_cam:
		player_cam.current = false
	cinematic_cam.current = true
	print("🎥 Cinematic started")
	$AnimationPlayer.play("test_cinématique")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
		# réactive la caméra joueur
	cinematic_cam.current = false
	if player_cam:
		player_cam.current = true
	print("🎮 Cinematic ended")
	pass # Replace with function body.
