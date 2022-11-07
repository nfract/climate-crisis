# ----------------------------------------------------------------------------
# Author:  Brandon
# Purpose: Contains player related functions and properties
#-----------------------------------------------------------------------------
extends Camera2D

var timer = 0

func _ready():
	pass 

func _process(delta):
	
	# Blah blah blah blah blah branch test
	
	# Example code of a timer that will run every 1 second
	timer += delta
	if timer * 1000 >= 1 * 1000:
		print("1 second has passed")
		timer = 0
	
	pass

# Called whenever the player clicks a seed
# id      = id of the seed that was clicked
# intance = the seed that was clicked
# return true  = delete seed
# return false = keep seed
func on_seed_clicked(id, instance: Node2D):
	#print("Hello world" + str(id))
	Global.score += 1
	print(Global.score)
	return true
