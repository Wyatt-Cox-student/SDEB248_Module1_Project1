extends CanvasLayer

@onready var label = $ItemCountLabel
@onready var player = get_parent().get_node("Player")

func _ready():
	update_ui()

func update_ui():
	label.text = "Items: %d" % player.items_collected
