extends Node2D

const BUBBLE_PROJECTILE = preload("res://Scenes/bubble_projectile.tscn")
var facing_right = false

func _ready():
	$Sprite2D/AnimatedSprite2D.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
		facing_right = false
	else:
		scale.y = 1
		facing_right = true
	
	if Input.is_action_just_pressed("attack"):
		$Sprite2D/AnimatedSprite2D.visible = true
		$Sprite2D/AnimatedSprite2D.play("bubble_fire")

func _on_animated_sprite_2d_animation_finished():
	$Sprite2D/AnimatedSprite2D.visible = false
	var bubble_inst = BUBBLE_PROJECTILE.instantiate()
	get_tree().root.add_child(bubble_inst)
	if !facing_right:
		bubble_inst.scale.y = -1
	else:
		bubble_inst.scale.y = 1
	
	bubble_inst.global_position = global_position
	bubble_inst.rotation = rotation
