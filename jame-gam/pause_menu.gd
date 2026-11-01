extends Control

@onready var options: CanvasLayer = $"../options"

func _on_play_game_pressed() -> void:
	GameController.menu_instance.queue_free()
	GameController.menu_instance = null

func _on_menu_button_pressed() -> void:
	SceneLoaderScene.transition_to_scene("res://menu.tscn")
	GameController.menu_instance.queue_free()
	GameController.menu_instance = null

func _on_options_pressed() -> void:
	options.visible = !options.visible
	
func _on_exit_game_pressed() -> void:
	get_tree().quit()
