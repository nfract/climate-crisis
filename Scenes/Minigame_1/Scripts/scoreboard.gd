extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var label = get_parent().get_parent().get_node("label")

# Called when the node enters the scene tree for the first time.
func _ready():
	label.set_text("hi")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
