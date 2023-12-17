extends Label


func _on_game_bought_classmate_buff(level: int) -> void:
	text = str(level)


func _on_game_bought_crush_buff(level: int) -> void:
	text = str(level)
