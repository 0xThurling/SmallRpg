extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.frame = 0
	animated_sprite.play("Animate")


func _on_animated_sprite_2d_animation_finished():
	queue_free()
