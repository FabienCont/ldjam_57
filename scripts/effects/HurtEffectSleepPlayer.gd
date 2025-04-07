extends EffectHandler

class_name HurtEffectSleepPlayer

static func trigger_effect(_node: Node2D,data = null) -> Variant:
	GameStateAutoload.data.level.lose_level()
	return
	
