extends Area2D

const SPEED : float = 0.1
const DISPLACEMENT : Array = [280, 550, 810]
var carPosition : int = 1
export var hitted : bool = false

func displacement(direction : String):
	if hitted :
		return
	if (direction == "left") and (carPosition > 0) :
		carPosition -= 1
	elif (direction == "right") and (carPosition < 2) :
		carPosition += 1
	$Tween.interpolate_property(self, "position", position, Vector2(DISPLACEMENT[carPosition], self.position.y), SPEED, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.start()

func get_hitted() -> bool :
	return hitted

func set_hitted(hitted) -> void :
	self.hitted = hitted

func open_door() -> void :
	$AnimatedSprite.play("openDoor")

func close_door() -> void :
	$AnimatedSprite.play("closeDoor")
