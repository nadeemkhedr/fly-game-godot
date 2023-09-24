extends Control

@onready var highscore_label = $MarginContainer/HBoxContainer/HighscoreLabel

func _ready():
	highscore_label.text = str(GameManager.high_score)
	
func _process(delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()
