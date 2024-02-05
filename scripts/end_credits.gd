extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$player/AnimatedSprite2D.animation = "idle"
	$player/AnimatedSprite2D.play()
	
	MusicController.play_credits_music()
	
	await get_tree().create_timer(10).timeout
	
	$change_scene_animation.show()
	$change_scene_animation.transition(true)
	await get_tree().create_timer(1).timeout
	
	MusicController.turn_on_menu_music()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
