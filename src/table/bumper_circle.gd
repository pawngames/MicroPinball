extends Spatial

export var force_bump:float = 15.0
export var points:int = 10

signal point(qty)

func _ready():
	$OmniLight/Tween.interpolate_property(
		$OmniLight,
		"light_energy",
		2.0,
		0.0,
		.5,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	$OmniLight/Tween.start()
	pass

func _process(delta):
	pass

func _on_Area_body_entered(body):
	if body is RigidBody:
		var ball:RigidBody = body as RigidBody
		var direction = global_transform.origin.direction_to(
				body.global_transform.origin
			).normalized()
		ball.apply_central_impulse(direction*force_bump)
		$AudioStreamPlayer3D.play(0)
		$OmniLight/Tween.interpolate_property(
			$OmniLight,
			"light_energy",
			0.0,
			2.0,
			.1,
			Tween.TRANS_SINE,
			Tween.EASE_IN_OUT
		)
		$OmniLight/Tween.interpolate_property(
			$OmniLight,
			"light_energy",
			2.0,
			0.0,
			.3,
			Tween.TRANS_SINE,
			Tween.EASE_IN_OUT,
			.1
		)
		$OmniLight/Tween.start()
		emit_signal("point", points)
	pass # Replace with function body.

