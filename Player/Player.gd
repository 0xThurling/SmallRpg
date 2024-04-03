extends CharacterBody2D

var playerVelocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	if input_vector != Vector2.ZERO:
		playerVelocity = input_vector
	else:
		playerVelocity = Vector2.ZERO
	
	move_and_collide(playerVelocity)
