extends CanvasLayer

# Variable for the SettingsMenu node
@onready var settings = $SettingsMenu

# Variable for the CreditsPage node
@onready var credits = $CreditsPage

# Whether to display the settings page or not
var display_settings = false

# Whether to display the credits page or not
var display_credits = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if GameSettings.running:
		GameSettings.load_game()
		GameSettings.running = !GameSettings.running
	MusicController.play_menu_music()
	$player/AnimatedSprite2D.animation = "idle"
	$player/AnimatedSprite2D.play()

# Handle when the start button is pressed
func _on_start_button_pressed():
	$player/AnimatedSprite2D.animation = "jump"
	$player/AnimatedSprite2D.play()
	
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")

# Handle when the settings button is pressed
func _on_settings_button_pressed():
	settings_menu()

# Open the settings menu and pause the game
func settings_menu():
	if display_settings:
		settings.hide()
		Engine.time_scale = 1
	else:
		settings.show()
		Engine.time_scale = 0
	
	display_settings = !display_settings

# Handle when the credits button is pressed
func _on_credits_pressed():
	credits_menu()

# Open the credits page and pause the game
func credits_menu():
	if display_credits:
		credits.hide()
		Engine.time_scale = 1
	else:
		credits.show()
		Engine.time_scale = 0
		
	display_credits = !display_credits

# Handle when the quit button is pressed
func _on_quit_button_pressed():
	GameSettings.quit_game()
