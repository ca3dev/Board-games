extends Node2D

@export var size : Vector2i
@export var Tile : PackedScene
@onready var Map  = []
@export var LocalVersus : bool
@export var idle : bool

func _ready():
	DataPaths.Board = self
	for x in size.x:
		Map.append([])
		for y in size.y:
			Map[x].append([])
			var tmp = Tile.instantiate()
			tmp.pos = Vector2i(x, y)
			tmp.id = 0
			tmp.global_position = Vector2(x * 32, y * 32)
			Map[x][y] = tmp
			add_child(tmp)
			
	Map[2][3].id = 3
	Map[2][3].Update()
	Map[6][3].id = 3
	Map[6][3].Update()
	Map[2][5].id = 3
	Map[2][5].Update()
	Map[6][5].id = 3
	Map[6][5].Update()
	Map[4][4].id = 3
	Map[4][4].Update()
	


func Click (pos):
	if not LocalVersus:
		return ClickP1(pos)
	else:
		if DataPaths.TurnCode.TurnP1 and idle:
			ClickP1(pos)
			%Turn.UpdateAIP1()
			Audio.PlayPiece()
			idle = false
			%AITimer.start(0.2)
	
func ClickP1(pos):
	if Map[pos.x][pos.y].id == 0:
		Audio.PlayPiece()
		if DataPaths.TurnCode.TurnP1:
			if DataPaths.TurnCode.oid == 2:
				GUI.SetComodin("JOKER")
			else:
				GUI.SetComodin("")
			DataPaths.TurnCode.xid += 1
			if DataPaths.TurnCode.xid > 2:
				DataPaths.TurnCode.xid = 0
				Map[pos.x][pos.y].id = 3
			else:
				Map[pos.x][pos.y].id = 1
		else:
			if DataPaths.TurnCode.xid == 2:
				GUI.SetComodin("JOKER")
			else:
				GUI.SetComodin("")
			DataPaths.TurnCode.oid += 1
			if DataPaths.TurnCode.oid > 2:
				DataPaths.TurnCode.oid = 0
				Map[pos.x][pos.y].id = 3
			else:
				Map[pos.x][pos.y].id = 2
		Map[pos.x][pos.y].Update()
		return true
	
	return false


func ClickAI():
	if DataPaths.TurnCode.xid == 2:
			GUI.SetComodin("JOKER")
	else:
		GUI.SetComodin("")
	DataPaths.TurnCode.oid += 1
	if DataPaths.TurnCode.oid > 2:
		DataPaths.TurnCode.oid = 0
		var aipos = %AI.CalculateMove()
		Map[aipos.x][aipos.y].id = 3
		Map[aipos.x][aipos.y].Update()
		%AIidle.start(0.2)
	else:
		var aipos = %AI.CalculateMove()
		Map[aipos.x][aipos.y].id = 2
		Map[aipos.x][aipos.y].Update()
		%AIidle.start(0.2)
	return true


func _on_ai_timer_timeout():
	ClickAI()

func _on_a_iidle_timeout():
	idle = true
	%Turn.UpdateAI()
