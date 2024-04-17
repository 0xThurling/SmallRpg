extends Control

@onready var heart_ui_full = $HeartUIFull
@onready var heart_ui_empty = $HeartUIEmpty

var hearts = 4:
	get:
		return hearts
	set(value):
		hearts = clamp(value, 0, max_hearts)

var max_hearts = 4:
	get:
		return max_hearts
	set(value):
		max_hearts = max(value, 1);

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heart_ui_full != null:
		heart_ui_full.size.x = hearts * 15
	if hearts == 0:
		heart_ui_full.visible = false

func set_max_heart_size():
	if heart_ui_empty != null:
		heart_ui_empty.size.x = max_hearts * 15

func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	set_max_heart_size()
	PlayerStats.connect("health_change", Callable(self, "set_hearts"))
