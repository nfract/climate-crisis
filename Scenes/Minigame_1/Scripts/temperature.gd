extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var coolTimer = Timer.new()
var hotTimer = Timer.new()

func _set_hot_timer():
	#hotTimer = Timer.new()
	hotTimer.set_wait_time(3) #wait for 3 seconds
	hotTimer.connect("timeout",self,"_change_to_cool")
	add_child(hotTimer)

func _set_cool_timer():
	#coolTimer = Timer.new()
	coolTimer.set_wait_time(5) #wait for 5 seconds
	coolTimer.connect("timeout",self,"_change_to_hot") 
	add_child(coolTimer) 

func _change_to_hot():
	coolTimer.stop()
	_set_hot_timer()
	texture = load("res://Assets/Hot_Temp_Sprite.png")
	hotTimer.start()

func _change_to_cool():
	hotTimer.stop()
	_set_cool_timer()
	texture = load("res://Assets/Moderate_Temp_Sprite.png")
	coolTimer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	_change_to_cool() 
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
