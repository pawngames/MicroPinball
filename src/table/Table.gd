extends Spatial

var points:int = 0

func _ready():
	$Spatial/Viewport/UI/CenterContainer/Label.text = str(points)
	for bumper in $Bumpers.get_children():
		bumper.connect("point", self, "_point_count")
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		print("shake")
	pass

func _point_count(points_add:int):
	points += points_add
	$Spatial/Viewport/UI/CenterContainer/Label.text = str(points)
	pass
