extends Spatial

var moving:bool = false
var ball_body:RigidBody = null
export var force:float = 30.0

func _ready():
	pass

func set_moving(mov:bool):
	moving = mov
	if moving:
		$AudioStreamPlayer3D.play(0)
	pass

func _process(delta):
	if moving and ball_body != null:
		var direction = -$Cube2/Area/CollisionShape.global_transform.basis.z
		var direction_alter = $Cube2/Area/CollisionShape.global_transform.origin.direction_to(
			ball_body.global_transform.origin).normalized()
		var direction_final = direction + direction_alter
		ball_body.apply_central_impulse(direction_final*force)
	pass

func _on_Area_body_entered(body):
	if body is RigidBody:
		ball_body = body
	pass

func _on_Area_body_exited(body):
	if body is RigidBody:
		ball_body = null
	pass
