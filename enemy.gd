extends CharacterBody2D

@export var speed: float = 50.0
@export var gravity: float = 1400.0
@export var can_move: bool = false

# Start direction: -1 = left, +1 = right
@export var direction: int = -1

func _physics_process(delta: float) -> void:
	if not can_move:
		return
	# simple gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0.0

	# horizontal pacing
	velocity.x = direction * speed

	# try moving
	move_and_slide()
	# 1) hit a wall? flip direction
	if is_on_wall():
		_flip()

func _flip() -> void:
	direction = -direction
