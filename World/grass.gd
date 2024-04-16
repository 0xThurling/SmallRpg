extends Node2D

const load_grass_effect = preload("res://Effects/grass_effect.tscn")

func create_grass_effect():
	var create_grass_scene = load_grass_effect.instantiate()
	get_parent().add_child(create_grass_scene)	
	create_grass_scene.global_position = global_position

func _on_hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()
