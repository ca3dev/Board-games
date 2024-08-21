extends Node2D

func _ready():
	await get_tree().process_frame
	Update()
	$CanvasLayer/Comodin.text = ""
	
	$CanvasLayer/OScore.set("theme_override_colors/font_color", Variables.X_color)
	$CanvasLayer/OScore.set("theme_override_colors/font_outline_color", Variables.X_outline)
	$CanvasLayer/Oscorelabel.set("theme_override_colors/font_color", Variables.O_color)
	$CanvasLayer/Oscorelabel.set("theme_override_colors/font_outline_color", Variables.O_outline)
	
	$CanvasLayer/XScore.set("theme_override_colors/font_color", Variables.O_color)
	$CanvasLayer/XScore.set("theme_override_colors/font_outline_color", Variables.O_outline)
	$CanvasLayer/Xscorelabel.set("theme_override_colors/font_color", Variables.X_color)
	$CanvasLayer/Xscorelabel.set("theme_override_colors/font_outline_color", Variables.X_outline)

func Update():
	$CanvasLayer/HP.text = str(GetEmpty())
	$CanvasLayer/XScore.text = str(Variables.xscore)
	$CanvasLayer/OScore.text = str(Variables.oscore)
	if DataPaths.TurnCode != null:
		if DataPaths.TurnCode.TurnP1:
			$CanvasLayer/TurnID.text = "O TURN"
			$CanvasLayer/TurnID.set("theme_override_colors/font_color", Variables.O_color)
			$CanvasLayer/TurnID.set("theme_override_colors/font_outline_color", Variables.O_outline)
		else:
			$CanvasLayer/TurnID.text = "X TURN"
			$CanvasLayer/TurnID.set("theme_override_colors/font_color", Variables.X_color)
			$CanvasLayer/TurnID.set("theme_override_colors/font_outline_color", Variables.X_outline)

func SetComodin(newtext):
	$CanvasLayer/Comodin.text = newtext
	
func GetEmpty():
	
	if DataPaths.Board == null:
		return 0
	
	var hp = 0
	
	for x in 9:
		for y in 9:
			if DataPaths.Board.Map[x][y].id == 0:
				hp += 1
	
	if hp == 0:
		get_tree().change_scene_to_file("res://Scenes/Menues/gameover.tscn")
	
	return hp

func ToHide():
	$CanvasLayer/Label.hide()
	$CanvasLayer/HP.hide()
	$CanvasLayer/Oscorelabel.hide()
	$CanvasLayer/Xscorelabel.hide()
	$CanvasLayer/OScore.hide()
	$CanvasLayer/XScore.hide()
	$CanvasLayer/TurnID.hide()
	$CanvasLayer/Comodin.hide()
	$CanvasLayer/Asuka.hide()
	$CanvasLayer/quit.hide()

func ToShow():
	$CanvasLayer/Label.show()
	$CanvasLayer/HP.show()
	$CanvasLayer/Oscorelabel.show()
	$CanvasLayer/Xscorelabel.show()
	$CanvasLayer/OScore.show()
	$CanvasLayer/XScore.show()
	$CanvasLayer/TurnID.show()
	$CanvasLayer/Comodin.show()
	$CanvasLayer/Asuka.show()
	$CanvasLayer/quit.show()


func _on_quit_button_up():
	get_tree().change_scene_to_file("res://Scenes/Menues/gameover.tscn")
