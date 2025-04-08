extends EffectHandler

class_name EventTriggerStayInsideEffect
static func trigger_effect(_node: Node2D,data = null) -> Variant:
	DialogueManager.show_dialogue_balloon(load("res://assets/dialogues/"+GameStateAutoload.data.level_name+".dialogue"), "outside")	
	await DialogueManager.dialogue_ended
	data.caller.queue_free()
	return
	
