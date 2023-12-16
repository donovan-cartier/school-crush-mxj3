extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var love_interest_sprites: Array[Texture2D]

signal crush_entered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	new_sequence()
	
func new_sequence() -> void:
	texture = love_interest_sprites.pick_random()
	animation_player.play("enter")
	crush_entered.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
