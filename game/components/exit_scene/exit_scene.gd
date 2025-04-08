extends Node2D

@export var next_scene:PackedScene
@export var dialogue:DialogueResource = load("res://assets/dialogues/exit_dialogue.dialogue")
@export var dialogue_name:String = "start"

@onready var area2d = $Area2D
var deactivate = false

func change_scene():
	SceneLoader.change_scene_to_packed(next_scene,SceneLoader.TransitionTypeEnum.LOADING_SCREEN)
	AudioManager.playGoToSleepSound()

func _on_dialogue_manager_dialogue_ended(_resource: DialogueResource) -> void:
	DialogueManager.dialogue_ended.disconnect(_on_dialogue_manager_dialogue_ended)
	if GameStateAutoload.data.want_to_sleep:
		GameStateAutoload.data.want_to_sleep = false;
		call_deferred("change_scene")
		return
	await get_tree().create_timer(2.5).timeout
	deactivate = false

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if deactivate:
		return
	deactivate = true
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)
	DialogueManager.show_dialogue_balloon(dialogue, dialogue_name)
