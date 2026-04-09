extends Control
class_name HealthBar

@export var back_color: Color
@export var fill_color: Color

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var health_amount: Label = $HealthAmount



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var back_style = progress_bar.get_theme_stylebox("background").duplicate()
	back_style.bg_color = back_color
	var fill_style = progress_bar.get_theme_stylebox("fill").duplicate()
	fill_style.bg_color = fill_color

	progress_bar.add_theme_stylebox_override("background", back_style)
	progress_bar.add_theme_stylebox_override("fill", fill_style)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_bar(val: float, health: float) -> void:
	progress_bar.value = val
	health_amount.text = str(health)
	

func _on_health_component_on_unit_health_change(curr: float, max: float) -> void:
	var val = curr / max
	update_bar(val, curr)
