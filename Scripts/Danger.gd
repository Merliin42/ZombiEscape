extends Area2D

const SPEED : int = 1000
const DISPLACEMENT : Array = [280, 550, 810]
const TEXTURES : Array = [
	preload("res://Assets/Danger/Buisson.png"), 
	preload("res://Assets/Danger/Mouton.png"),
	preload("res://Assets/Danger/Pierre.png"),
	preload("res://Assets/Danger/Tronc.png"),
]

func _ready():
	randomize()
	$Sprite.texture = TEXTURES[randi()%4]
	position.x = DISPLACEMENT[randi()%3]

func _process(delta):
	position.y += SPEED*delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
