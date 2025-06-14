extends CharacterBody2D
class_name Human

@onready var bt := $BTPlayer as BTPlayer
@onready var radar_obj := $radar_obj as Area2D

const SPEED = 150.0

var direction : Vector2 = Vector2.ZERO
var home_pos : Vector2 = Vector2.ZERO
var is_move : bool = false

var target_list : Array[Node2D] = []

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


func _on_radar_obj_body_entered(body: Node2D) -> void:
	if body.is_in_group("human"):
		return
		
	for i in target_list:
		if i.name == body.name:
			return
	target_list.append(body)
	bt.blackboard.set_var("target_list", target_list)
	return
