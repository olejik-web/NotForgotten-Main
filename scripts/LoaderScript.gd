extends Node


func _process(delta):
	if Global.enter_scene == 2:
		Global.goto_scene("res://Room2.tscn")
	elif Global.enter_scene == 1:
		Global.goto_scene("res://Room.tscn")
