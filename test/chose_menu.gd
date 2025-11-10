extends Control




func _on_jouer_pressed() -> void:
	get_tree().change_scene_to_file("res://Niveau 1/level1.tscn")
	pass # Replace with function body.


func _on_quitter_pressed() -> void:
	get_tree().Quit()
	pass # Replace with function body.


func _on_test_pressed() -> void:
	get_tree().change_scene_to_file("res://test/level1.tscn")
	pass # Replace with function body.
