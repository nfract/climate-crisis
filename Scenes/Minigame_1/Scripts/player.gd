extends Camera2D

var timer = 0

onready var temperature = get_parent().get_node("ui").get_node("temperature")
onready var text_spawner = get_parent().get_node("text_spawner")

func _ready():
	pass 

func _process(delta):
	
	pass

# Called whenever the player clicks a seed
# id      = id of the seed that was clicked
# intance = the seed that was clicked
# return true  = delete seed
# return false = keep seed
func on_seed_clicked(id, instance: Node2D, seeds_left):
	print(seeds_left)
	
	if (temperature.current_phase == temperature._PHASE_MODERATE):
		Global.score -= 1
		text_spawner.spawn_text(Vector2(-325, -300), Vector2(0, -16.4), "The temperature is currently moderate!")
		return false
	else:
		Global.score += 1
		text_spawner.spawn_text(Vector2(-325, -300), Vector2(0, -16.4), "Good job! You saved a seed!")
		return true
