extends StaticBody3D

func on_clicked():
	print("Lumière cliquer")
	$AnimationPlayer.play("lightOFF")
	
	$"../light".visible = false
