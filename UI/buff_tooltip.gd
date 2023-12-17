extends Control
class_name BuffTooltip

@onready var buff_name_l: Label = $Panel/VBoxContainer/HBoxContainer/BuffName
@onready var buff_level_l: Label = $Panel/VBoxContainer/HBoxContainer/BuffLevel
@onready var buff_description_l: Label = $Panel/VBoxContainer/BuffDescription

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_infos(buff_name: String, buff_level: String, buff_description: String):
	buff_name_l.text = buff_name
	buff_level_l.text = buff_level
	buff_description_l.text = buff_description
