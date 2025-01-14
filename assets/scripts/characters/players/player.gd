extends CharacterBody2D


func _physics_process(delta: float) -> void:
	velocity.y += 500 * delta
	move_and_slide()
