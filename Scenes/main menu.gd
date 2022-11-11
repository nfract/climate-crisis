extends Control



func _ready():
	$"VBoxContainer/game 1".grab_focus()


func _on_game_1_pressed():
	get_tree().change_scene("res://Game 1 Fact and Instruction.tscn")
