extends StaticBody3D

func on_clicked():
	$"../CanvasLayer/Objectif/Tips".text = "huh..."
	await get_tree().create_timer(1.0).timeout
	$"../CanvasLayer/Objectif/Tips".text = "Si je n'éteint pas la lumière \n maman va me défoncer."
	await get_tree().create_timer(2.0).timeout
	$"../CanvasLayer/Objectif/Tips".text = ""
	pass
