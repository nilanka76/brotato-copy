extends Line2D
class_name Trail

@export var player: Player
@export var trail_length = 25
#@export var trail_duration = 0
#@export var fade_speed := 50.0  # pixels/sec removal feel

#@onready var trail_timer: Timer = %TrailTimer
#@onready var dash_timer: Timer = $DashTimer

var points_arr: Array[Vector2] = []
var is_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_active:
		return
	
	points_arr.append(player.global_position)
	if points_arr.size() > trail_length:
		points_arr.pop_front()
		
	points = points_arr

	#if is_active:
		#points_arr.append(player.global_position)
#
	#if points_arr.size() > trail_length:
		#points_arr.pop_front()
#
	#if not is_active and points_arr.size() > 0:
		#var remove_count = int(fade_speed * delta / 10.0) + 1
		#for i in range(remove_count):
			#if points_arr.size() > 0:
				#points_arr.pop_front()
#
	#points = points_arr
	
func start_trail() -> void:
	is_active = true
	clear_points() 
	points_arr.clear()
	#trail_timer.start(trail_duration)

#func _on_trail_timer_timeout() -> void:
	#is_active = false
	#clear_points() 
	#points_arr.clear()

func _on_dash_timer_timeout() -> void:
	is_active = false
	clear_points() 
	points_arr.clear()
