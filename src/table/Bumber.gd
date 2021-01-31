extends Spatial

export var left = false
export var force:float = 50.0

var speed:float = (100.0 - force)/100.0

func _ready():
	pass

func _process(delta):
	if !left:
		if Input.is_action_pressed("ui_right"):
			rotation.y = lerp_angle(rotation.y, PI - PI/3, speed)
		else:
			rotation.y = lerp_angle(rotation.y, PI, speed/3)
		$bumper_player.set_moving(Input.is_action_just_pressed("ui_right"))
	else:
		if Input.is_action_pressed("ui_left"):
			rotation.y = lerp_angle(rotation.y, PI/3, speed)
		else:
			rotation.y = lerp_angle(rotation.y, 0, speed/3)
		$bumper_player.set_moving(Input.is_action_just_pressed("ui_left"))
	pass
