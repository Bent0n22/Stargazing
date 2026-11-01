extends Node

const PAUSE_MENU = preload("res://pause_menu.tscn")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Back"):
	#&& (scene_file_path == "res://Levels/level_sewers.tscn" or scene_file_path == "res://Levels/level_tutuorial.tscn" or scene_file_path == "res://Levels/level_backyard.tscn" or scene_file_path == "res://Levels/level_roof.tscn"):
		toggle_menu()
func toggle_menu():
	if GameController.menu_instance == null:
		GameController.menu_instance = PAUSE_MENU.instantiate()
		add_child(GameController.menu_instance)
		#get_tree().paused = true
	else:
		GameController.menu_instance.queue_free()
		GameController.menu_instance = null
		#get_tree().paused = false
