extends Spatial

var ball_body:RigidBody = null
export var force:float = 0.0
var FORCE_MAX:float = 500.0
var original_pos:float = 0.0

func _ready():
	original_pos = transform.origin.z
	pass

func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		if force < FORCE_MAX:
			force += 20.0
			transform.origin.z = lerp(transform.origin.z, original_pos + 1.0, 0.01)
		else:
			force = FORCE_MAX
	else:
		transform.origin.z = lerp(transform.origin.z, original_pos, 0.03)
	
	if ball_body != null and Input.is_action_just_released("ui_up"):
		var ball:RigidBody = ball_body as RigidBody
		var direction = -global_transform.basis.y
		ball.apply_central_impulse(direction*force)
		$AudioStreamPlayer3D.play(0.0)
		force = 0.0
	
	if Input.is_action_just_released("ui_up"):
		force = 0.0
	pass

func _on_Area_body_entered(body):
	if body is RigidBody:
		print("1")
		ball_body = body
	pass

func _on_Area_body_exited(body):
	if body is RigidBody:
		print("2")
		ball_body = null
	pass
