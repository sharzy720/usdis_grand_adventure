extends ParallaxBackground


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_base_offset -= Vector2(-40, -30) * delta
