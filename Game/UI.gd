extends Control

@onready var points_label: Label = $Points
@onready var ok_label_animation_player: AnimationPlayer = $OKLabel/AnimationPlayer


func _on_game_obtained_points(total_points) -> void:
	points_label.text = "MONEY: " + str(total_points)
	ok_label_animation_player.play("show")


func _on_game_spent_points(total_points: Variant) -> void:
	points_label.text = "MONEY: " + str(total_points)
