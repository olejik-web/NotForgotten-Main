extends Node

var current_scene = null

func _process(delta):
	$Player.out = $Player.overlaps_area($Floor)
	if $Player.overlaps_area($DoorTrigger):
		Global.enter_scene = 2
		Global.goto_scene("res://Loader.tscn")
