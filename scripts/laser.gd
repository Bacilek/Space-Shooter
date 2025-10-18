extends Area2D

@export var SPEED = 500

func _ready():
	# $LaserImage.scale = Vector2(0, 0) not needed after including last optional tween_property
	var tween = create_tween()
	
	# use LaserImage's scale property and change it from (0,0) to (1,1) over 1 second
	tween.tween_property($LaserImage, 'scale', Vector2(1, 1), 0.3).from(Vector2(0, 0))
	

func _process(delta):
	position.y -= SPEED * delta
