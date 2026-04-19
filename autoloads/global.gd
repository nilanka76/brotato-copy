extends Node

signal on_create_block_text(unit: Node2D)
signal on_create_damage_text(unit: Node2D, hitbox: HitboxComponent)

const FLASH_MATERIAL = preload("uid://fhbiv5rx43je")
const FLOATING_TEXT = preload("uid://uos17jlhx26r")

var player: Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_chance_sucess(chance: float) -> bool:
	var random = randf_range(0, 1.0)
	if random < chance:
		return true
	return false
