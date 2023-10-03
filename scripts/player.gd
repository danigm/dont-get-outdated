extends CharacterBody3D

signal walk(Vector3i)
signal stop(Vector3i)

@export var speed = 8.0

@export var burnout = 0
@export var security = 100
@export var server = 100

@export var outdate_speed = 0.2
@export var bug_speed = 0


func _physics_process(delta):
	# TODO: this is to debug, just udpate the server a bit
	if Input.is_action_just_pressed("ui_accept"):
		server += 10

	if Input.is_action_pressed("ui_accept"):
		$Animation.animation = "action"
		return

	_move()
	_process_mobs()
	move_and_slide()


func _move():
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


func _process_mobs():
	for index in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(index)

		# If the collision is with ground
		if (collision.get_collider() == null):
			continue

		var object = collision.get_collider()
		# If the collider is with a mob
		if object.is_in_group("mob"):
#			# TODO: check if we're hitting to kill the mob
			print("Collission with mob")


func update(world):
	# Update the player state based on the world and time passed
	server -= outdate_speed
	
	if server <= 0:
		server = 0
		security -= bug_speed * 3
	else:
		# if server is outdated, the number of bugs increases
		bug_speed = (100 - server) * 0.01
		if bug_speed > 0:
			security -= bug_speed

	# without security the burnout grows a lot
	if security <= 0:
		security = 0
		burnout += 2

	if burnout >= 100:
		# TODO: die
		print("DIE!")
