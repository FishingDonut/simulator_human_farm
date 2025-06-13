extends BTAction

func _enter() -> void:
	agent._random_dir()
	blackboard.set_var("is_move", true)
	pass

func _tick(delta: float) -> Status:
	return SUCCESS
