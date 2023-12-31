extends Node2D
class_name Game

@onready var characters: Array[Node] = get_tree().get_nodes_in_group("character")
var character_in_love_ref: Character

var points: int = 0
var score: int = 0

var classmate_buff_cost: int = 10
var crush_buff_cost: int = 10
var highlight_buff_cost: int = 10
var shhh_buff_cost: int = 10

var classmate_buff_level: int = 0
var crush_buff_level: int = 0
var has_highlight_buff: bool = false

@export var love_interest: Sprite2D
@export var game_over_screen: Control
@export var tutorial_screen: Control
@export var game_timer: GameTimer
@export var bgm_player: AudioStreamPlayer
@export var win_player: AudioStreamPlayer

var current_round: int = 0

signal round_won(round_number: int)
signal sequence_started
signal obtained_points(total_points)
signal spent_points(total_points)

signal bought_classmate_buff(level: int)
signal bought_crush_buff(level: int)
signal bought_highlight_buff

signal can_buy_classmate_buff(value: bool)
signal can_buy_crush_buff(value: bool)
signal can_buy_highlight_buff(value: bool)
signal can_buy_shhh_buff(value: bool)

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
	points += (game_timer.value / 100) * 30
	
	obtained_points.emit(points)
	round_won.emit(current_round)
	check_buff_costs()
	win_player.play()
	
	
func lose() -> void:
	game_over_screen.show()

func _on_love_interest_crush_entered() -> void:
	start_new_sequence()
	

func _on_classmate_buff_button_pressed() -> void:
	if points >= classmate_buff_cost:
		classmate_buff_level += 1
		points -= classmate_buff_cost
		classmate_buff_cost += 10
		spent_points.emit(points)
		bought_classmate_buff.emit(classmate_buff_level)
		

func _on_crush_buff_button_pressed() -> void:
	if points >= crush_buff_cost:
		crush_buff_level += 1
		points -= crush_buff_cost
		crush_buff_cost += 10
		spent_points.emit(points)
		bought_crush_buff.emit(crush_buff_level)
		


func _on_highlight_buff_button_pressed() -> void:
	if points >= highlight_buff_cost && !has_highlight_buff:
		points -= highlight_buff_cost
		spent_points.emit(points)
		has_highlight_buff = true
		bought_highlight_buff.emit()

func _on_spent_points(total_points: Variant) -> void:
	check_buff_costs()

func check_buff_costs():
	can_buy_classmate_buff.emit(points >= classmate_buff_cost)
	can_buy_crush_buff.emit(points >= crush_buff_cost)
	can_buy_highlight_buff.emit(points >= highlight_buff_cost)
	can_buy_shhh_buff.emit(points >= shhh_buff_cost)



func _on_shhh_buff_button_pressed() -> void:
	if points >= shhh_buff_cost:
		points -= shhh_buff_cost
		spent_points.emit(points)
		for message in get_tree().get_nodes_in_group("message"):
			message.queue_free()


func _on_start_button_pressed() -> void:
	love_interest.new_sequence(true)
	tutorial_screen.hide()
	bgm_player.play()


func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/game.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
