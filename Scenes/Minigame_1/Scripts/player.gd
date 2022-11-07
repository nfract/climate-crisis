# ----------------------------------------------------------------------------
# Author:  Brandon
# Purpose: Contains player related functions and properties
#-----------------------------------------------------------------------------
extends Camera2D

func _ready():
	pass 

func _process(delta):
	pass

# Called whenever the player clicks a seed
# id      = id of the seed that was clicked
# intance = the seed that was clicked
# return true  = delete seed
# return false = keep seed
func on_seed_clicked(id, instance: Node2D):
	print("Hello world" + str(id))
	return false
