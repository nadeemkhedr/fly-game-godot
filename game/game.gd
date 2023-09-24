extends Node2D

@export var pipes_scene: PackedScene

@onready var spawn_timer = $SpawnTimer
@onready var pipes_holder = $PipesHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var game_over = $CanvasLayer/GameOver

func _ready():
	GameManager.on_game_over.connect(on_game_over)
	GameManager.set_score(0)
	$SpawnTimer.timeout.connect(on_timer_timeout)
	spawn_pipes()


func spawn_pipes():
	var y_pos = randf_range(spawn_u.position.y, spawn_l.position.y)
	var new_pipes = pipes_scene.instantiate()
	new_pipes.position = Vector2(spawn_l.position.x, y_pos)
	pipes_holder.add_child(new_pipes)


func stop_pipes():
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)


func on_timer_timeout():
	spawn_pipes()


func on_game_over():
	stop_pipes()
