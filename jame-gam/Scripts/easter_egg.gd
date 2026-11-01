extends Node2D

@onready var timer: Timer = $Timer

func _ready() -> void:
	$"Little Guy".play()
	GameController.stars.four = true
	timer.start(5)

var direction = 1
var diry = 1
func _process(delta: float) -> void:
	if $Rainbowroad.position.x + 450 * delta > 480:
		$Rainbowroad.position.x = 160
	else:
		$Rainbowroad.position.x += 450 * delta
	
	if $"Little Guy".position.x < 290 and $"Little Guy".position.x > 30:
		$"Little Guy".position.x += 300 * delta * direction
	elif $"Little Guy".position.x < 30:
		direction = 1
		$"Little Guy".position.x += 300 * delta * direction
	elif $"Little Guy".position.x > 290:
		direction = -1
		$"Little Guy".position.x += 300 * delta * direction
	
	if $"Little Guy".position.y < 150 and $"Little Guy".position.y > 0:
		$"Little Guy".position.y += 300 * delta * diry
	elif $"Little Guy".position.y < 0:
		diry = 1
		$"Little Guy".position.y += 300 * delta * diry
	elif $"Little Guy".position.y > 150:
		diry = -1
		$"Little Guy".position.y += 300 * delta * diry

func _on_timer_timeout() -> void:
		GameController.time_into_music = 0
		SceneLoaderScene.transition_to_scene("res://Levels/level_backyard.tscn")
