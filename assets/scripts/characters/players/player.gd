class_name Player extends CharacterBody2D

var gravity: float = 1000.0
var max_horizontal_speed: float = 140.0
var max_horizontal_acceleration: float = 400
var jump_force: float = 300.0
var jump_termination_multiplier: int = 3


func _process(delta: float) -> void:
	var move_vector = get_movement_vector()
	
	velocity.x += move_vector.x * max_horizontal_acceleration * delta
	if (move_vector.x == 0):
		velocity.x = lerp(0.0, velocity.x, pow(2 , -20 * delta))
	
	velocity.x = clamp(velocity.x, -max_horizontal_speed, max_horizontal_speed)
	
	if (move_vector.y < 0 && is_on_floor()):
		velocity.y = move_vector.y * jump_force
	
	if (velocity.y < 0 && !Input.is_action_pressed("jump")):
		velocity.y += gravity * jump_termination_multiplier * delta
	else:
		velocity.y += gravity * delta
	
	move_and_slide()
	
	update_animation()


func get_movement_vector() -> Vector2:
	var move_vector: Vector2 = Vector2.ZERO
	move_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_vector.y = -1 if (Input.is_action_just_pressed("jump")) else 0
	return move_vector


func update_animation() -> void:
	var move_vector = get_movement_vector()
	
	if (!is_on_floor()):
		$AnimatedSprite2D.play("jump")
	elif (move_vector.x != 0):
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	
	if (move_vector.x != 0):
		$AnimatedSprite2D.flip_h = false if move_vector.x > 0 else true
