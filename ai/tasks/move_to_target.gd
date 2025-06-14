extends BTAction

var direction : Vector2
var new_direction : Vector2
var target_list : Array[Node2D]
var target : Node2D
var new_position : Vector2

func _enter() -> void:
	direction = blackboard.get_var("direction")
	target_list = blackboard.get_var("target_list")
	target = target_list[0]
	
	new_position = (target.position - agent.position)
	new_direction = new_position.normalized()
	agent.direction = new_direction
	
	blackboard.set_var("direction", new_direction)
	blackboard.set_var("is_move", true)
	pass

func _tick(delta: float) -> Status:	
	if agent.position >= new_position/2 || agent.position < new_position*2:
		return SUCCESS
		
	return RUNNING
