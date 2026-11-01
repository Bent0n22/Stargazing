extends Control

@onready var volume: HSlider = $MarginContainer/VBoxContainer/volume
@onready var mute: CheckBox = $MarginContainer/VBoxContainer/mute
@onready var fullscreen: CheckBox = $MarginContainer/VBoxContainer/fullscreen

func _ready() -> void:
	volume.value = GlobalSettings.volume_value
	mute.button_pressed = GlobalSettings.mute_is_checked
	fullscreen.button_pressed = GlobalSettings.fullscreen_is_checked

func _on_volume_value_changed(new_value: float) -> void:
	GlobalSettings.volume_value = new_value
	AudioServer.set_bus_volume_db(0,linear_to_db(new_value))

func _on_mute_toggled(toggled_on: bool) -> void:
	GlobalSettings.mute_is_checked = toggled_on
	AudioServer.set_bus_mute(0,toggled_on)

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	GlobalSettings.fullscreen_is_checked = toggled_on
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


func _on_ready() -> void:
	volume.value_changed.connect(_on_volume_value_changed)
