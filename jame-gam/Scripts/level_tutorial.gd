extends Node2D

var grate1 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate1.png")
var grate2 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate2.png")
var grate3 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate3.png")
var grate4 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate4.png")
var grate5 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate5.png")
var grate6 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate6.png")

func _ready() -> void:
	GameController.time_into_music = 0
	GameController.tempVars.room = "res://Levels/level_tutorial.tscn"
	GameController.leverStatus = false



const lines: Array[String] = [
	"WHERE DO YOU THINK YOU ARE GOING MISTER",
	"YOU KNOW IT IS RUDE TO LEAVE YOUR DEAR GRANDMAMA HANGING",
	"I SEE HOW IT IS >:("
]
@onready var sfx = preload("res://text_box/speech_sfx.wav")
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		DialogManager.start_dialog(Vector2(510, -8), lines, sfx)
		$Area2D2.queue_free()
	pass

var in_range = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		in_range = true
	pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		in_range = false
	pass

func _process(_delta: float) -> void:
	if in_range and $Area2D2 != null:
		if Input.is_action_just_pressed("Interact"):
			$Area2D2.queue_free()
	if GameController.leverStatus:
		$Standing.visible = true
	if !GameController.leverStatus:
		$Standing.visible = false
	
	for child in $Grate.get_children():
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
