extends Control

@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel
@onready var timer = $Timer


var can_press_space = false

func _ready():
	timer.timeout.connect(on_timer_timeout)
	GameManager.on_game_over.connect(on_game_over)


func _process(delta):
	if can_press_space && Input.is_action_just_pressed("fly"):
		GameManager.load_main_scene()


func on_game_over():
	show()
	timer.start()
	

func run_sequence():
	game_over_label.hide()
	press_space_label.show()
	can_press_space = true


func on_timer_timeout():
	run_sequence()
