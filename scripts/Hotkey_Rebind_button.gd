extends Control
class_name HotKeyRebindButton

# Varable for the action name's label
@onready var label = $HBoxContainer/Label as Label

# Varable for the change action button
@onready var button = $HBoxContainer/Button as Button

# Name of the action to be changed
@export var action_name : String = "move_left"

# Runs when the scene first enters
func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()

# Sets the labels name to the name of the input
func set_action_name() -> void:
	label.text = "Unassigned"

	match action_name:
		"move_left":
			label.text = "Move Left"
		"move_right":
			label.text = "Move Right"
		"jump":
			label.text = "Jump"

# Updates the key button with the currently assigned key
func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	button.text = "%s" % action_keycode


# When a player selects to change the current button configuration
func _on_button_toggled(toggled_on):
	if toggled_on:
		button.text = "Press any key..."
		set_process_unhandled_key_input(toggled_on)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_input(false)
	
	else:
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_input(false)
		
		set_text_for_key()

# Handle the unhandled key input
func _unhandled_key_input(event):
	rebind_action_key(event)
	button.button_pressed = false

# Rebind a given input to the pressed key
func rebind_action_key(event):
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	
	set_process_unhandled_key_input(false)
	set_text_for_key()
	set_action_name()
	
