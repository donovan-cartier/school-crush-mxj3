extends Node2D

@onready var characters: Array[Node] = get_tree().get_nodes_in_group("character")
var character_in_love_ref: Character

@export var love_interest: Sprite2D
@export var game_over_screen: Control

signal sequence_started

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
	
func lose() -> void:
	game_over_screen.show()

func _on_love_interest_crush_entered() -> void:
	start_new_sequence()
