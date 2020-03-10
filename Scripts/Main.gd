extends Node

var time : int = 0
var life : int = 4

func convert_time(localTime):
	var minutes : int = int(localTime/60)
	var seconds : int = localTime%60
	return str(minutes)+"m"+("%02d"%seconds)+"s"


func _on_Timer_timeout():
	time += 1
	$GUI.set_label(convert_time(time))


func _on_Space2D_hit():
	life -= 1
	$GUI.set_life(life)
	if life >= 0 :
		$Space2D/AnimationPlayer.play("Hitted")
	elif life < 0 :
		$Space2D/AnimationPlayer.play("GameOver")
