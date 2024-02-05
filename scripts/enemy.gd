extends CharacterBody2D

# Resource file that contains information about a unique enemey
@export var resource : Resource

# AnimatedSprite node
@onready var sprite = $Direction/AnimatedSprite2D

# LedgeChecker node
@onready var ledge_checker = $Direction/LedgeChecker

# WallChecker node
@onready var wall_checker = $Direction/WallChecker

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.sprite_frames = resource.sprite_frames
	sprite.animation = "run"
	sprite.play()
	
	if resource.direction == 1:
		$Direction.scale.x = -$Direction.scale.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var speed = resource.speed
	
	if resource.moving:
		speed = 0
	
	var found_wall = wall_checker.is_colliding()
	var found_ledge = !ledge_checker.is_colliding()
	
	# Move enemy till it hits a wall
	velocity.x = resource.direction * speed
	move_and_slide()
	
	# When the enemy detects a wall or ledge flip the node
	if found_wall or found_ledge:
		$Direction.scale.x = -$Direction.scale.x
		resource.direction *= -1


# If the enemy has been jumped on by the player
func _on_top_checker_body_entered(body):
	if body.name == "player":
		sprite.animation = "hit"
		sprite.play()
		PlayerStats.increase_score(resource.score)
		await get_tree().create_timer(.15).timeout
		queue_free()

# Handle when the player interacts with the right side of an enemy
func _on_right_checker_body_entered(body):
	if body.name == "player":
		PlayerStats.reset_level_score()
		get_tree().reload_current_scene()

# Handle when the player interacts with the left side of an enemy
func _on_left_checker_body_entered(body):
	if body.name == "player":
		PlayerStats.reset_level_score()
		get_tree().reload_current_scene()
