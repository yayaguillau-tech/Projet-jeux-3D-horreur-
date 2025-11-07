extends StaticBody3D # <--- Utilisez une classe qui hérite de Node

# Le nœud AnimationPlayer doit être lié dans l'Inspecteur

var est_ouverte: bool = false # L'état actuel de l'objet (porte, coffre, etc.)

# Fonction à appeler lors de l'interaction (clic, touche, etc.)
func on_clicked():
	# S'assurer que le nœud AnimationPlayer est bien là
	if $AnimationPlayer == null:
		return

	# 1. Basculer l'état
	est_ouverte = !est_ouverte
	
	# 2. Déterminer quelle animation jouer
	# Utilisation de l'opérateur ternaire pour la concision :
	var animation_name = "open" if est_ouverte else "close"
	
	# 3. Jouer l'animation
	$AnimationPlayer.play(animation_name)
	
	# Facultatif : Empêcher le spam de clics en attendant la fin de l'animation
	# (Si vous voulez cette fonctionnalité, vous devez reconnecter votre signal 'animation_finished')
