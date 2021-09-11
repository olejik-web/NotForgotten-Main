extends Node

var load_scene
var queue
var i = 0
func _ready():
	queue = preload("res://scripts/resource_queue.gd").new()
	queue.start()
	if Global.enter_scene == 1:
		queue.queue_resource("res://Room.tscn", true)
	elif Global.enter_scene == 2:
		queue.queue_resource("res://Room2.tscn", true)
func _process(delta):
	if Global.enter_scene == 1:
		if queue.is_ready("res://Room.tscn"):
			set_new_scene(queue.get_resource("res://Room.tscn"))
	elif Global.enter_scene == 2:
		if queue.is_ready("res://Room2.tscn"):
			set_new_scene(queue.get_resource("res://Room2.tscn"))
	$logo.scale.x = $logo.sz*cos(deg2rad(i))
	i=(i+5)%360
func set_new_scene(res):
	Global.get_scene(res)
