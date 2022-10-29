extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var speed = 400
var screensize


# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2() #movement vector
	
	#motion detection
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$monkSprites.play()
	else:
		$monkSprites.animation = "meditate"
		
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if velocity.x != 0:
		$monkSprites.animation = "runRight"
		$monkSprites.flip_v = false
		$monkSprites.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$monkSprites.animation = "jumpUp"
	elif velocity.y > 0:
		$monkSprites.animation = "jumpDown"
	
	
	
		
		
		
