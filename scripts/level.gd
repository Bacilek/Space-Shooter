extends Node2D

# 1. load scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_meteor_timer_timeout() -> void:
	# 2. create instance of the loaded scene 
	var meteor = meteor_scene.instantiate()
	# 3. attach the node/instance to the scene
	$Meteors.add_child(meteor)


func _on_player_laser(position) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = position
		
	
