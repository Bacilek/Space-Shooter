extends Area2D

@export var SPEED = 500


func _process(delta):
	position.y -= SPEED * delta
