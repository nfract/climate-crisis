# ----------------------------------------------------------------------------
# Author:  Brandon
# Date:    11/07/22
# Purpose: Determines when a seed has been clicked and contains properties
#          relating to a seed.   
#-----------------------------------------------------------------------------

extends CollisionShape2D

export var seed_clicked = false

func _ready():
	pass

func _process(delta):
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("cc_left_click"):
		seed_clicked = true
