extends Node2D

@onready var pause_menu = $PauseMenu

# Next scene to change to
@export var next_level : String = "res://scenes/level_3_4.tscn"

# If the player has displayed the pause menu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Level set up
	MusicController.play_world_3_music()
	$player.position = Vector2(24,608)
	
	# Connect flag_pole's level_finished signal to the scene_transistion function
	var emitter = get_node("flag_pole")
	emitter.level_finished.connect(scene_transistion)
	
	# Scene change animation
	$change_scene_animation.transition(false)
	await get_tree().create_timer(.75).timeout
	$change_scene_animation.hide()
	
# Play the scene change animation and change to the next scene
func scene_transistion():
	
	$change_scene_animation.show()
	$change_scene_animation.transition(true)
	await get_tree().create_timer(1).timeout
	MusicController.play_world_3_music()
	get_tree().change_scene_to_file(next_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("pause_game"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
