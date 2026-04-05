extends Unit
class_name Enemy

@export var flock_push_strength = 20.0

@onready var vision_area: Area2D = %VisionArea

var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not can_move or not can_move_towards_player():
		return
		
	position += get_move_direction() * stats.speed * delta
	update_face_dir()

func update_face_dir() -> void:
	if not is_instance_valid(Global.player):
		return
	if global_position.x < Global.player.global_position.x:
		visuals.scale = Vector2(-0.5,0.5)
	else:
		visuals.scale = Vector2(0.5,0.5)

#func get_move_direction() -> Vector2:
	#if not is_instance_valid(Global.player):
		#return Vector2.ZERO
	#var direction = global_position.direction_to(Global.player.global_position)
	#for area in vision_area.get_overlapping_areas():
		#if area != self and area.is_inside_tree():
			#var vector = global_position - area.global_position
			#direction += flock_push_strength * vector.normalized()/ vector.length()
	#
	#return direction
	#
	
func get_move_direction() -> Vector2:
	if not is_instance_valid(Global.player):
		return Vector2.ZERO
		
	var direction = global_position.direction_to(Global.player.global_position)

	for area in vision_area.get_overlapping_areas():
		if area != self and area.is_inside_tree():
			var vector = global_position - area.global_position
			var dist = max(vector.length(), 0.001) # avoid division by zero
			direction += flock_push_strength * (vector / (dist * dist))

	return direction.normalized()
	
func can_move_towards_player() -> bool:
	return is_instance_valid(Global.player)\
	and global_position.distance_to(Global.player.global_position) > 60
