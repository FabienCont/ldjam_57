extends Resource

class_name EnemyInfo

@export var name :String = "undefined"
@export var sprite: PackedScene
@export var upgrades_controller :UpgradesController = UpgradesController.new()
@export var stats_controller :StatsController = StatsController.new()
@export var abilities_controller :AbilitiesController = AbilitiesController.new()
@export var logic_component :Resource = EnemyLogicComponent.new()
@export var effects :EffectsController = EffectsController.new()
@export var enemyStatData :EnemyStatData = EnemyStatData.new()
