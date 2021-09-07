extends Node

var current_scene = null
var enter_scene = 0
var Loader = ResourceLoader.load("res://Loader.tscn")

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func get_loader():
	current_scene.free()
	current_scene = Loader.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func get_scene(scene):
		current_scene.free()
		current_scene = scene.instance()
		get_tree().get_root().add_child(current_scene)
		get_tree().set_current_scene(current_scene)

func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
