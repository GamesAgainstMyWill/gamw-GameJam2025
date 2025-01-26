extends CharacterBody2D

const SPEED = 50

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	$AnimatedSprite2D.play("walking_med")

func _physics_process(delta):
	if player.global_position.x < global_position.x:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()

func make_path():
	nav_agent.target_position = player.global_position

func _on_timer_timeout():
	make_path()
