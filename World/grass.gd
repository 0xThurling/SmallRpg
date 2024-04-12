extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var load_grass_effect = load("res://Effects/grass_effect.tscn")
		var create_grass_scene = load_grass_effect.instantiate()
		
		var world_scene = get_tree().current_scene
		world_scene.add_child(create_grass_scene)
		
		create_grass_scene.global_position = global_position
		
		queue_free()
