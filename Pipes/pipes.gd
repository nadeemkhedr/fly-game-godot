extends Node2D

const SCROLL_SPEED = 120.0

@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D


func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(on_screen_exited)


func _process(delta):
	position.x -= SCROLL_SPEED * delta


func on_screen_exited():
	queue_free()
