extends Node

var cell = load("res://Scenes/Battle/AI/Cell.gd")
var Map = []
var secondmap
var cost = 0
var humancost = 0

@export var debug : bool

func CalculateMove():
	GetMap()
	CalculateCost()
	
	if debug:
		PrintDebug()
	return PickBetterMove()

func GetMap():
	var nMap = []
	for x in 9:
		nMap.append([])
		for y in 9:
			nMap[x].append([])
			nMap[x][y] = cell.new()
			nMap[x][y].pos = Vector2i(x, y)
	Map = nMap

func PrintDebug():
	for x in 9:
		for y in 9:
			%Board.Map[x][y].Debug(Map[x][y].cost)

func CalculateCost():
	for x in 9:
		for y in 9: 
			if %Board.Map[x][y].id == 0:
				Map[x][y].cost += 2
			if %Board.Map[x][y].id == 1:
				Map[x][y].humancost += 1
			if %Board.Map[x][y].id == 3:
				Map[x][y].cost += 1
			CalculateLines(x, y)

func CalculateLines(x, y):
	if IsValid(x, y) and IsValid(x-1, y) and IsValid(x+1, y):
		CheckLine(x, y, x-1, y, x+1, y)
	if IsValid(x, y) and IsValid(x, y+1) and IsValid(x, y-1):
		CheckLine(x, y, x, y+1, x, y-1)
	if IsValid(x, y) and IsValid(x-1, y+1) and IsValid(x+1, y-1):
		CheckLine(x, y, x-1, y+1, x+1, y-1)
	if IsValid(x, y) and IsValid(x+1, y-1) and IsValid(x-1, y+1):
		CheckLine(x, y, x+1, y-1, x-1, y+1)

func CheckLine(x, y, x2, y2, x3, y3):
	if %Board.Map[x][y].id != 1 and %Board.Map[x2][y2].id != 1 and %Board.Map[x3][y3].id != 1:
		Map[x][y].cost += 3
	if %Board.Map[x][y].id == 1 and %Board.Map[x2][y2].id == 1 and %Board.Map[x3][y3].id == 1:
		Map[x][y].humancost += 3
	if %Board.Map[x][y].id == 3 and %Board.Map[x2][y2].id == 1 and %Board.Map[x3][y3].id == 1:
		Map[x][y].humancost += 3
	if %Board.Map[x][y].id == 1 and %Board.Map[x2][y2].id == 3 and %Board.Map[x3][y3].id == 1:
		Map[x][y].humancost += 3
	if %Board.Map[x][y].id == 1 and %Board.Map[x2][y2].id == 1 and %Board.Map[x3][y3].id == 3:
		Map[x][y].humancost += 3
	
func IsValid(x, y):
	if x < 0 or y < 0 or x > 8 or y > 8:
		return false
	return true

func PickBetterMove():
	var better = 0
	var pos = Vector2i.ZERO
	var human = 0
	
	for x in 9:
		for y in 9:
			if Map[x][y].cost >= better and Map[x][y].humancost <= human and %Board.Map[x][y].id == 0:
				better = Map[x][y].cost
				human = Map[x][y].humancost
				pos = Vector2i(x, y)
	
	return pos
