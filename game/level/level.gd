extends Control

func end_game(_body: Node2D) -> void:
	GameStateAutoload.save_game()
	SceneLoader.change_scene_to_packed(load("res://menu/home_menu.tscn"),SceneLoader.TransitionTypeEnum.LOADING_SCREEN)
	AudioManager.stopBackgroundGameAudio()
	AudioManager.playBackgroundMenuAudio()
