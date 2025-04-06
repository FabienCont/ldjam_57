extends Node2D

@onready var torch = $PointLight2D
func _process(delta: float) -> void:
	var direction_parent = get_parent().get_look_direction()
	var look_rotation = direction_parent.angle()
	rotation = lerp_angle(rotation, look_rotation, delta * 10)
