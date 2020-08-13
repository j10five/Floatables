extends KinematicBody2D

var direction = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Area2D.connect("area_entered", self, "hit")
	direction.x = -100


func hit(object):
	print("shell detected collision")
	object.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Move object and detect collisions
func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	# move_and_collide returns NULL if there is no collision, so you have to check for a collision before you can put logic around it
	if collision:
		if collision.collider.is_in_group("players"):
			# Return shell object so it can destroy itself
			hit(self)
	

