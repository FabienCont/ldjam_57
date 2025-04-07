extends Control

func _ready() -> void:
	GameSignalsAutoload.level_loaded.emit()
