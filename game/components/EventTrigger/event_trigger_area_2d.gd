extends Area2D

@export var event_to_triggger: EffectInfo

func _on_body_entered(body: Node2D) -> void:
	event_to_triggger.handler.trigger_effect(body,{"caller":self})
	pass # Replace with function body.
