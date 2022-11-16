extends Node

var text_prefab = preload("res://Assets/Prefabs/info_text.tscn")
var text_buffer = []

func spawn_text(position: Vector2, velocity: Vector2, text: String):
	var info_text = Text.new()
	info_text.instance = text_prefab.instance()
	add_child(info_text.instance)
	
	info_text.instance.position = position;
	info_text.instance.get_node("text").text = text
	info_text.instance.get_node("text").modulate.r = 0;
	info_text.instance.get_node("text").modulate.g = 0;
	info_text.instance.get_node("text").modulate.b = 0;
	info_text.velocity = velocity
	
	text_buffer.append(info_text)	

func _ready():
	pass

func _process(delta):
	for i in text_buffer:
		i.instance.position += i.velocity * delta
		i.lifetime -= 1
		i.instance.get_node("text").modulate.a = i.lifetime / 475.0
		
		if i.lifetime <= 0:
			i.instance.queue_free()
			text_buffer.erase(i)
