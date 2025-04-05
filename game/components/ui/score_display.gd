@tool
extends HBoxContainer

@onready var score_label_node = $Label
@onready var score_value_node = $value
@export var label_str: String = "Score"
@export var font_size: int = 16
@export var value_score:int = 0 :
	get:
		return value_score
	set(value):
		update_label_value(value)
		value_score = value
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label_node.text = label_str
	score_label_node.add_theme_font_size_override("font_size", font_size)
	score_value_node.add_theme_font_size_override("font_size", font_size)
	update_label_value(value_score)

func update_label_value(value: int) -> void:
	score_value_node.text = str(value)
	
