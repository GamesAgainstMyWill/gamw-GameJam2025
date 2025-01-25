extends CharacterBody2D


const MAX_SPEED: int = 125
const ACCELERATION: int = 1400
const FRICTION: int = 1000
 
 
func _process(delta):
	if get_global_mouse_position().x < global_position.x:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
 
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity.x = move_toward(velocity.x, MAX_SPEED * direction.x, ACCELERATION * delta)
		velocity.y = move_toward(velocity.y, MAX_SPEED * direction.y, ACCELERATION * delta)
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, MAX_SPEED * direction.x, FRICTION * delta)
		velocity.y = move_toward(velocity.y, MAX_SPEED * direction.y, FRICTION * delta)
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
