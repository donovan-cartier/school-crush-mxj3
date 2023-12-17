extends Node2D
class_name Game

@onready var characters: Array[Node] = get_tree().get_nodes_in_group("character")
var character_in_love_ref: Character

var points: int = 0

var classmate_buff_cost: int = 10
var crush_buff_cost: int = 10
var highlight_buff_cost: int = 10

var classmate_buff_level: int = 0
var crush_buff_level: int = 0
var has_highlight_buff: bool = false

@export var love_interest: Sprite2D
@export var game_over_screen: Control

signal sequence_started
signal obtained_points(total_points)
signal spent_points(total_points)

func _ready() -> void:
	for char in characters:
		sequence_started.connect(char._on_start_sequence)

func start_new_sequence() -> void:
	if character_in_love_ref:
		character_in_love_ref.unset_in_love()
	character_in_love_ref = characters.pick_random()
	character_in_love_ref.set_in_love()
	sequence_started.emit()

func win() -> void:
	love_interest.new_sequence()
	points += 10
	obtained_points.emit(points)
	
func lose() -> void:
	game_over_screen.show()

func _on_love_interest_crush_entered() -> void:
	start_new_sequence()


func _on_classmate_buff_button_pressed() -> void:
	if points >= classmate_buff_cost:
		classmate_buff_level += 1
		points -= classmate_buff_cost
		spent_points.emit(points)

func _on_crush_buff_button_pressed() -> void:
	if points >= crush_buff_cost:
		crush_buff_level += 1
		points -= crush_buff_cost
		spent_points.emit(points)


func _on_highlight_buff_button_pressed() -> void:
	if points >= highlight_buff_cost:
		points -= highlight_buff_cost
		spent_points.emit(points)
		has_highlight_buff = true
