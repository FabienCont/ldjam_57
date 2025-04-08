extends Button

func _on_pressed() -> void:
	SceneLoader.change_scene_to_packed(load("res://game/level/level_0.tscn"),SceneLoader.TransitionTypeEnum.LOADING_SCREEN)
	AudioManager.playBackgroundGameAudio()
	AudioManager.stopBackgroundMenuAudio()
