extends Node2D

# 1. load scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	# 2. create instance of the loaded scene 
	var meteor = meteor_scene.instantiate()
	
	# 3. attach the node/instance to the scene
	$Meteors.add_child(meteor)
