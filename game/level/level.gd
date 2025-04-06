extends Control

var life:int= 3

var score : int = 0
var max_score : int = 0
@onready var label_score = $CanvasLayer/VBoxContainer2/MarginContainer/VBoxContainer/HBoxContainer2/ScoreDisplay
@onready var label_max_score = $CanvasLayer/VBoxContainer2/MarginContainer/VBoxContainer/HBoxContainer/MaxScoreDisplay
var current_shape:
	get():
		return current_shape
	set(value):
		current_shape= value
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_max_score(GameStateAutoload.data.max_score)
	pass # Replace with function body.
	
func update_max_score(value:int)-> void:
	max_score = value;
	label_max_score.value_score = value
	GameStateAutoload.data.max_score =value


func end_game(_body: Node2D) -> void:
	GameStateAutoload.save_game()
	SceneLoader.change_scene_to_packed(load("res://menu/home_menu.tscn"),SceneLoader.TransitionTypeEnum.LOADING_SCREEN)
	AudioManager.stopBackgroundGameAudio()
	AudioManager.playBackgroundMenuAudio()
