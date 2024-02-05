extends Resource
class_name Enemy

# Animation frames for the enemy
@export var sprite_frames : SpriteFrames

# Score for the enemy
@export var score : int

# Direction for the enemy to face
@export var direction : int

# Movement speed for the enemy
@export var speed : float

# Whether or not the enemy is moving
@export var moving : bool
