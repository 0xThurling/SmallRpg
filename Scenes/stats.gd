extends Node

@export var max_health = 4
@onready var health = max_health:
	get:
		return health
	set(value):
		health = value
		emit_signal("health_change", value)
		if health <= 0:
			emit_signal("no_health")

signal no_health
signal health_change(value)
