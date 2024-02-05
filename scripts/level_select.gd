extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_menu_music()
	
	# Unlock the next level only when the player has beaten all previous levels
	
	if PlayerStats.levels_completed >= 0:
		$HBoxContainer/VBoxContainer/MarginContainer/VBoxContainer/w1_1_button.disabled = false
		
	if PlayerStats.levels_completed >= 1:
		$HBoxContainer/VBoxContainer/MarginContainer/VBoxContainer/w1_2_button.disabled = false
		
	if PlayerStats.levels_completed >= 2:
		$HBoxContainer/VBoxContainer/MarginContainer/VBoxContainer/w1_3_button.disabled = false
		
	if PlayerStats.levels_completed >= 3:
		$HBoxContainer/VBoxContainer/MarginContainer/VBoxContainer/w1_4_button.disabled = false
		
	if PlayerStats.levels_completed >= 4:
		$HBoxContainer/VBoxContainer2/MarginContainer/VBoxContainer/w2_1_button.disabled = false
		
	if PlayerStats.levels_completed >= 5:
		$HBoxContainer/VBoxContainer2/MarginContainer/VBoxContainer/w2_2_button.disabled = false
		
	if PlayerStats.levels_completed >= 6:
		$HBoxContainer/VBoxContainer2/MarginContainer/VBoxContainer/w2_3_button.disabled = false
		
	if PlayerStats.levels_completed >= 7:
		$HBoxContainer/VBoxContainer2/MarginContainer/VBoxContainer/w2_4_button.disabled = false
		
	if PlayerStats.levels_completed >= 8:
		$HBoxContainer/VBoxContainer3/MarginContainer/VBoxContainer/w3_1_button.disabled = false
		
	if PlayerStats.levels_completed >= 9:
		$HBoxContainer/VBoxContainer3/MarginContainer/VBoxContainer/w3_2_button.disabled = false
		
	if PlayerStats.levels_completed >= 10:
		$HBoxContainer/VBoxContainer3/MarginContainer/VBoxContainer/w3_3_button.disabled = false
		
	if PlayerStats.levels_completed >= 11:
		$HBoxContainer/VBoxContainer3/MarginContainer/VBoxContainer/w3_4_button.disabled = false
		
	if PlayerStats.levels_completed >= 12:
		$HBoxContainer/VBoxContainer4/MarginContainer/VBoxContainer/w4_1_button.disabled = false
		
	if PlayerStats.levels_completed >= 13:
		$HBoxContainer/VBoxContainer4/MarginContainer/VBoxContainer/w4_2_button.disabled = false
		
	if PlayerStats.levels_completed >= 14:
		$HBoxContainer/VBoxContainer4/MarginContainer/VBoxContainer/w4_3_button.disabled = false
		
	if PlayerStats.levels_completed >= 15:
		$HBoxContainer/VBoxContainer4/MarginContainer/VBoxContainer/w4_4_button.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

# Handle when a user presses a button for a specific level

func _on_w_1_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1_1.tscn")
	

func _on_w_1_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1_2.tscn")
	

func _on_w_1_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1_3.tscn")


func _on_w_1_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1_4.tscn")


func _on_w_2_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_2_1.tscn")


func _on_w_2_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_2_2.tscn")


func _on_w_2_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_2_3.tscn")


func _on_w_2_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_2_4.tscn")


func _on_w_3_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_3_1.tscn")


func _on_w_3_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_3_2.tscn")


func _on_w_3_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_3_3.tscn")


func _on_w_3_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_3_4.tscn")


func _on_w_4_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_4_1.tscn")


func _on_w_4_2_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_4_2.tscn")


func _on_w_4_3_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_4_3.tscn")


func _on_w_4_4_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_4_4.tscn")
