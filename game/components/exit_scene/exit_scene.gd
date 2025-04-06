extends Node2D

@onready var area2d = $Area2D



func change_scene():
	get_tree().change_scene_to_file("res://game/level/level_1.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	call_deferred("change_scene")
	pass # Replace with function body.
