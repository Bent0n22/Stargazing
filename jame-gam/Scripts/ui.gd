extends Control
@onready var speedrun_timer = $CanvasLayer/Label
@onready var deathcounter: Label = $CanvasLayer/Label2


func _on_texture_button_pressed() -> void:
	EventController.toggle_menu()

func _process(_delta: float) -> void:
	speedrun_timer.text = str("%10.2f" % GameController.time)
	$CanvasLayer/Label2.text = str(GameController.has_died_gruesomely) + " deaths"
	speedrun_timer.visible = GameController.game_start
	if GlobalSettings.death_counter_is_checked:
		deathcounter.visible = true
	else:
		deathcounter.visible = false
	if GlobalSettings.speedrun_timer_is_checked:
		speedrun_timer.visible = true
	else:
		speedrun_timer.visible = false
