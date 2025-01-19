extends Node2D

enum Spike { TYPE1, TYPE2 }

@export var spike_type: Spike


func _ready() -> void:
	if (spike_type == Spike.TYPE1):
		$Sprite2D.texture = load("res://assets/graphics/spikes/tile_0122.png")
	elif (spike_type == Spike.TYPE2):
		$Sprite2D.texture = load("res://assets/graphics/spikes/tile_0183.png")
