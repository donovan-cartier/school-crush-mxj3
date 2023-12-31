extends Control

@onready var points_label: Label = $Points
@onready var ok_label_animation_player: AnimationPlayer = $OKLabel/AnimationPlayer
@onready var score: Label = $Score
@onready var game: Game = get_tree().get_root().get_node("Game")

func _on_game_obtained_points(total_points) -> void:
	points_label.text = "MONEY: " + str(total_points)
	ok_label_animation_player.play("show")
	game.score += 1
	score.text = "SCORE: " + str(game.score)


func _on_game_spent_points(total_points: Variant) -> void:
	points_label.text = "MONEY: " + str(total_points)
