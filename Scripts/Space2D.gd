extends Node2D

signal hit

const SCREAMS = [
	preload("res://Assets/Sounds/distress1.wav"),
	preload("res://Assets/Sounds/distress2.wav"),
	preload("res://Assets/Sounds/distress3.wav"),
]

var dragStart : Vector2 = Vector2()
var displacementPossible : bool = true

func _process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		$Car.displacement("left")
	elif Input.is_action_just_pressed("ui_right"):
		$Car.displacement("right")
	
	if Input.is_action_just_pressed("mouse_click"):
		dragStart = get_local_mouse_position()
	if Input.is_action_pressed("mouse_click"):
		var drag : Vector2 = dragStart - get_local_mouse_position()
		if drag.x > 100 and displacementPossible:
			displacementPossible = false
			$Car.displacement("left")
		elif drag.x < -100 and displacementPossible:
			displacementPossible = false
			$Car.displacement("right")
	if Input.is_action_just_released("mouse_click"):
		displacementPossible = true


func _on_Timer_timeout():
	$Dangers.add_child(preload("res://Scenes/Danger.tscn").instance())


func _on_Car_area_entered(_area):
	$Scream.stream = SCREAMS[randi()%3]
	$Car.open_door()
	$Sacrifice.change_texture()
	$Sacrifice.position.x = $Car.position.x + 100
	emit_signal("hit")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Hitted":
		$Car.close_door()
		$Timer.start()
	else :
		get_tree().change_scene("res://Scenes/GameOver.tscn")
