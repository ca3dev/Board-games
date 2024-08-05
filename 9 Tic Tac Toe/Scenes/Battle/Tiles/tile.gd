extends TextureButton

@export var pos : Vector2i
@export var id : int

func _ready():
	$debug.hide()

func _on_button_up():
	if DataPaths.Board.Click(pos):
		DataPaths.TurnCode.Click()

func Update():
	$AnimatedSprite2D.frame = id

func Change(colour, i):
	$AnimatedSprite2D.modulate = colour
	id = i
	Update()

func Debug(cost):
	$debug.show()
	$debug.text = str(cost)
