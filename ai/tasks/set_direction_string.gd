extends BTAction

var direction : Vector2

func _enter() -> void:
	direction = blackboard.get_var("direction")
	pass

func _tick(delta: float) -> Status:
	if abs(direction.x) > abs(direction.y):
		if(direction.x < 0):
			blackboard.set_var("direction_string", "left")
		else:
			blackboard.set_var("direction_string", "right")
	else:
		if(direction.y < 0):
			blackboard.set_var("direction_string", "up")
		else:
			blackboard.set_var("direction_string", "down")
			
	return SUCCESS
