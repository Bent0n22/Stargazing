extends Node2D

@onready var anim = $AnimationPlayer
var swfi = false
var swfiii = false
@onready var Z = $CanvasLayer/Z

func _ready() -> void:
	$CanvasLayer/Credits/Label4.text = "Your final time was " + str("%0.2f" % GameController.time) + " seconds"
	GameController.tempVars.room = "res://Levels/level_tutorial.tscn"
	for child in $AnimatedSprite2D.get_children():
		print(child)
		GameController.wait(randf_range(0.75, 1.5))
		child.play()
	Z.visible = false
	await GameController.wait(1.5)
	anim.play("Play End Scene")
	await anim.animation_finished
	Z.visible = true
	swfi = true

func wait_for_interact():
	if Input.is_action_just_pressed("Interact"):
		anim.play("Play End Scene to Stargazing")
		Z.visible = false
		await anim.animation_finished
		Z.visible = true
		swfi = false
		swfiii = true


func wait_for_end():
	if Input.is_action_just_pressed("Interact"):
		anim.play("Credits")
		Z.visible = false
		await anim.animation_finished
		swfiii = false


func _process(_delta: float) -> void:
	if swfi:
		wait_for_interact()
	if swfiii:
		wait_for_end()
	pass


func _on_texture_button_pressed() -> void:
	$CanvasLayer/Credits/TextureButton.disabled = true
	GameController.stars.one = true
	if GameController.has_died_gruesomely == 0:
		GameController.stars.three = true
	GameController.has_died_gruesomely = 0
	if GameController.time <= 120:
		GameController.stars.two = true
	GameController.time = 0
	GameController.tempTime = 0
	GameController.game_start = false
	GameController.game_won = true
	SceneLoaderScene.transition_to_scene("res://menu.tscn")
	pass # Replace with function body.
