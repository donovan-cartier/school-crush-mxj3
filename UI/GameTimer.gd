extends ProgressBar
class_name GameTimer

var decrease_speed: float = 3.0

@onready var game: Game = get_tree().get_root().get_node("Game")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value -= decrease_speed * delta
	if value <= 0:
		game.lose()


func _on_game_sequence_started() -> void:
	set_process(true)
	value = 100.0


func _on_game_round_won(round_number: int) -> void:
	set_process(false)
	decrease_speed += .5
	decrease_speed = clampf(decrease_speed, 3.0, 12.0)
