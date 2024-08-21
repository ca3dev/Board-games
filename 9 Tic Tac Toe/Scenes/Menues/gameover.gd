extends Node2D

func _ready():
	GUI.ToHide()
	
	$CanvasLayer/OScore.set("theme_override_colors/font_color", Variables.X_color)
	$CanvasLayer/OScore.set("theme_override_colors/font_outline_color", Variables.X_outline)
	$CanvasLayer/Oscorelabel.set("theme_override_colors/font_color", Variables.O_color)
	$CanvasLayer/Oscorelabel.set("theme_override_colors/font_outline_color", Variables.O_outline)
	
	$CanvasLayer/XScore.set("theme_override_colors/font_color", Variables.O_color)
	$CanvasLayer/XScore.set("theme_override_colors/font_outline_color", Variables.O_outline)
	$CanvasLayer/Xscorelabel.set("theme_override_colors/font_color", Variables.X_color)
	$CanvasLayer/Xscorelabel.set("theme_override_colors/font_outline_color", Variables.X_outline)
	
	if Variables.oscore < Variables.xscore:
		$CanvasLayer/Winner.text = "O WON"
		$CanvasLayer/Winner.set("theme_override_colors/font_color", Variables.O_color)
		$CanvasLayer/Winner.set("theme_override_colors/font_outline_color", Variables.O_outline)
	elif Variables.oscore > Variables.xscore:
		$CanvasLayer/Winner.text = "X WON"
		$CanvasLayer/Winner.set("theme_override_colors/font_color", Variables.X_color)
		$CanvasLayer/Winner.set("theme_override_colors/font_outline_color", Variables.X_outline)
	else:
		$CanvasLayer/Winner.text = "DRAW GAME"
	
	$CanvasLayer/OScore.text = str(Variables.oscore)
	$CanvasLayer/XScore.text = str(Variables.xscore)


func _on_button_button_up():
	get_tree().change_scene_to_file("res://Scenes/Menues/title.tscn")
