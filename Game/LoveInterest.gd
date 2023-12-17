extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var love_interest_sprites: Array[Texture2D]

signal crush_entered
	
func new_sequence(first: bool = false) -> void:
	if !first:
		animation_player.play_backwards("enter")
		await animation_player.animation_finished
	texture = love_interest_sprites.pick_random()
	animation_player.play("enter")
	crush_entered.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
