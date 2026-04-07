extends Node
class_name HealthComponent

signal on_unit_hit
signal on_unit_die
signal on_unit_health_change(curr: float, max:float)

var max_health = 1.0
var curr_health = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup(stats: UnitStats) -> void:
	max_health = stats.health
	curr_health = max_health
	on_unit_health_change.emit(curr_health, max_health)
	
func take_damage(val: float) -> void:
	if curr_health <= 0:
		return
	
	curr_health -= val
	curr_health = max(curr_health, 0)
	on_unit_health_change.emit(curr_health, max_health)
	on_unit_hit.emit()
	
	if curr_health <= 0:
		on_unit_die.emit()
		die()
		
func heal(val: float) -> void:
	if curr_health <= 0:
		return
	
	curr_health += val
	curr_health = max(curr_health, max_health)
	on_unit_health_change.emit(curr_health, max_health)
	
func die() -> void:
	owner.queue_free()
	
