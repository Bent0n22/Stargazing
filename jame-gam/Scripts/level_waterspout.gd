extends Node2D

func _ready():
	GameController.tempVars.room = "res://Levels/level_waterspout.tscn"

	$AudioStreamPlayer.play(GameController.time_into_music)
	GameController.time_into_music = 0
