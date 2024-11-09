extends CharacterBody3D

@onready var char_mesh = $Mesh

const SPEED = 2.5
const JUMP_VELOCITY = 4.5

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle movement
	var input_dir: float = Input.get_axis("move_left", "move_right")
	print(input_dir)
	if input_dir != 0:
		velocity.x = input_dir * SPEED * 100.0 * delta
		match input_dir:
			1:
				char_mesh.rotation.y = deg_to_rad(0)
				print("Facing right")
			-1:
				char_mesh.rotation.y = deg_to_rad(90)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
