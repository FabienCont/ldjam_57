extends Resource

class_name PlayerInfo

@export var abilities_controller :AbilitiesController = AbilitiesController.new()
@export var inventory_controller :InventoryController = InventoryController.new()
@export var upgrades_controller :UpgradesController = UpgradesController.new()
@export var logic_component :EntityLogicInterface

@export var effects :EffectsController = EffectsController.new():
	set(updated_value):
		effects = updated_value
