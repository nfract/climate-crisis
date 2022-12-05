extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = load("res://Assets/Tree_Stump.png")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WoodsButton_pressed():
	texture = load("res://Assets/Tree1.png")
	pass # Replace with function body.
