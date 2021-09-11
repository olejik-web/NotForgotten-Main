extends Node

var load_scene
func _ready():
	if Global.enter_scene == 1:
		goto_scene('res://Room.tscn')
	elif Global.enter_scene == 2:
		goto_scene('res://Room2.tscn')

func goto_scene(path):
	load_scene = ResourceLoader.load_interactive(path)
	#$logo.play("walk")

func _process(delta):
	if load_scene == null:
		$logo.set_process(true)
		set_process(false)
		return 
	while true:
		var err = load_scene.poll()
		if err == ERR_FILE_EOF:
			var resource = load_scene.get_resource()
			load_scene = null
			set_new_scene(resource)
			break
func set_new_scene(res):
	Global.get_scene(res)
	#$logo.set_process(false)
