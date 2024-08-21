extends Node2D

func _ready():
	GUI.ToHide()
	Variables.xscore = 0
	Variables.oscore = 0


func _on_local_button_up():
	get_tree().change_scene_to_file("res://Scenes/Battle/Root.tscn")


func _on_cpu_button_up():
	get_tree().change_scene_to_file("res://Scenes/Battle/Roots/AI Root.tscn")
