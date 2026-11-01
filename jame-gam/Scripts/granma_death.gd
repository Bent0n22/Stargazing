extends Node2D

var player_in_range = false
var had_dialogue = false
var killed_granma = false

@export var linesagain: Array[String]
@export var custompos: Vector2
#const lines: Array[String] = [
#	"hey there...",
#	"im your gramma estrana.",
#	"ok goodbye"
#]

@onready var granma_death: AnimatedSprite2D = $".."
@onready var sfx = preload("res://text_box/speech_sfx.wav")
@onready var label: Label = $Area2D/CollisionShape2D/Label

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player_in_range = true
		label.visible = true
func _process(_delta: float) -> void:
	if !DialogManager.is_dialog_active && had_dialogue == true && killed_granma == false:
		granma_death.play("death")
		self.queue_free()
		killed_granma = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player_in_range = false
	label.visible = false

var can_talk = true

func _on_dialog_finished():
	
	can_talk = false
	GameController.talking = false
	# Wait one frame (or a tiny fraction of a second) so the current press is ignored
	await get_tree().process_frame 
	can_talk = true

func _unhandled_input(event):
	GameController.talking = true
	if event.is_action_pressed("Interact") and player_in_range and can_talk:
		had_dialogue = true
		if custompos != Vector2(0,0):
			DialogManager.start_dialog(custompos, linesagain, sfx)
		else:
			DialogManager.start_dialog(global_position, linesagain, sfx)
