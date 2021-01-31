extends Spatial

var curr_angle:float = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_page_down"):
		curr_angle = PI/4
	if Input.is_action_just_pressed("ui_page_up"):
		curr_angle = 0.0
	rotation.x = lerp_angle(rotation.x, curr_angle, 0.1)
	pass
