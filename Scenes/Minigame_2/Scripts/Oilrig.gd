extends Sprite

func _ready():
	texture = load("res://Assets/Oil_Pump.png")
	pass 

func _on_OilrigButton1_pressed():
	texture = load("res://Assets/Nuclear_Reactor.png")
	
	# Used to ensure it is properly position to the original size of the oil rig and position
	scale = Vector2(0.1, 0.1)
	position = Vector2(35, 10)

	pass
