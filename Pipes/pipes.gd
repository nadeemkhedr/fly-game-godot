extends Node2D

const SCROLL_SPEED = 120.0

@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var upper = $Upper
@onready var lower = $Lower
@onready var laser = $Laser
@onready var score_sound = $ScoreSound


func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(on_screen_exited)
	upper.body_entered.connect(on_pipe_body_entered)
	lower.body_entered.connect(on_pipe_body_entered)
	laser.body_entered.connect(on_laser_body_entered)


func _process(delta):
	position.x -= SCROLL_SPEED * delta


func on_screen_exited():
	queue_free()


func player_scored():
	score_sound.play()
	GameManager.increment_score()

func on_pipe_body_entered(body: Node2D):
	if body.is_in_group(GameManager.GROUP_PLANE):
		body.die()


func on_laser_body_entered(body: Node2D):
	if body.is_in_group(GameManager.GROUP_PLANE):
		player_scored()
	
