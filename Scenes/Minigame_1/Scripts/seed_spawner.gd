extends Node

var seed_prefab = preload("res://Assets/Prefabs/seed.tscn")
var seeds = []

onready var _player = get_parent().get_node("player")

# Spawn a line of seeds
# count    = number of seeds to spawn
# delta    = distance between each seed
# position = relative position of each seed
func spawn_seeds(count, delta: Vector2, position: Vector2):
	# Spawn middle seed and right seeds
	for i in count / 2:
		var instance = seed_prefab.instance()
		instance.z_index = -1;
		instance.position = i * delta + position
		
		add_child(instance)
		seeds.append(instance)
		
	# Spawn left seeds
	for i in range(1, count / 2):
		var instance = seed_prefab.instance()
		instance.z_index = -1;
		instance.position = i * -delta + position
		
		add_child(instance)
		seeds.append(instance)

func _ready():
	spawn_seeds(16, Vector2(36, 0), Vector2(0, -70))

func _process(delta):
	# Iterate over all seeds that have been spawned
	for i in seeds:
		# Get the CollisionShape2D node that contains the script for the seed
		var collision_node = i.get_node("area2d").get_node("collisionshape2d")
		
		# Call the player callback function "on_seed_clicked(..)"
		if collision_node.clicked == true:
			if (_player.on_seed_clicked(seeds.find(i), i, seeds.size())):
				i.queue_free()
				seeds.erase(i)
			
			collision_node.clicked = false
	pass
