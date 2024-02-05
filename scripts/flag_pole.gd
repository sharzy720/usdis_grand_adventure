extends Node2D

# How many points the flag pole is worth
@export var points : int = 100

# Int value of the current level
@export var current_level : int

# Custom signal for when the player finishes a level
signal level_finished

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/flag_pole_animation.animation = "no_flag"
	$Area2D/flag_pole_animation.play()

# Change the current animation to "flag_out"
func play_flag_out_animation():
	$Area2D/flag_pole_animation.animation = "flag_out"
	$Area2D/flag_pole_animation.play()

# Change the current animation to "idle"
func play_idle_animation():
	$Area2D/flag_pole_animation.animation = "idle"
	$Area2D/flag_pole_animation.play()

# When the player interacts with the flag pole end the level
func _on_area_2d_body_entered(body):
	if body.name == "player":
		PlayerStats.increase_score(points)
		PlayerStats.beat_level()
		PlayerStats.increase_levels_completed(current_level)
		
		$Area2D.set_deferred("monitoring", false) 
		
		# Play flag rolling out animation
		play_flag_out_animation()
		await get_tree().create_timer(1.5).timeout
		
		# Play flag waving in wind animation
		play_idle_animation()
		emit_signal("level_finished")
