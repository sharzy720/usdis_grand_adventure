extends Node

# The players health
var health : int = 1

# The players score
var score : int = 0

# The players score on the current level
var level_score : int = 0

# The players speed
var speed : float = 200.0 #275.0

# The players jump velocity
var jump_velocity : float = -375.0

# The number of levels completed by the player
var levels_completed : int = 0

# The number of plushies found by the player
var plushies_collected : int = 0

# Increase the players score by the given amount
func increase_score(value : int):
	level_score += value

# When the player beats a level add the score to the total score
func beat_level():
	score += level_score
	level_score = 0

# Reset the players score in the current level
func reset_level_score():
	level_score = 0

# Increase the number of plushies found by the player
func increase_plushies_collected():
	plushies_collected += 1

# Decrease the players score by the given amount
func decrease_score(value : int):
	score -= value

# Unlock the next level when an unbeated level is completed
func increase_levels_completed(current_level):
	if levels_completed < current_level:
		levels_completed += 1

# Reset the players values to default
func reset():
	score = 0
	levels_completed = 0
	plushies_collected = 0
