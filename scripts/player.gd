extends CharacterBody2D

# Whether the player is currently looking left or not
var look_left : bool = false


func _physics_process(delta):
	# Value for the gravity applied to the player
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = PlayerStats.jump_velocity

	# Get the input direction and handle the movement/deceleration.
	var direction : float = Input.get_axis("move_left", "move_right")

	# If the player is looking left
	if direction:
		# Get the gravity from the pr
		velocity.x = direction * PlayerStats.speed
	else:
		velocity.x = move_toward(velocity.x, 0, PlayerStats.speed)
	
	# Handle movement animation
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "run"
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
			look_left = true
		else:
			$AnimatedSprite2D.flip_h = false
			look_left = false
	
	# Handle idle animation
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.flip_h = look_left
	
	# Handle jumping animation
	if velocity.y != 0:
		$AnimatedSprite2D.animation = "jump"
		$AnimatedSprite2D.flip_h = look_left
		
	$AnimatedSprite2D.play()

	move_and_slide()
