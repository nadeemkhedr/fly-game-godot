extends CharacterBody2D

const GRAVITY = 1900.0
const POWER = -400.0


var dead = false

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()


func fly():
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		$AnimationPlayer.play("fly")


func die():
	if dead:
		return
	dead = true
	$AnimatedSprite2D.stop()
	GameManager.on_game_over.emit()
	set_physics_process(false)
