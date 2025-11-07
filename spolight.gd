extends StaticBody3D

var _light = false # État initial de la lumière

func on_clicked():
	# Bascule l'état de la lumière
	_light = ! _light
	$SpotLight3D.visible = _light
	
