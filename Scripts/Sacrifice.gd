extends Sprite

const TEXTURES : Array = [
	preload("res://Assets/Caracters/Character1.png"),
	preload("res://Assets/Caracters/Character2.png"),
	preload("res://Assets/Caracters/Character3.png"),
	preload("res://Assets/Caracters/Character4.png"),
	]
var counter : int = 0

func change_texture() -> void :
	texture = TEXTURES[counter%4]
	counter += 1
