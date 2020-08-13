extends Node2D


# Declare member variables here. Examples:
var shell_scene = load("res://Shell.tscn")

var shell1a_texture = preload("res://assets/images/shell1a.png")
var shell1b_texture = preload("res://assets/images/shell1b.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	new_shell()



func new_shell():
	var shell = shell_scene.instance()
	shell.set_position(Vector2(800, 250))

	#shell.sprite.texture = shell1b_texture
	add_child(shell)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#new_shell()
	pass
