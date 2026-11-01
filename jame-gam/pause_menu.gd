extends Control


func _on_play_game_pressed() -> void:
		GameController.menu_instance = null
		
	
	
func _on_menu_button_pressed() -> void:
	SceneLoaderScene.transition_to_scene("res://menu.tscn")
	
func _on_options_pressed() -> void:
	SceneLoaderScene.transition_to_scene("options.tscn")
	
func _on_exit_game_pressed() -> void:
	get_tree().quit()
