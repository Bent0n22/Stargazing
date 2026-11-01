extends Control
@onready var label = $CanvasLayer/Label

func _on_texture_button_pressed() -> void:
	EventController.toggle_menu()

func _process(_delta: float) -> void:
	label.text = str("%10.2f" % GameController.time)
	$CanvasLayer/Label2.text = str(GameController.has_died_gruesomely) + " deaths"
	label.visible = GameController.game_start
