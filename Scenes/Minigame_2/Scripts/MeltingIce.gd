extends Sprite

func _ready():
	texture = load("res://Assets/iceberg melting.png")
	pass


func _on_IceButton_pressed():
	texture = load("res://Assets/iceberg.png")
	pass
