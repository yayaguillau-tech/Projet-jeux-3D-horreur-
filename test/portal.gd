extends Area3D

func _on_body_entered(body: Node3D) -> void:
	print("Le joueur est entré dans le portail !")
	get_tree().change_scene_to_file("res://World/Level2.tscn")
	print("test")
