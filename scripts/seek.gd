extends Node

var current_scene = null
var pos_x = 0
var pos_y = 0

func _process(delta):
	$Player.out = not $Player.overlaps_area($Colliders)
	if $Player.overlaps_area($Colliders):
		$Player.position.x = pos_x
		$Player.enter = true
	else:
		pos_x = $Player.position.x
	if $Player.overlaps_area($DoorTrigger):
		Global.enter_scene = 2
		Global.get_loader()
