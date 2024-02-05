extends Node2D

# Resource used for each plushies stats
@export var resource : Resource

# Number of points a plushie is worth
@export var points : int = 10

# Variable to the AnimatedSprite
@onready var sprite = $Area2D/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.sprite_frames = resource.sprite_frames
	sprite.animation = "idle"
	sprite.play()

# Change the current animation to "collected
func play_collected():
	sprite.animation = "collected"
	sprite.play()

# Handle when the player interacts with a plushie
func _on_area_2d_body_entered(body):
	if body.name == "player":
		PlayerStats.increase_plushies_collected()
		
		play_collected()
		await get_tree().create_timer(.5).timeout
		queue_free()
