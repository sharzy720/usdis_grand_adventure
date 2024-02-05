extends Node2D

# How many points the item is worth
@export var points : int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/AnimatedSprite2D.animation = "idle"
	$Area2D/AnimatedSprite2D.play()

# Changes the current animation to "collected"
func play_collected():
	$Area2D/AnimatedSprite2D.animation = "collected"
	$Area2D/AnimatedSprite2D.play()	

# Detect when the player interacts with the item
func _on_area_2d_body_entered(body):
	if body.name == "player":
		PlayerStats.increase_score(points)
		
		play_collected()
		await get_tree().create_timer(.5).timeout
		queue_free()
