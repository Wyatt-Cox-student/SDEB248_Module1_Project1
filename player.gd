extends RigidBody2D

var accelercation : float = 20.0
var UpForce : float = -385

@onready var sprite = $AnimatedSprite2D

var is_jumping = false # jump state
var can_move = true
var items_collected: int = 0

func _ready() -> void:
	pass	


func _physics_process(delta: float) -> void:
	if not can_move:
		return
	
	if Input.is_action_pressed("forward"):
		apply_central_impulse(Vector2(accelercation, 0.5))
		if not is_jumping:
			sprite.animation = "Walk"
	elif Input.is_action_pressed("backward"):	
		apply_central_impulse(Vector2(-accelercation, 0.5))
		if not is_jumping:
			sprite.animation = "Walk"
	else:
		apply_central_impulse(Vector2.ZERO)
		if not is_jumping:
			sprite.animation = "Idle"

	if Input.is_action_just_pressed("jump") and not is_jumping:
		apply_central_impulse(Vector2(0, UpForce))
		sprite.animation = "Jump"
		is_jumping = true
		# wait, then go to idle
		await get_tree().create_timer(0.5).timeout
		is_jumping = false
		sprite.animation = "Idle"
		
func collect_items(amount: int) -> void:
	items_collected += amount
	update_ui()
	
func update_ui():
	var ui = get_parent().get_node("UI")
	if ui:
		ui.update_ui()
	
