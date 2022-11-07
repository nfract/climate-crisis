# ----------------------------------------------------------------------------
# Author:  Brandon
# Date:    11/07/22
# Purpose: Generate seeds at a certain initial height then save those seeds into
#		   an array. Then perform any processing on those seeds
#-----------------------------------------------------------------------------

extends Node

# Seed count and distance between each seed
export var seed_count = 16.0
export var seed_delta = 36.0

var seed_prefab = preload("res://Assets/Prefabs/seed.tscn")
var seeds = []

var seed_position = Vector2(0.0, -75.0)

func spawn_seeds():
		# Spawn middle seed and right seeds
	for i in seed_count / 2:
		var ins_seed = seed_prefab.instance()
		ins_seed.z_index = -1;
		ins_seed.position = Vector2(seed_delta * i, 0.0) + seed_position
		
		add_child(ins_seed)
		seeds.append(ins_seed)
		
	# Spawn left seeds
	for i in range(1, seed_count / 2):
		var ins_seed = seed_prefab.instance()
		ins_seed.z_index = -1;
		ins_seed.position = Vector2(-seed_delta * i, 0.0) + seed_position
		
		add_child(ins_seed)
		seeds.append(ins_seed)

func _ready():
	spawn_seeds()

func _process(delta):
	# Iterate over all seeds that have been spawned
	for i in seeds:
		# Get the CollisionShape2D node that contains the script for the seed
		var collision_node = i.get_node("area2d").get_node("collisionshape2d")
		
		if collision_node.seed_clicked == true:
			print("Clicked seed with ID=" + str(i))
			collision_node.seed_clicked = false
			i.queue_free()
			seeds.erase(i)
	pass
