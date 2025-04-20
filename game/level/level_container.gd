extends Control

class_name LevelViewportContainer

@onready var sub_viewport_container :=$LevelSubViewportContainer
@onready var sub_container := $LevelSubViewportContainer/LevelSubViewport
@onready var protected_nodes := [sub_viewport_container.get_path()]

func _ready():
	# Move any children of this node (excluding our internal nodes) into sub_container
	for child in get_children():
		if child.get_path() in protected_nodes:
			continue
		remove_child(child)
		sub_container.add_child(child)

func end_game(_body: Node2D) -> void:
	GameStateAutoload.save_game()
	SceneLoader.change_scene_to_packed(load("res://menu/home_menu.tscn"),SceneLoader.TransitionTypeEnum.LOADING_SCREEN)
	AudioManager.stopBackgroundGameAudio()
	AudioManager.playBackgroundMenuAudio()
