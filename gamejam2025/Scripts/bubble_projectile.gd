extends Node2D

const SPEED = 300

func _ready():
	$AnimatedSprite2D.play("bubble_float")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * SPEED * delta
