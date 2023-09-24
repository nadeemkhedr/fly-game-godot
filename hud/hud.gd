extends Control

@onready var score_label = $MarginContainer/ScoreLabel

func _ready():
	GameManager.on_score_updated.connect(on_score_updated)
	

func on_score_updated():
	score_label.text = str(GameManager.score) 
