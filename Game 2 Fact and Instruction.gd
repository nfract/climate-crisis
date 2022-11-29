extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/start".grab_focus()

func _on_start_pressed():
	get_tree().change_scene("res://Minigame 2.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
