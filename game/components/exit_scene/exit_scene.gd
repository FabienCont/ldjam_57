extends Node2D

@onready var area2d = $Area2D

@export var activate = false

func change_scene():
	get_tree().change_scene_to_file("res://game/level/level_1.tscn")

func _on_dialogue_manager_dialogue_ended(_resource: DialogueResource) -> void:
	DialogueManager.dialogue_ended.disconnect(_on_dialogue_manager_dialogue_ended)
	if GameStateAutoload.data.want_to_sleep:
		GameStateAutoload.data.want_to_sleep = false;
		call_deferred("change_scene")

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if activate == false:
		return
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)
	DialogueManager.show_dialogue_balloon(load("res://assets/dialogues/exit_dialogue.dialogue"), "start")
