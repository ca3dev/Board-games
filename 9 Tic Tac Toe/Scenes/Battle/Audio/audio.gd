extends Node

func PlayPiece():
	var tmp = randi_range(0, 3)
	get_node(str(tmp)).play()
