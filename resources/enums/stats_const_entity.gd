extends StatsConstModel
class_name StatsConstEntity

enum names{
	life = 0,
	max_life= 1,
	collector_distance= 2,
	visibility= 3,
	xp= 4,
	level=6,
	movement_speed=7,
	acceleration=8,
	attack_speed=9
}

static func get_string(name) -> String:
	return names.keys()[names.values().find(name)]

static func get_names():
	return names
