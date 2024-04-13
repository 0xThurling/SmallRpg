extends Node2D

func create_grass_effect():
	var load_grass_effect = load("res://Effects/grass_effect.tscn")
	var create_grass_scene = load_grass_effect.instantiate()
	var world_scene = get_tree().current_scene
	world_scene.add_child(create_grass_scene)	
	create_grass_scene.global_position = global_position

func _on_hurtbox_area_entered(area):
	create_grass_effect()
	queue_free()
