extends Node2D

signal hit

func _process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		$Car.displacement("left")
	elif Input.is_action_just_pressed("ui_right"):
		$Car.displacement("right")


func _on_Timer_timeout():
	$Dangers.add_child(preload("res://Scenes/Danger.tscn").instance())


func _on_Car_area_entered(area):
	$Car.open_door()
	$Sacrifice.change_texture()
	$Sacrifice.position.x = $Car.position.x + 100
	$AnimationPlayer.play("Hitted")


func _on_AnimationPlayer_animation_finished(anim_name):
	$Car.close_door()
	$Timer.start()
