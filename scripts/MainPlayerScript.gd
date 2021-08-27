extends Area2D
export var speed = 200
export var ex_room_top_limit = 405
export var ex_room_down_limit = 585
var limit = ex_room_down_limit - ex_room_top_limit
var orSize = 0.13
var downSize = 0.18


func _process(delta):
	var velocity = Vector2()
	if position.y > ex_room_top_limit:
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 0.6
	if position.y < ex_room_down_limit:
		if Input.is_action_pressed("ui_down"):
			velocity.y += 0.6
	scale.x = (0.5 - (ex_room_down_limit - position.y)/limit) * (downSize - orSize) + orSize 
	scale.y = (0.5 - (ex_room_down_limit - position.y)/limit) * (downSize - orSize) + orSize 
	print("x:", position.x, "y:", position.y)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if velocity.length() != 0:
		$AnimatedSprite.animation = "walk"
	else:
		$AnimatedSprite.animation = "stand"
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite.flip_h = false
	$AnimatedSprite.play()
	position.y  = min(max(position.y + velocity.y * delta,ex_room_top_limit),ex_room_down_limit)
	position.x += velocity.x * delta
