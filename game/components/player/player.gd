extends Entity

class_name Player

@onready var controller_component: TopDownControllerComponent2D = $TopDownControllerComponent2D
@onready var interaction_component: InteractionComponent2D = $InteractionComponent2D
@export var player_info: PlayerInfo
@export var playerStats: PlayerStatData

func _ready() -> void:
	init_player(player_info)
	
func init_player(player_info_init :PlayerInfo) -> void:
	init_entity(playerStats.export_to_stat_controller(),player_info_init.upgrades_controller,player_info_init.abilities_controller,player_info_init.logic_component)
	player_info = player_info_init
	player_info.upgrades_controller = upgrades_controller
	player_info.abilities_controller = abilities_controller
	

func _process(delta: float) -> void:
	logic_component.process_logic(delta)

func get_current_direction() -> Vector2:
	return controller_component.get_current_direction()
	
func hurt(attack :AttackInterface):
	logic_component.hurt_logic(attack)

func die():
	logic_component.die_logic()

func collect(loot : Loot) -> void:
	logic_component.collect_logic(loot)
