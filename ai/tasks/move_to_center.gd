extends BTAction

@export var distance_max : int = 0

var direction : Vector2
var new_direction := Vector2.ZERO 
var new_position := Vector2(2, 2)
var distance : int

func _enter() -> void:
	distance = abs(new_position.distance_to(agent.position))
	if distance <= distance_max:
		return
		
	new_direction = (agent.position - new_position).normalized()
	agent.direction = new_direction
	
	blackboard.set_var("direction", new_direction)
	blackboard.set_var("is_move", true)
	pass

func _tick(delta: float) -> Status:
	if distance <= distance_max:
		return FAILURE
		
	if distance >= (distance_max/2):
		return SUCCESS
	
	return RUNNING
