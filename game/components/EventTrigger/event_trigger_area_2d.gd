extends Area2D

@export var event_to_triggger: EffectInfo
@export var node_parent_group_enemies: Node2D = null
func _on_body_entered(body: Node2D) -> void:
	event_to_triggger.handler.trigger_effect(body,{"caller":self,"group_enemies":node_parent_group_enemies})
	pass # Replace with function body.
