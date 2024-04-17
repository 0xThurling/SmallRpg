extends Area2D

const hit_effect = preload("res://Scenes/hit_effect.tscn")

@onready var timer = $Timer

var invincible = false:
	get:
		return invincible
	set(value):
		invincible = value
		set_invincible(value)

func set_invincible(value):
	if self.invincible == true:
		emit_signal("invincibililty_started")
	else:
		emit_signal("invincibililty_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect():
	var effect = hit_effect.instantiate()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position - Vector2(0, 8);

signal invincibililty_started
signal invincibililty_ended


func _on_timer_timeout():
	self.invincible = false


func _on_invincibililty_started():
	set_deferred("monitoring", false)


func _on_invincibililty_ended():
	monitoring = true
