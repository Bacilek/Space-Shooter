extends CharacterBody2D

@export var SPEED: int = 600
var can_shoot: bool = true

signal laser(position)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)

var rng := RandomNumberGenerator.new()

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
		
		var sounds = [$LaserSounds/LaserSound1, $LaserSounds/LaserSound2]
		var sound_to_play = sounds[rng.randi_range(0, sounds.size() - 1)]
		sound_to_play.play()

func play_collision_sound():
	$DamageSound.play()


func _on_laser_timer_timeout() -> void:
	can_shoot = true
