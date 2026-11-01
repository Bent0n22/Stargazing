extends Node2D


var grate1 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate1.png")
var grate2 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate2.png")
var grate3 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate3.png")
var grate4 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate4.png")
var grate5 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate5.png")
var grate6 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate6.png")

func _ready() -> void:
	print(GameController.time_into_music)
	$AudioStreamPlayer.play(GameController.time_into_music)
	GameController.time_into_music = 0
	GameController.tempVars.room = "res://Levels/level_sewers.tscn"
	GameController.leverStatus = false

func _process(_delta: float) -> void:
	if GameController.leverStatus:
		$GreyGrates.visible = true
		$BlueGrates.visible = false
	if !GameController.leverStatus:
		$GreyGrates.visible = false
		$BlueGrates.visible = true
	for child in $ActiveStarts.get_children():
		if GameController.leverStatus == false:
			match child.texture:
				grate2:
					child.texture = grate1
				grate4:
					child.texture = grate3
				grate6:
					child.texture = grate5
		if GameController.leverStatus:
			match child.texture:
				grate1:
					child.texture = grate2
				grate3:
					child.texture = grate4
				grate5:
					child.texture = grate6
	for child in $InactiveStarts.get_children():
		if GameController.leverStatus == false:
			match child.texture:
				grate1:
					child.texture = grate2
				grate3:
					child.texture = grate4
				grate5:
					child.texture = grate6
		if GameController.leverStatus:
			match child.texture:
				grate2:
					child.texture = grate1
				grate4:
					child.texture = grate3
				grate6:
					child.texture = grate5
