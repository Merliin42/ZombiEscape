extends MarginContainer

const LIFE : Array = [0, 25, 50, 75, 100]

func set_label(time):
	$HBoxContainer/Label.text = time

func set_life(life):
	$HBoxContainer/TextureProgress.value = LIFE[life%5] # Modulo avoid index error if life < -6
