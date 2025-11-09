extends CanvasLayer

@onready var button = $Button
@onready var panel = $Panel
@onready var player = get_parent().get_node("Player")

func _ready():
	# show cutscene at the start
	panel.visible = true
	button.visible = true
	button.pressed.connect(_on_button_pressed)
	
	#disable player movement
	if player: 
		player.can_move = false
	
func _on_button_pressed():
	#hide cutscene when button pressed
	panel.visible = false
	button.visible = false
	visible = false
	
	# enable players movement
	if player:
		player.can_move = true
		for npc in get_tree().get_nodes_in_group("npc"):
			npc.can_move = true
