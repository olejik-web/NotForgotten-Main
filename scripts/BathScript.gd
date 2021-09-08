extends Node

var pos_x = 0
var pos_y = 0

func _process(delta):
	if $Player/Area2D.overlaps_area($DoorTrigger):
		Global.enter_scene = 1
		Global.get_loader()
