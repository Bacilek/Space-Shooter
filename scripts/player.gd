extends CharacterBody2D

@export var SPEED: int = 600
var can_shoot: bool = true

signal laser(position)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()

	# shoot input
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)  # emit custom signal 
		can_shoot = false
		$LaserTimer.start()

func _on_laser_timer_timeout() -> void:
	can_shoot = true
