extends EffectHandler

class_name EventTriggerShutdownEffect
static func trigger_effect(_node: Node2D,data = null) -> Variant:
	DialogueManager.show_dialogue_balloon(load("res://assets/dialogues/level_1.dialogue"), "shutdown")	
	await DialogueManager.dialogue_ended
	data.caller.queue_free()
	return
	
