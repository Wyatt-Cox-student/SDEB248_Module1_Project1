extends Area2D

@export var value: int = 1

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	
func _on_body_entered(body):
	if body.name == "Player": #Only the player can pick up the item
		body.collect_items(value)
		queue_free() # remove the item when picked up
		
