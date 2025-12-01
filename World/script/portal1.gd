extends Area3D 

func _on_body_entered(body: Node3D) -> void:
	# Si cette ligne s'affiche, c'est gagné !
	print("Le joueur est entré dans le portail !")
	
	get_tree().change_scene_to_file("res://World/level_2.tscn")
