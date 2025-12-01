extends Control


func _on_jouer_pressed() -> void:
	get_tree().change_scene_to_file("res://World/level_1.tscn")
	pass # Replace with function body.
	
func _on_quitter_pressed() -> void:
	get_tree().Quit()
	pass # Replace with function body.

func _on_test_pressed() -> void:
	var packed := load("res://test/level1.tscn") as PackedScene
	if not packed:
		push_error("Impossible de charger level1.tscn")
		return

	var new_scene := packed.instantiate()
	get_tree().get_root().add_child(new_scene)
	get_tree().set_current_scene(new_scene)

	# Supprime le menu
	queue_free()  # détruit le node actuel et ses enfants

func _on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://Credit.tscn")
	
	pass # Replace with function body.
