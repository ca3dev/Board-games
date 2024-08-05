extends Node

var checked = []

func _ready():
	for x in 9:
		checked.append([])
		for y in 9:
			checked[x].append([])
			checked[x][y] = 0

func GetScore(id):
	var Map = []
	for x in 9:
		Map.append([])
		for y in 9:
			Map[x].append([])
	
	for x in 9:
		for y in 9:
			if checked[x][y] == 0:
				if %Board.Map[x][y].id == id:
					checked[x][y] = 1
					GetTileScore(id, x, y)
					CheckJoker(id, x, y)

func GetTileScore(id, x, y):
	CheckPos(id, x-1, y, x-2, y, x, y)
	CheckPos(id, x+1, y, x+2, y, x, y)
	CheckPos(id, x, y-1, x, y-2, x, y)
	CheckPos(id, x, y+1, x, y+2, x, y)
	CheckPos(id, x+1, y+1, x+2, y+2, x, y)
	CheckPos(id, x-1, y-1, x-2, y-2, x, y)
	CheckPos(id, x+1, y-1, x+2, y-2, x, y)
	CheckPos(id, x-1, y+1, x-2, y+2, x, y)
	CheckPos(id, x-1, y, x+1, y, x, y)
	CheckPos(id, x, y+1, x, y-1, x, y)
	CheckPos(id, x-1, y-1, x+1, y+1, x, y)
	CheckPos(id, x+1, y-1, x-1, y+1, x, y)

func CheckJoker(id, x, y):
	CheckComodin(3, id, id, x-1, y, x-2, y, x, y)
	CheckComodin(id, 3, id, x-1, y, x-2, y, x, y)
	CheckComodin(id, id, 3, x-1, y, x-2, y, x, y)
	CheckComodin(3, id, id, x+1, y, x+2, y, x, y)
	CheckComodin(id, 3, id, x+1, y, x+2, y, x, y)
	CheckComodin(3, id, id, x, y-1, x, y-2, x, y)
	CheckComodin(id, 3, id, x, y-1, x, y-2, x, y)
	CheckComodin(id, id, 3, x, y-1, x, y-2, x, y)
	CheckComodin(3, id, id, x, y+1, x, y+2, x, y)
	CheckComodin(id, 3, id, x, y+1, x, y+2, x, y)
	CheckComodin(id, id, 3, x, y+1, x, y+2, x, y)
	CheckComodin(3, id, id, x+1, y+1, x+2, y+2, x, y)
	CheckComodin(id, 3, id, x+1, y+1, x+2, y+2, x, y)
	CheckComodin(id, id, 3, x+1, y+1, x+2, y+2, x, y)
	CheckComodin(3, id, id, x-1, y-1, x-2, y-2, x, y)
	CheckComodin(id, 3, id, x-1, y-1, x-2, y-2, x, y)
	CheckComodin(id, id, 3, x-1, y-1, x-2, y-2, x, y)
	CheckComodin(3, id, id, x+1, y-1, x+2, y-2, x, y)
	CheckComodin(id, 3, id, x+1, y-1, x+2, y-2, x, y)
	CheckComodin(id, id, 3, x+1, y-1, x+2, y-2, x, y)
	CheckComodin(3, id, id, x-1, y+1, x-2, y+2, x, y)
	CheckComodin(id, 3, id, x-1, y+1, x-2, y+2, x, y)
	CheckComodin(id, id, 3, x-1, y+1, x-2, y+2, x, y)
	CheckComodin(3, id, id, x-1, y, x+1, y, x, y)
	CheckComodin(id, 3, id, x-1, y, x+1, y, x, y)
	CheckComodin(id, id, 3, x-1, y, x+1, y, x, y)
	CheckComodin(3, id, id, x, y+1, x, y-1, x, y)
	CheckComodin(id, 3, id, x, y+1, x, y-1, x, y)
	CheckComodin(id, id, 3, x, y+1, x, y-1, x, y)
	CheckComodin(3, id, id, x-1, y-1, x+1, y+1, x, y)
	CheckComodin(id, 3, id, x-1, y-1, x+1, y+1, x, y)
	CheckComodin(id, id, 3, x-1, y-1, x+1, y+1, x, y)
	CheckComodin(3, id, id, x+1, y-1, x-1, y+1, x, y)
	CheckComodin(id, 3, id, x+1, y-1, x-1, y+1, x, y)
	CheckComodin(id, id, 3, x+1, y-1, x-1, y+1, x, y)


func CheckPos(id, x, y, x2, y2, x3, y3):
	if IsValid(x, y) and IsValid(x2, y2) and IsValid(x3, y3) :
		if %Board.Map[x][y].id == id:
			if %Board.Map[x2][y2].id == id:
				if %Board.Map[x3][y3].id == id:
					checked[x][y] = 1
					checked[x2][y2] = 1
					checked[x3][y3] = 1
					AddScore(id)
					var colour
					if id == 1:
						colour = Color.BLUE
					if id == 2:
						colour = Color.RED
					%Board.Map[x][y].modulate = colour
					%Board.Map[x2][y2].modulate = colour
					%Board.Map[x3][y3].modulate = colour

func CheckComodin(id, id2, id3, x, y, x2, y2, x3, y3):
	if IsValid(x, y) and IsValid(x2, y2) and IsValid(x3, y3) :
		if %Board.Map[x][y].id == id:
			if %Board.Map[x2][y2].id == id2:
				if %Board.Map[x3][y3].id == id3:
					if %Board.Map[x][y].id == 3:
						%Board.Map[x][y].id = id
						%Board.Map[x][y].Update()
					if %Board.Map[x2][y2].id == 3:
						%Board.Map[x2][y2].id = id
						%Board.Map[x2][y2].Update()
					if %Board.Map[x3][y3].id == 3:
						%Board.Map[x3][y3].id = id
						%Board.Map[x3][y3].Update()
					checked[x][y] = 1
					checked[x2][y2] = 1
					checked[x3][y3] = 1
					var colour
					var nid = 0
					if id == 1 or id2 == 1 or id3 == 1:
						colour = Color.BLUE
						nid = 1
					else:
						colour = Color.RED
						nid = 2
					%Board.Map[x][y].Change(colour, nid)
					%Board.Map[x2][y2].Change(colour, nid)
					%Board.Map[x3][y3].Change(colour, nid)
					AddScore(nid)


func IsValid(x, y):
	if x < 0 or y < 0 or x > 8 or y > 8:
		return false
	return true

func AddScore(id):
	if id == 1:
		Variables.xscore += 1
	if id == 2:
		Variables.oscore += 1
