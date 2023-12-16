extends Node2D

@onready var characters: Array[Node] = get_tree().get_nodes_in_group("character")

func start_new_sequence() -> void:
	characters.pick_random().set_in_love()

func win() -> void:
	start_new_sequence()
	
func lose() -> void:
	print(':(')


func _on_love_interest_crush_entered() -> void:
	start_new_sequence()
