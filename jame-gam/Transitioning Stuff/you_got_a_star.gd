extends Node2D

var star_num: int
@onready var label = $CanvasLayer/Label2
func _ready() -> void:
	$AudioStreamPlayer.play()
	$CanvasLayer/AnimatedSprite2D.play("default")
	$CanvasLayer/AnimatedSprite2D2.play("default")
	match star_num:
		1:
			label.text = "For beating the game, you have earned a star! There are 5 to collect, so keep reaching for the stars!"
		2:
			label.text = "For beating the game in under 400 seconds, you have earned another star! There are 5 to collect, so keep reaching for the stars!"
		3:
			label.text = "For beating the game without dying, you have earned another star! There are 5 to collect, so keep reaching for the stars!"
		4:
			label.text = "For finding the super secret easter egg, you have earned a star! There are 5 to collect, so keep reaching for the stars!"
		5:
			label.text = "For getting all stars, you have earned the 5th and final stars! You have done Grandma Estrana proud :)"
		_:
			print("error")


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		self.queue_free()
