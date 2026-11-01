extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var stopCamX = false
var pbody
var remember_little_guy
var ragdoll_of_fun_and_whimsy = preload("res://ragdoll.tscn")
var boring_not_ragdoll = preload("res://player.tscn")

func _on_body_entered(body: Node2D) -> void:
	GameController.time_into_music = get_tree().get_current_scene().get_node("AudioStreamPlayer").get_playback_position()
	if body.name == "CharacterBody2D":
		stopCamX = true
		GameController.has_died_gruesomely += 1
		pbody = body
		timer.start(3)
		audio_stream_player_2d.play()
		var little_guy_ragdoll = ragdoll_of_fun_and_whimsy.instantiate()
		little_guy_ragdoll.global_position = body.global_position
		little_guy_ragdoll.get_node("RigidBody2D").linear_velocity = body.velocity
		if round(body.velocity.x) == 0:
			little_guy_ragdoll.get_node("RigidBody2D").add_constant_torque(100)
			little_guy_ragdoll.get_node("RigidBody2D").scale.x = 1
		if get_tree().current_scene.scene_file_path == "res://Levels/level_waterspout.tscn":
			var level_camera = little_guy_ragdoll.find_child("Camera2D")
			if level_camera:
				level_camera.zoom = Vector2(1.8,1.8)
				level_camera.global_transform.origin.x = 99
		else:
			little_guy_ragdoll.get_node("RigidBody2D").scale.x = (body.velocity.x/abs(body.velocity.x))
		get_tree().get_current_scene().add_child(little_guy_ragdoll)
		get_tree().get_current_scene().get_node("Player").queue_free()
		remember_little_guy = little_guy_ragdoll
		pbody = null

func _on_timer_timeout() -> void:
	get_tree().get_current_scene().get_node("Ragdoll").queue_free()
	GameController.leverStatus = false
	get_tree().reload_current_scene()
