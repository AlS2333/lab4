extends CharacterBody3D


@export var move_speed: float = 5.0
@export var mouse_sensitivity: float = 0.3


var yaw: float = 0.0
var pitch: float = 0.0


func _process(delta):
	handle_mouse_look()  
	handle_movement(delta)


func handle_mouse_look():
	var mouse_delta = Input.get_last_mouse_velocity()  

	
	yaw -= mouse_delta.x * mouse_sensitivity
	pitch -= mouse_delta.y * mouse_sensitivity
	pitch = clamp(pitch, -90.0, 90.0)

	
	rotation_degrees.y = yaw
	
	$Camera3D.rotation_degrees.x = pitch


func handle_movement(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	
	direction = direction.normalized() * move_speed * delta
	
