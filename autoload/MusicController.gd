extends Node

# Variables for each required music file
var menu_music = load("res://music/JRPG OST/01 - Opening.ogg")
var world_1_music = load("res://music/8bit style music/Bob&#039;s Adventures - back34.mp3")
var world_2_music = load("res://music/JRPG OST/06 - Rebels Be.ogg")
var world_3_music = load("res://music/JRPG OST/08 - Overworld.ogg")
var world_4_music = load("res://music/JRPG OST/10 - The Empire.ogg")
var cave_music = load("res://music/JRPG OST/03 - HWV 56 - Why do the nations so furiously rage together.ogg")
var credits_music = load("res://music/JRPG OST/25 - Finale.ogg")

# Whether the menu music should be played or not
var menu : bool = true

# Current volume level
@export var current_volume : int = -20

# Change current music to main menu music
func play_menu_music():
	if menu:
		$Music.stream = menu_music
		$Music.play()
		menu = !menu

# Turn on the menu music
func turn_on_menu_music():
	menu = true

# Change current music to world 1's music
func play_world_1_music():
	$Music.stream = world_1_music
	$Music.play()

# Change current music to world 2's music
func play_world_2_music():
	$Music.stream = world_2_music
	$Music.play()

# Change current music to world 3's music
func play_world_3_music():
	$Music.stream = world_3_music
	$Music.play()

# Change current music to world 4's music
func play_world_4_music():
	$Music.stream = world_4_music
	$Music.play()

# Change current music to cave music
func play_cave_music():
	$Music.stream = cave_music
	$Music.play()

# Change current music to credits music
func play_credits_music():
	$Music.stream = credits_music
	$Music.play()

# Set the current volume level
func set_music_volume(value):
	current_volume = value
	$Music.volume_db = value

# Get the current volume level
func get_music_volume():
	return current_volume
