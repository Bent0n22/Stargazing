extends Node

var talking = false
var leverStatus = false
var key_count = 0
var game_won = false
var game_start = false
var time = 0
var time_into_music = 0
var has_died_gruesomely = false
var menu_instance = null

var stars = {
	one = false,
	two = false,
	three = false,
	four = false,
	five = false
}
var has_prompted_for_star = {
	one = false,
	two = false,
	three = false,
	four = false,
	five = false
}
func timeGame(playing, delta):
	if playing:
		time += delta

func endTime():
	if !game_start:
		time = 0

func switchLever():
	if leverStatus:
		leverStatus = false
	else:
		leverStatus = true

func _physics_process(delta: float) -> void:
	timeGame(game_start, delta)
	endTime()

func wait(time_in_seconds) -> void:
	await get_tree().create_timer(time_in_seconds).timeout

var persistant = {
	
}
var tempVars = {
	room = "res://Levels/level_tutorial.tscn"
}

func save():
	return persistant
