extends Node2D

@onready var area2d = $Area2D

func change_scene():
	SceneLoader.change_scene_to_packed(load("res://game/level/level_1.tscn"),SceneLoader.TransitionTypeEnum.LOADING_SCREEN)
	AudioManager.playBackgroundGameAudio()
	AudioManager.stopBackgroundMenuAudio()

func _on_dialogue_manager_dialogue_ended(_resource: DialogueResource) -> void:
	DialogueManager.dialogue_ended.disconnect(_on_dialogue_manager_dialogue_ended)
	if GameStateAutoload.data.want_to_sleep:
		GameStateAutoload.data.want_to_sleep = false;
		call_deferred("change_scene")

func _on_area_2d_body_entered(_body: Node2D) -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)
	DialogueManager.show_dialogue_balloon(load("res://assets/dialogues/exit_dialogue.dialogue"), "start")
