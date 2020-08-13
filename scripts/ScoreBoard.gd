extends Node2D


var game_start_time: int = 0
var score: int = 0
var timer: int = 0
var high_score: int = 0
var high_time: int = 0
var elapsed_time: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	game_start_time = OS.get_unix_time()
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Track elapsed game time
	var time_now: int = OS.get_unix_time()
	elapsed_time = time_now - game_start_time
	
	# Update elapsed time
	#get_node("../ScoreBoard/ElapsedTimeValue").text = str(elapsed_time)
	$ElapsedTimeValue.text = str(elapsed_time)
	
