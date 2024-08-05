extends Node

@export var TurnP1 : bool
@export var HP : int
@export var xid : int
@export var oid : int

func _ready():
	DataPaths.TurnCode =  self
	

func Click():
	TurnP1 = !TurnP1
	HP -= 1
	%Score.GetScore(1)
	%Score.GetScore(2)
	GUI.Update()

func UpdateAI():
	HP -= 1
	%Score.GetScore(2)
	GUI.Update()

func UpdateAIP1():
	HP -= 1
	%Score.GetScore(1)
	GUI.Update()
