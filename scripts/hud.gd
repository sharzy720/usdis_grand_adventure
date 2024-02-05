extends Control

# Color of the HUD's text
@export var text_color : String = "black"

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreLabel.set("theme_override_colors/font_color", Color(text_color))
	$ScoreLabel.text = "Score: " + str(PlayerStats.score + PlayerStats.level_score)

# Update the HUD's text in real time
func _process(_delta):
	$ScoreLabel.text = "Score: " + str(PlayerStats.score + PlayerStats.level_score)

# Black out the HUD's text color
func black_out():
	$ScoreLabel.set("theme_override_colors/font_color", Color("black"))
