extends Area2D
class_name Character

@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var outline_shader: Material = character_sprite.material
@onready var game: Node2D = get_tree().get_root().get_node("Game")

@export var in_love: bool = false

func _on_mouse_entered() -> void:
	outline_shader.set_shader_parameter("line_thickness", 1.0)

func _on_mouse_exited() -> void:
	outline_shader.set_shader_parameter("line_thickness", 0)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if event.button_index == 1:
			open_menu()

func open_menu():
	print("open")

func set_in_love():
	in_love = true
	print(name)

func blame():
	game.win() if in_love else game.lose() 
