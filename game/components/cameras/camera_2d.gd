extends Camera2D

@export var target: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not target:
		return
	position.x = target.position.x
	position.y = target.position.y + get_offset_camera()  
	pass # Replace with function body.

func get_offset_camera() -> int:
	return int(get_viewport().get_visible_rect().size.y/3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not target:
		return
	var target_position = Vector2(target.global_position)
	target_position.y = target_position.y +get_offset_camera()
	global_position = lerp(global_position, target_position  , 1 * delta)
	pass
