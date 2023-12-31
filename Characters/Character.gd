extends Area2D
class_name Character

@onready var hint_icon: Sprite2D = $HintIcon
@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var outline_shader: Material = character_sprite.material
@onready var game: Game = get_tree().get_root().get_node("Game")
@onready var random_event_timer: Timer = $RandomEventTimer

@export var in_love: bool = false
@export var speech_control: Control

func _on_mouse_entered() -> void:
	outline_shader.set_shader_parameter("line_thickness", 1.0)

func _on_mouse_exited() -> void:
	outline_shader.set_shader_parameter("line_thickness", 0)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if event.button_index == 1:
			blame()

func set_in_love():
	in_love = true
	hint_icon.texture = load("res://UI/Assets/icon_love.png")
	
func unset_in_love():
	in_love = false
	hint_icon.texture = load("res://UI/Assets/icon_speaking.png")
	
func blame():
	game.win() if in_love else game.lose() 

func _on_start_sequence():
	randomize()
	if in_love:
		var random_time = randf_range(5, 18)
		if game.crush_buff_level != 0:
			random_time -= (game.crush_buff_level + 1) * 1.5
			random_time = clampf(random_time, 3.0, 999.0)
			
		random_event_timer.wait_time = random_time
	else:
		var random_time = randf_range(1, 20)
		if game.classmate_buff_level != 0:
			print("classamte time before: " + str (random_time))
			random_time += (game.classmate_buff_level + 1) * 1.5
				
			print("classamte time: " + str (random_time))
		random_event_timer.wait_time = random_time
	random_event_timer.start()

func _on_random_event_timer_timeout() -> void:
	speech_control.display_dialogue(in_love, game.has_highlight_buff)
	show_hint()
	
func show_hint():
	hint_icon.show()
	await get_tree().create_timer(2.0).timeout
	hint_icon.hide()
