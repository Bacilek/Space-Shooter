extends Node2D

# 1. load scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")


func _ready():
	# stars
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars.get_children():
		# position
		var random_x = rng.randi_range(0, int(size.x))
		var random_y = rng.randi_range(0, int(size.y))
		star.position = Vector2(random_x, random_y)
		
		# scale
		var random_scale = rng.randf_range(1, 2)
		star.scale = Vector2(random_scale, random_scale)
		
		# animation speed
		star.speed_scale = rng.randf_range(0.6, 1.4)


func _on_meteor_timer_timeout() -> void:
	# 2. create instance of the loaded scene 
	var meteor = meteor_scene.instantiate()
	# 3. attach the node/instance to the scene
	$Meteors.add_child(meteor)


func _on_player_laser(position) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = position
		
	
