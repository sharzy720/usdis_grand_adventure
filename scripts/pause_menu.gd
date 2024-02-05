extends Control

# Variable for the previous scene
@onready var main = $"../"

# Handle when the resume button is pressed
func _on_resume_pressed():
	main.pauseMenu()

# Handle when the level select button is pressed
func _on_level_select_pressed():
	# Turn off the pause menu before changing scenes
	main.pauseMenu()
	MusicController.turn_on_menu_music()
	PlayerStats.reset_level_score()
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

# Handle when the quit button is pressed
func _on_quit_pressed():
	GameSettings.quit_game()
