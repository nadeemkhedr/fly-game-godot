extends Node


signal on_game_over
signal on_score_updated

const GROUP_PLANE = "plane"


var game_scene = preload("res://game/game.tscn")
var main_scene = preload("res://main/main.tscn")


var score = 0
var high_score = 0


func set_score(v: int):
	score = v
	if score > high_score:
		high_score = score
	on_score_updated.emit()
	print("sc:%s hs:%s" % [score, high_score] )


func increment_score():
	set_score(score + 1)


func load_game_scene():
	get_tree().change_scene_to_packed(game_scene)


func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)
