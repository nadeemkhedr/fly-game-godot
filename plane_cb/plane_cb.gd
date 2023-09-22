extends CharacterBody2D

const GRAVITY = 1900.0
const POWER = -400.0

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
	$AnimatedSprite2D.stop()
	set_physics_process(false)
