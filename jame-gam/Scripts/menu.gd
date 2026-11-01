extends Control

@onready var Star1 = $"CanvasLayer2/Star 1"
@onready var Star2 = $"CanvasLayer2/Star 2"
@onready var Star3 = $"CanvasLayer2/Star 3"
@onready var Star4 = $"CanvasLayer2/Star 4"
@onready var Star5 = $"CanvasLayer2/Star 5"

var popup_code = preload("res://Transitioning Stuff/you_got_a_star.tscn")
func _ready() -> void:
	if !GameController.has_prompted_for_star.one and GameController.stars.one:
		var popup = popup_code.instantiate()
		popup.star_num = 1
		get_tree().get_current_scene().add_child(popup)
	
	if !GameController.has_prompted_for_star.two and GameController.stars.two:
		var popup = popup_code.instantiate()
		popup.star_num = 2
		get_tree().get_current_scene().add_child(popup)
	
	if !GameController.has_prompted_for_star.three and GameController.stars.three:
		var popup = popup_code.instantiate()
		popup.star_num = 3
		get_tree().get_current_scene().add_child(popup)
	
	if !GameController.has_prompted_for_star.four and GameController.stars.four:
		var popup = popup_code.instantiate()
		popup.star_num = 4
		get_tree().get_current_scene().add_child(popup)
	
	if GameController.stars.one and GameController.stars.two and GameController.stars.three and GameController.stars.four:
		GameController.stars.five = true
	
	if !GameController.has_prompted_for_star.five and GameController.stars.five:
		var popup = popup_code.instantiate()
		popup.star_num = 5
		get_tree().get_current_scene().add_child(popup)

func _on_play_game_pressed() -> void:
	SceneLoaderScene.transition_to_scene(GameController.tempVars.room)
	GameController.game_start = true

func _on_options_pressed() -> void:
	SceneLoaderScene.transition_to_scene("options.tscn")

func _on_exit_game_pressed() -> void:
	get_tree().quit()

func _process(_delta: float) -> void:
	if GameController.stars.one:
		Star1.visible = true
		Star1.disabled = false
	else:
		Star1.visible = false
		Star1.disabled = true
	if GameController.stars.two:
		Star2.visible = true
		Star2.disabled = false
	else:
		Star2.visible = false
		Star2.disabled = true
	if GameController.stars.three:
		Star3.visible = true
		Star3.disabled = false
	else:
		Star3.visible = false
		Star3.disabled = true
	if GameController.stars.four:
		Star4.visible = true
		Star4.disabled = false
	else:
		Star4.visible = false
		Star4.disabled = true
	if GameController.stars.five:
		Star5.visible = true
		Star5.disabled = false
	else:
		Star5.visible = false
		Star5.disabled = true



func _on_texture_button_pressed() -> void:
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.
