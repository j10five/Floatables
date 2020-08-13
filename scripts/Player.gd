extends KinematicBody2D


# Set game variables
export var speed: int = 200
#var splash_sound = preload("res://assets/sounds/splash.wav")  # unclear whether this is required, if wav is dropped onto the AudioStreamPlayer2D node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func hit(object):
	print("player detected collision")
	#$AudioStreamPlayer2D.stream = splash_sound
	$AudioStreamPlayer2D.play()




# Update physics that apply to the player object
func _physics_process(delta):
	# Get player input
	var direction = Vector2()
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	# Apply movement and collision
	var collision = move_and_collide(speed * direction * delta)
	# move_and_collide returns NULL if there is no collision, so you have to check for a collision before you can put logic around it
	if collision:
		if collision.collider.is_in_group("shells"):
			hit(collision.collider)
