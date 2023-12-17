extends Control

@onready var v_box_container: VBoxContainer = $VBoxContainer
var speech_scn = preload("res://UI/speech_bubble.tscn")

var dialogues: Array[String] = [
	"STOP TALKING SO LOUDLY OMG",
	"WHO IS THIS",
	"ANYONE GOT A PEN?",
	"ANYONE GOT AN ERASER?",
	"YALL SEEN THIS NEW GAME?",
	"WHY IS EVERYONE SPEAKING",
	"WHERE IS THE TEACHER",
	"WHEN IS LUNCH BREAK?",
	"WHY ARE PEOPLE COMING IN",
]

var special_dialogues: Array[String] = [
	"PRETTY GOOD LOOKING...",
	"I THINK I HAVE A CRUSH",
]

func display_dialogue(special: bool = false, highlight: bool = false):
	var speech_i = speech_scn.instantiate()
	if !special:
		speech_i.get_node("Label").text = dialogues.pick_random()
	else:
		speech_i.get_node("Label").text = special_dialogues.pick_random()
		if highlight:
			speech_i.modulate = Color(1, 0.059, 0, 0.663)
	v_box_container.add_child(speech_i)

