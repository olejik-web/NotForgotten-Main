extends Node

var load_scene = null

func _ready():
	if Global.enter_scene == 1:
		load_scene = ResourceLoader.load_interactive('res://Room.tscn')
	elif Global.enter_scene == 2:
		load_scene = ResourceLoader.load_interactive('res://Room2.tscn')

func _process(delta):
	if load_scene.poll() == ERR_FILE_EOF:
		var resource = load_scene.get_resource()
		load_scene = null
		Global.get_scene(resource)
	else:
		$AnimatedSprite.play()
