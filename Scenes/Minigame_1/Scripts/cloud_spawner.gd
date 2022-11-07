# ----------------------------------------------------------------------------
# Author:  Brandon
# Purpose: Contains the cool scrolling clouds background
#-----------------------------------------------------------------------------
extends Node

export var cloud_count            = 40;
export var max_cloud_count        = 70;
export var cloud_min_spawn_height = 300;
export var cloud_max_spawn_height = 500;

var cloud_prefab = preload("res://Assets/Prefabs/cloud.tscn")
var active_clouds = []
var current_cloud_count = 0;

var random = RandomNumberGenerator.new()
	
# Generates a cloud
# position = position of cloud
# velocity = velocity of cloud
# scale    = size of cloud
func generate_cloud(position: Vector2, velocity: Vector2, scale: Vector2):
	var cloud = Cloud.new()
	cloud.instance = cloud_prefab.instance()
	cloud.velocity = velocity
	cloud.instance.position = position;
	cloud.instance.scale = scale;
	cloud.instance.z_index = -1
	
	add_child(cloud.instance)
	active_clouds.append(cloud)

func _ready():
	for i in cloud_count:
		var random_scale = random.randf_range(1.0, 1.8);
		generate_cloud(Vector2(random.randf_range(-400, 400), random.randf_range(-cloud_max_spawn_height, -cloud_min_spawn_height)), 
					   Vector2(random.randf_range(10, 60), 0), 
					   Vector2(random_scale, random_scale))
	current_cloud_count = cloud_count

func _process(delta):
	for i in active_clouds:
		i.instance.position += i.velocity * delta;
		
		# If cloud goes out of bounds then spawn a new cloud
		if i.instance.position.x > 400:
			
			# Limits the amount of clouds that can be on screen at one time "max_cloud_count"
			if current_cloud_count < max_cloud_count:		
				var random_scale = random.randf_range(1.0, 1.5);
				generate_cloud(Vector2(-400, random.randf_range(-cloud_max_spawn_height, -cloud_min_spawn_height)), 
							   Vector2(random.randf_range(10, 60), 0), 
							   Vector2(random_scale, random_scale))
				current_cloud_count += 1
					
			# Delete the cloud that is out of bounds	
			active_clouds.erase(i)
			i.instance.queue_free()
			current_cloud_count -= 1
		pass
