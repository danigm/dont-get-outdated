extends CharacterBody3D

signal walk(Vector3i)
signal stop(Vector3i)

var speed = 8.0

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		$Animation.animation = "action"
		return

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	if velocity.x or velocity.z:
		$Animation.animation = "walk"
		$Animation.flip_v = false
		walk.emit(position)
	else:
		$Animation.animation = "default"
		stop.emit(position)
	
	if velocity.x:
		$Animation.flip_h = velocity.x < 0

	move_and_slide()
