extends Node2D

@onready var timer: Timer = $Timer

func _ready() -> void:
	GameController.stars.four = true
	timer.start(5)

func _on_timer_timeout() -> void:
		GameController.time_into_music = 0
		SceneLoaderScene.transition_to_scene("res://Levels/level_backyard.tscn")
