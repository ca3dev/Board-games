extends Node2D

func _ready():
	await get_tree().process_frame
	Update()
	$CanvasLayer/Comodin.text = ""

func Update():
	$CanvasLayer/HP.text = str(DataPaths.TurnCode.HP)
	$CanvasLayer/XScore.text = str(Variables.xscore)
	$CanvasLayer/OScore.text = str(Variables.oscore)
	if DataPaths.TurnCode.TurnP1:
		$CanvasLayer/TurnID.text = "O turn"
	else:
		$CanvasLayer/TurnID.text = "X turn"

func SetComodin(newtext):
	$CanvasLayer/Comodin.text = newtext
