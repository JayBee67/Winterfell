extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var anim: Animation
var max_rotation: float
var min_rotation: float


func _ready() -> void:
	var anim_name = animation_player.get_animation("swing")
	randomize()
	min_rotation = randf_range(-40.0, -85.0)
	max_rotation = abs(min_rotation)
	anim_name.track_insert_key(0, 0.0, 0)
	anim_name.track_set_key_value(0, 0, deg_to_rad(min_rotation))
	anim_name.track_insert_key(0, 1.5, 1)
	anim_name.track_set_key_value(0, 1, deg_to_rad(max_rotation))
