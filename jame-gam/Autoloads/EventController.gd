extends Node

const PAUSE_MENU = preload("res://pause_menu.tscn")

func _process(_delta: float) -> void:
	print(get_tree().current_scene)
	get_tree().current_scene.paused = true
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Back") && (get_tree().current_scene.scene_file_path == ("res://Levels/level_tutorial.tscn") or 
	get_tree().current_scene.scene_file_path == ("res://Levels/level_sewers.tscn") or 
	get_tree().current_scene.scene_file_path == ("res://Levels/level_backyard.tscn") or 
	get_tree().current_scene.scene_file_path == ("res://Levels/level_waterspout.tscn") or 
	get_tree().current_scene.scene_file_path == ("res://Levels/level_roof.tscn")):
		toggle_menu()
func toggle_menu():
	if GameController.menu_instance == null:
		GameController.menu_instance = PAUSE_MENU.instantiate()
		add_child(GameController.menu_instance)
		GameController.is_paused = true

	else:
		GameController.menu_instance.queue_free()
		GameController.menu_instance = null
		GameController.is_paused = false
