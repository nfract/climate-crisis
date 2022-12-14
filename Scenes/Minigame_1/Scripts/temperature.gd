extends Sprite

enum { _PHASE_HOT, _PHASE_MODERATE }

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var coolTimer = Timer.new()
var hotTimer = Timer.new()
var rng = RandomNumberGenerator.new()
var current_phase = _PHASE_MODERATE
var time

func _set_hot_timer():
	#hotTimer = Timer.new()
	hotTimer.set_wait_time(3) #wait for 3 seconds
	hotTimer.connect("timeout",self,"_change_to_cool")
	add_child(hotTimer)

func _set_cool_timer():
	#coolTimer = Timer.new()
	coolTimer.set_wait_time(time) #wait for 5 seconds
	coolTimer.connect("timeout",self,"_change_to_hot") 
	add_child(coolTimer) 

func _change_to_hot():
	coolTimer.stop()
	_set_hot_timer()
	texture = load("res://Assets/Hot_Temp_Sprite.png")
	current_phase = _PHASE_HOT
	hotTimer.start()

func _change_to_cool():
	hotTimer.stop()
	_set_cool_timer()
	texture = load("res://Assets/Moderate_Temp_Sprite.png")
	current_phase = _PHASE_MODERATE
	coolTimer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	time = rng.randi_range(3,10)
	print ("Time is: ", time)
	_change_to_cool() 
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
