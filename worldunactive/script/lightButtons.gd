extends StaticBody3D

func on_clicked():
	print("Lumière cliquer")
	$AnimationPlayer.play("lightOFF")
	
	$"../light".visible = false
	$"../CanvasLayer/Objectif/Label".text = "Objectif : \n aller au lit"
	
	$"../mur invisible".collision_layer = false
