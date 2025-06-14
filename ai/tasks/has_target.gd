extends BTAction

var target_list

func _enter() -> void:
	target_list = blackboard.get_var("target_list")
	pass

func _tick(delta: float) -> Status:
	if target_list.size() > 0:
		return SUCCESS
	return FAILURE
	
