extends Control

@export var action_items : Array[String]

# Variables for nodes in the scene
@onready var volume_slider = $TabContainer/Settings/MarginContainer/ScrollContainer/VBoxContainer/MarginContainer/VolumeContainer/VolumeSlider
@onready var unlock_levels_button = $TabContainer/Cheats/MarginContainer/ScrollContainer/VBoxContainer/UnlockLevelsButton
@onready var main = $"../"

# Called when the node enters the scene tree for the first time.
func _ready():
	volume_slider.value = MusicController.get_music_volume()
	
	if PlayerStats.levels_completed == 16:
		unlock_levels_button.button_pressed = true
	else:
		unlock_levels_button.button_pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	MusicController.set_music_volume(volume_slider.value)

# Handle when the back button is pressed
func _on_back_button_pressed():
	main.settings_menu()

# Handle when the full screen button is toggled
func _on_full_screen_button_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Handle when the vsync button is toggled
func _on_vsync_button_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

# Handle when the unlock levels button is toggled
func _on_unlock_levels_button_toggled(toggled_on):
	if toggled_on:
		PlayerStats.levels_completed = 16
	else:
		PlayerStats.levels_completed = 0

# Handle when the delete save button is pressed
func _on_delete_save_button_pressed():
	PlayerStats.reset()
	GameSettings.save_game()
