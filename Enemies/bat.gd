extends CharacterBody2D

@onready var stats = $Stats
@onready var playerDetectionZone = $PlayerDetectionZone
@onready var sprite = $BatBody
@onready var hurtbox = $Hurtbox
@onready var softCollision = $SoftCollision

@export var ACCELERATION = 250
@export var MAX_SPEED = 40
@export var FRICTION = 200

const enemy_death_effect = preload("res://Effects/enemy_death_effect.tscn")

enum {
	IDLE,
	WANDER,
	CHASE
}

var state = IDLE

func _physics_process(delta):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
		WANDER:
			pass
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			else:
				state = IDLE
			
			sprite.flip_h = velocity.x < 0
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 400
	move_and_slide()

func seek_player():
	if playerDetectionZone.can_see_player():
		print("Hi there")
		state = CHASE

func _on_hurtbox_area_entered(area):
	stats.health -= area.damage
	var direction = (position - area.owner.position).normalized()
	velocity = direction * 150
	hurtbox.create_hit_effect()

func _on_stats_no_health():
	queue_free()
	var enemy_death = enemy_death_effect.instantiate()
	get_parent().add_child(enemy_death)
	enemy_death.global_position = global_position
