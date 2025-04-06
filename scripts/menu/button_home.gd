extends Button

func _on_pressed() -> void:
	SceneLoader.change_scene_to_packed(load("res://menu/home_menu.tscn"),SceneLoader.TransitionTypeEnum.LOADING_SCREEN)
	AudioManager.stopBackgroundGameAudio()
	AudioManager.playBackgroundMenuAudio()
