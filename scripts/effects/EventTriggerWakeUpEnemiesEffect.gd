extends EffectHandler

class_name EventTriggerWakeUpEnemiesEffect
static func trigger_effect(_node: Node2D,data = null) -> Variant:
	for enemy in data.group_enemies.get_children():
		print(enemy)
		enemy.set_follow_target(GameStateAutoload.data.level.player)
	
	data.caller.queue_free()
	return
	
