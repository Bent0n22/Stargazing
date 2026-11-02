extends Node2D

var star_num: int
var star_nums = {
	one = false,
	two = false,
	three = false,
	four = false,
	five = false,
	}
@onready var label = $CanvasLayer/Label2
func _ready() -> void:
	GameController.popup_active = true
	$AudioStreamPlayer.play()
	$CanvasLayer/AnimatedSprite2D.play("default")
	$CanvasLayer/AnimatedSprite2D2.play("default")
	
	
	match star_num:
		-1:
			$CanvasLayer/Label.text = "Secret"
			label.text = "To find the 4th star, you must find a secret area... Check around unexplored crevices where no bee passes..."
		1:
			$CanvasLayer/Label.text = "Congrats!"
			label.text = "For beating the game, you have earned a star! There are 5 to collect, so keep reaching for the stars!"
		2:
			$CanvasLayer/Label.text = "Congrats!"
			label.text = "For beating the game in under 120 seconds, you have earned another star! There are 5 to collect, so keep reaching for the stars!"
		3:
			$CanvasLayer/Label.text = "Congrats!"
			label.text = "For beating the game without dying, you have earned another star! There are 5 to collect, so keep reaching for the stars!"
		4:
			$CanvasLayer/Label.text = "Congrats!"
			label.text = "For finding the super secret easter egg, you have earned a star! There are 5 to collect, so keep reaching for the stars!"
		5:
			$CanvasLayer/Label.text = "Congrats!"
			label.text = "For getting all stars, you have earned the 5th and final stars! You have done Grandma Estrana proud :)"
		_:
			print("error")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		GameController.popup_active = false
		$AnimationPlayer.play("Canvas Layer Fade")
		await $AnimationPlayer.animation_finished
		self.queue_free()
