extends Node2D

@export var inside_width : int
@export var inside_height : int

var Generation

func north():
	$NorthDoor.visible = true
	$NorthWall.queue_free()

func south():
	$SouthWall.visible = true
	$SouthDoor.queue_free()

func east():
	$EastWall.visible = true
	$EastDoor.queue_free()

func west():
	$WestWall.visible = true
	$WestDoor.queue_free()
