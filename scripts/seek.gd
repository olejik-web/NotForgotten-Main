extends Node
func _process(delta):
	$Player.out = $Player.overlaps_area($Floor)
