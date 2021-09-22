extends KinematicBody2D
export var speed = 200
export var ex_room_top_limit = 405
export var ex_room_down_limit = 585
var limit = ex_room_down_limit - ex_room_top_limit
var orSize = 0.13
var downSize = 0.18
var out = true
var entered_trigger = false
var from_bath = false
var enter = false
var dir = Vector2(0,0)

func _ready():
	if Global.enter_scene == 1:
		position.x = 238.023
		position.y = 559.601
		$AnimatedSprite.flip_h = false
	elif Global.enter_scene == 2:
		$AnimatedSprite.flip_h = true
func _physics_process(delta):
	dir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	dir.y = 0.6*int(Input.is_action_pressed("ui_down")) - 0.6*int(Input.is_action_pressed("ui_up"))
	$AnimatedSprite.animation = String(int(dir.length()>0))
	$AnimatedSprite.flip_h = dir.x<0 || $AnimatedSprite.flip_h && dir.x==0
	move_and_slide(dir.normalized()*speed*int(dir.length()>0))
	scale.x = (0.5 - (ex_room_down_limit - position.y)/limit) * (downSize - orSize) + orSize 
	scale.y = (0.5 - (ex_room_down_limit - position.y)/limit) * (downSize - orSize) + orSize 
