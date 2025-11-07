extends StaticBody3D

func on_clicked():
	print("Le cube a été cliqué !")
	var label = get_node("../../Label3D")
	label.text = "Coucou depuis le cube 👋"
