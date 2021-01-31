extends HingeJoint

func _ready():
	pass

func _process(delta):
	var angle_j = $MeshInstance.global_transform.origin.angle_to(
		$RigidBody.global_transform.origin
	)
	if angle_j >= 0.01:
		print(angle_j)
	pass
