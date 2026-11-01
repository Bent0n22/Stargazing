extends TileMapLayer

@export var move_distance: float = 20.0
@export var lerp_speed: float = 12.5
@onready var killzone: CollisionShape2D = $"../killzone/CollisionShape2D"

var start_timer = false
var time_accumlator: float = 0.0
var att_elapsed = 0
@onready var target_y: float = position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_accumlator += delta
	
	if att_elapsed > 29:
		att_elapsed = 29
	if !start_timer:
		if time_accumlator >= 3.0:
			target_y -= move_distance
			killzone.position.y -= move_distance
			time_accumlator -= 3.0
			start_timer = true
			att_elapsed += 0.5
	else:
		if time_accumlator >= 0.8 / (1 + att_elapsed/10):
			target_y -= move_distance
			killzone.position.y -= move_distance
			time_accumlator -= 0.8 / (1 + att_elapsed/10)
			att_elapsed += 0.5
		
	position.y = lerp(position.y, target_y, lerp_speed * delta)
