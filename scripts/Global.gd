extends Node

var current_scene = null
var enter_scene = 0

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func get_loader():
	current_scene.free()
	current_scene = ResourceLoad.Loader.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func get_scene(scene):
		current_scene = scene.instance()
		get_tree().get_root().add_child(current_scene)
		get_tree().set_current_scene(current_scene)
