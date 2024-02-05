extends ColorRect

func transition(backwards):
	if backwards:
		$AnimationPlayer.play_backwards("change_scene")
	else:
		$AnimationPlayer.play("change_scene")
