extends Control


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db(value))

func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Back"):
		SceneLoaderScene.transition_to_scene(GameController.tempVars.room)
		GameController.game_start = true

func _on_menu_button_pressed() -> void:
	SceneLoaderScene.transition_to_scene("res://menu.tscn")

func _on_exit_game_pressed() -> void:
	get_tree().quit()
