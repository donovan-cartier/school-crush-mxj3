extends HBoxContainer

@onready var highlight_buff_button: TextureButton = $HighlightBuffButton
@onready var classmate_buff_button: TextureButton = $ClassmateBuffButton
@onready var crush_buff_button: TextureButton = $CrushBuffButton
@onready var shhh_buff_button: TextureButton = $SHHHBuffButton
@onready var game: Game = get_tree().get_root().get_node("Game")

const BUFF_TOOLTIP_scn = preload("res://UI/buff_tooltip.tscn")

var classmate_buff_tooltip_i: BuffTooltip
var crush_buff_tooltip_i: BuffTooltip
var highlight_buff_tooltip_i: BuffTooltip
var shhh_buff_tooltip_i: BuffTooltip

func _on_game_can_buy_classmate_buff(value: bool) -> void:
	classmate_buff_button.disabled = !value

func _on_game_can_buy_crush_buff(value: bool) -> void:
	crush_buff_button.disabled = !value

func _on_game_can_buy_highlight_buff(value: bool) -> void:
	highlight_buff_button.disabled = !value

func _on_game_can_buy_shhh_buff(value: bool) -> void:
	shhh_buff_button.disabled = !value

func _on_classmate_buff_button_mouse_entered() -> void:
	classmate_buff_tooltip_i = BUFF_TOOLTIP_scn.instantiate()
	classmate_buff_button.add_child(classmate_buff_tooltip_i)
	classmate_buff_tooltip_i.set_infos("Calm Classmates", str(game.classmate_buff_level), "Makes classmates talk less.")

func _on_classmate_buff_button_mouse_exited() -> void:
	classmate_buff_tooltip_i.queue_free()


func _on_crush_buff_button_mouse_entered() -> void:
	crush_buff_tooltip_i = BUFF_TOOLTIP_scn.instantiate()
	crush_buff_button.add_child(crush_buff_tooltip_i)
	crush_buff_tooltip_i.set_infos("Expressive Crush", str(game.crush_buff_level), "Makes crush talk more.")


func _on_crush_buff_button_mouse_exited() -> void:
	crush_buff_tooltip_i.queue_free()


func _on_shhh_buff_button_mouse_entered() -> void:
	shhh_buff_tooltip_i = BUFF_TOOLTIP_scn.instantiate()
	shhh_buff_button.add_child(shhh_buff_tooltip_i)
	shhh_buff_tooltip_i.set_infos("SHHH!", "-", "Clears all screen messages.")

func _on_shhh_buff_button_mouse_exited() -> void:
	shhh_buff_tooltip_i.queue_free()


func _on_highlight_buff_button_mouse_entered() -> void:
	highlight_buff_tooltip_i = BUFF_TOOLTIP_scn.instantiate()
	highlight_buff_button.add_child(highlight_buff_tooltip_i)
	highlight_buff_tooltip_i.set_infos("Love Radar", "-", "Highlights crush messages. Permanent.")

func _on_highlight_buff_button_mouse_exited() -> void:
	highlight_buff_tooltip_i.queue_free()
