extends Area2D
export var speed = 200
export var ex_room_top_limit = 405
export var ex_room_down_limit = 585
var limit = ex_room_down_limit - ex_room_top_limit
var orSize = 0.13
var downSize = 0.18
var out
var entered_trigger = false
var from_bath = false
var movement = false

func _ready():
	if Global.enter_scene == 1:
		position.x = 238.023
		position.y = 559.601
		$AnimatedSprite.flip_h = false
	elif Global.enter_scene == 2:
		$AnimatedSprite.flip_h = true
		
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		if position.y > ex_room_top_limit:
			velocity.y -= 0.6
		$AnimatedSprite.animation = "walk"
		movement = true
	if Input.is_action_pressed("ui_down"):
		if position.y < ex_room_down_limit:
			velocity.y += 0.6
		$AnimatedSprite.animation = "walk"
		movement = true
	scale.x = (0.5 - (ex_room_down_limit - position.y)/limit) * (downSize - orSize) + orSize 
	scale.y = (0.5 - (ex_room_down_limit - position.y)/limit) * (downSize - orSize) + orSize 
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite.animation = "walk"
		movement = true
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite.animation = "walk"
		movement = true
		$AnimatedSprite.flip_h = true
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$CollisionShape2D.position=velocity
	if out:
		print("out")
		if not movement:
			$AnimatedSprite.animation = "stand"
		elif $AnimatedSprite.animation == "stand":
			$AnimatedSprite.animation = "walk"
		if velocity.x < 0:
			$AnimatedSprite.flip_h = true
		elif velocity.x > 0:
			$AnimatedSprite.flip_h = false
		position += velocity * delta
	else:
		if not movement:
			$AnimatedSprite.animation = "stand"
		elif $AnimatedSprite.animation == "stand":
			$AnimatedSprite.animation = "walk"
	movement = false
	print($AnimatedSprite.animation, movement)
	$AnimatedSprite.play()
