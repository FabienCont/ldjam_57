extends Entity

class_name EnemyModel

@export var target :Node2D  
@export var enemy_info: EnemyInfo
@onready var followTargetComponent: EnemyNavigationAgent2D = $NavigationAgent2D
@onready var hitbox_component: HitboxComponent2D = $HitboxComponent2D

func _ready() -> void: 
	if enemy_info :
		prepare_enemy()
	
func prepare_enemy() -> void :
	enemy_info.stats_controller = enemy_info.enemyStatData.export_to_stat_controller()
	init_entity(enemy_info.stats_controller,enemy_info.upgrades_controller,enemy_info.abilities_controller,enemy_info.logic_component)
	enemy_info.stats_controller = stats_controller
	enemy_info.upgrades_controller = upgrades_controller
	enemy_info.abilities_controller = abilities_controller
	logic_component = enemy_info.logic_component
	if target != null :
		followTargetComponent.set_node_to_follow(target)
	set_sprite_component(enemy_info.sprite.instantiate() as AnimatedSprite2D)

func set_follow_target(target_to_follow:Node2D):
	target =target_to_follow;
	if target_to_follow != null :
		followTargetComponent.set_node_to_follow(target)
		
func init_enemy(enemy_info_init) -> void:
	enemy_info = enemy_info_init
	if is_node_ready():
		prepare_enemy()
	
func _process(delta: float) -> void :
	logic_component.process_logic(delta)
	return
	
func hurt(attack :AttackInterface) -> void:
	logic_component.hurt_logic(attack)

func die() -> void:
	logic_component.die_logic()

func get_current_direction() -> Vector2:
	return followTargetComponent.get_current_direction() 
	
