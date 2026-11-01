extends Control


func _on_play_game_pressed() -> void:
	SceneLoaderScene.transition_to_scene(GameController.tempVars.room)
	GameController.game_start = true

func _on_options_pressed() -> void:
	SceneLoaderScene.transition_to_scene("options.tscn")

func _on_exit_game_pressed() -> void:
	get_tree().quit()

func _process(_delta: float) -> void:
	if GameController.game_won:
		$CanvasLayer2/TextureButton.visible = true
		$CanvasLayer2/TextureButton.disabled = false
	else:
		$CanvasLayer2/TextureButton.visible = false
		$CanvasLayer2/TextureButton.disabled = true


func _on_texture_button_pressed() -> void:
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.
