extends TextureRect

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.pitch_scale = randf_range(.8, 1.2)
	await get_tree().create_timer(2.0).timeout
	queue_free()
