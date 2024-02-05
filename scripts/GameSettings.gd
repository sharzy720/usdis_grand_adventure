extends Node

# Whether the game is running or not
var running : bool = true

# Save the players data
func save_game():
	var saved_game : SavedGame = SavedGame.new()
	
	saved_game.player_score = PlayerStats.score
	saved_game.levels_completed = PlayerStats.levels_completed
	
	ResourceSaver.save(saved_game, "user://savegame.tres")

# Load the players data
func load_game():
	if FileAccess.file_exists("user://savegame.tres"):
		var saved_game : SavedGame = load("user://savegame.tres")
		
		PlayerStats.score = saved_game.player_score
		PlayerStats.levels_completed = saved_game.levels_completed
		
	else:
		PlayerStats.score = 0
		PlayerStats.levels_completed = 0

# Save player data when the game is quit
func quit_game():
	save_game()
	
	get_tree().quit()
