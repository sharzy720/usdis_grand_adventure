extends Control

@onready var main = $"../"

func _on_back_button_pressed():
	main.credits_menu()
