extends Sprite

func _ready():
	texture = load("res://Assets/Trash.png")
	pass


#func _process(delta):
#	pass


func _on_TrashButton1_pressed():
	queue_free()
	pass
