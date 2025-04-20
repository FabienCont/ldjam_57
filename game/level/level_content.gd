extends Node2D

class_name LevelContent

@onready var player = $Player
@onready var enemies = $Enemies
@onready var playerLightTorch = $Player/LightTorch2DPivot/LightTorch2D
@onready var playerLight2D = $Player/PlayerLight2D
@onready var directionalLightOff = $DirectionalLight2D
@export var level_name = ""

func _ready() -> void:
	GameStateAutoload.data.level = self
	GameStateAutoload.data.level_name = level_name
	await get_tree().create_timer(0.5).timeout
	GameSignalsAutoload.level_loaded.emit()
	DialogueManager.show_dialogue_balloon(load("res://assets/dialogues/"+GameStateAutoload.data.level_name+".dialogue"), "start")
	
func shutdown_light() -> void:
	AudioManager.playBoomShutdownSound()
	CameraUtils.shake_camera(self,5000)
	await get_tree().create_timer(1.5).timeout
	turn_off_light()

func restart_level() -> void:
	SceneLoader.change_scene_to_packed(load("res://game/level/"+GameStateAutoload.data.level_name+".tscn"),SceneLoader.TransitionTypeEnum.LOADING_SCREEN)

func lose_level() -> void:
	turn_off_light_torch()
	DialogueManager.show_dialogue_balloon(load("res://assets/dialogues/hit_by_enemy.dialogue"), "start")
	await DialogueManager.dialogue_ended
	restart_level()

func turn_on_light_torch() -> void:
	playerLightTorch.show()
	tween_element(playerLightTorch,"energy",0.6,0.6)

func turn_off_light_torch() -> void:
	var tween = tween_element(playerLightTorch,"energy",0.,0.6)
	await tween.step_finished
	playerLightTorch.hide()
	
func turn_off_light() -> void:
	directionalLightOff.show()
	var tween = tween_element(directionalLightOff,"energy",0.94,0.3)
	await tween.step_finished
	playerLight2D.show()
	tween_element(playerLight2D,"energy",0.54,0.3)

func tween_element(element:Node,property:String,value:float,time:float) -> Tween:
	var tween = element.create_tween().set_ease(Tween.EASE_OUT_IN)
	tween.tween_property(element,property,value,time).from_current()
	return tween
	
func turn_on_light() -> void:
	var tween = tween_element(directionalLightOff,"energy",0.,.6)
	tween_element(playerLight2D,"energy",0.,.6)
	await tween.step_finished
	directionalLightOff.hide()
	playerLight2D.hide()
	
func turn_off_input() -> void:
	player.process_mode = ProcessMode.PROCESS_MODE_DISABLED
	enemies.process_mode = ProcessMode.PROCESS_MODE_DISABLED
	
func turn_on_input() -> void:
	player.process_mode = ProcessMode.PROCESS_MODE_INHERIT
	enemies.process_mode = ProcessMode.PROCESS_MODE_INHERIT
