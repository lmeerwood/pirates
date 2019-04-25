extends KinematicBody2D

const TURN_SPEED = 100
const MAX_SPEED = 150
const ACC = 10
const DEC = 0.01

var motion = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= TURN_SPEED * delta
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += TURN_SPEED * delta
	
	var movedir = Vector2(1,0).rotated(rotation)
	
	if Input.is_action_pressed("ui_up"):
		motion += movedir * ACC
		if motion.length() > MAX_SPEED:
			motion = motion.normalized() * MAX_SPEED
	else: 
		motion = motion.linear_interpolate(Vector2(0, 0), DEC)
	
	move_and_slide(motion)
	
	

