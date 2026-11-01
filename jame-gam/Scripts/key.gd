extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_area_2d_body_entered(_body: Node2D) -> void:
	GameController.key_count += 1
	animation_player.play("new_animation")
