extends CharacterBody2D
class_name Human

@onready var bt := $BTPlayer as BTPlayer

const SPEED = 150.0

var direction : Vector2 = Vector2.ZERO
var home_pos : Vector2 = Vector2.ZERO
var is_move : bool = false

func _ready() -> void:
	add_to_group("human")
	home_pos = position
	bt.blackboard.set_var("home_pos", home_pos)
	bt.blackboard.set_var("is_move", is_move)
	bt.blackboard.set_var("direction_string", "down")
	pass
	
func _physics_process(delta: float) -> void:
	if direction && bt.blackboard.get_var("is_move"):
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

func _random_dir() -> void:
	direction = Vector2(
		randf_range(-1, 1),
		randf_range(-1, 1)
	)
		
	bt.blackboard.set_var("direction", direction)
	pass
