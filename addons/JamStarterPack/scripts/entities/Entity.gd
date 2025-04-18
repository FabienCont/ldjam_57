extends CharacterBody2D

class_name Entity

@onready var velocity_component: VelocityComponent2D = $VelocityComponent2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var hurtbox_component:HurtboxComponent2D  = $HurtboxComponent2D
@onready var sprite_component: AnimatedSprite2D  = $SpriteComponent
@export var logic_component: EntityLogicInterface = EntityLogicInterface.new()

@export var passive_effects: Array[Resource] =[]
@export var hurt_effects: Array[Resource] =[]
@export var die_effects: Array[Resource] =[]

@export var stats_controller: StatsController = StatsController.new()
@export var upgrades_controller: UpgradesController = UpgradesController.new()
@export var abilities_controller: AbilitiesController = AbilitiesController.new()
@export var effects_controller: EffectsController = EffectsController.new()

var is_dead:=false
var life_stat: StatModel
	
func init_stat_controller(stats_controller_init :StatsController,upgrades_controller_init: UpgradesController) -> void:
	stats_controller = stats_controller_init.duplicate(true)
	upgrades_controller = upgrades_controller_init.duplicate(true)
	stats_controller.set_upgrades_controller(upgrades_controller)
	stats_controller.init()

func init_effects_controller(effects_controller_init :EffectsController) -> void:
	effects_controller = effects_controller_init.duplicate(true)
	effects_controller.init(self)
	
func init_abilities_controller(abilities_controller_init :AbilitiesController) -> void:
	abilities_controller = abilities_controller_init.duplicate(true)
	abilities_controller.init(self)
	
func init_entity(stats_controller_init :StatsController,upgrades_controller_init:UpgradesController, abilities_controller_init:AbilitiesController,logic_component_init:EntityLogicInterface) -> void:
	init_stat_controller(stats_controller_init,upgrades_controller_init)
	life_stat = stats_controller.get_current_stat(StatsConstEntity.names.life)
	var max_life_stat = stats_controller.get_current_stat(StatsConstEntity.names.max_life)
	var movement_speed_stat = stats_controller.get_current_stat(StatsConstEntity.names.movement_speed)
	var acceleration_stat = stats_controller.get_current_stat(StatsConstEntity.names.acceleration)
	velocity_component.init(movement_speed_stat.value,acceleration_stat.value)
	health_component.init(life_stat)
	movement_speed_stat.update_value.connect(func(value):velocity_component.movement_speed = value )
	acceleration_stat.update_value.connect(func(value):velocity_component.acceleration = value )

	init_abilities_controller(abilities_controller_init)
	logic_component = logic_component_init
	logic_component.init_logic_component(self)
	
func set_sprite_component(new_sprite: AnimatedSprite2D):
	new_sprite.position = Vector2(0.,-32)
	sprite_component.replace_by(new_sprite)
	sprite_component = new_sprite
	
func get_current_direction() -> Vector2:
	return Vector2(0,0)
	
func hurt(attack :AttackInterface) -> void:
	AudioManager.playImpactSound()
	var direction = (global_position - attack.attack_position).normalized()
	velocity_component.accelerate_in_direction(direction * attack.knockback_force,0.1)
	for hurt_effect in hurt_effects:
		hurt_effect.trigger_effect(self,attack)

func has_die() -> bool: 
	return is_dead

func die() -> void:
	is_dead = true
	GameSignalsAutoload.entity_died.emit(self)

func collect(_loot : Loot) -> void:
	return
