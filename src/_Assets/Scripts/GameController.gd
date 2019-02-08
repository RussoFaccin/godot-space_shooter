extends Spatial

var asteroidPref
var hazards

var boundary = {
	"xMin": -7,
	"xMax": 7
}

var qtdHazards = 5;

func _init():
	asteroidPref = preload("res://_Assets/Prefabs/Asteroid.tscn")

func _ready():
	hazards = get_node("Hazards")
	
	for i in qtdHazards:
		spawnWaves()
		
func _process(delta):
	pass

func spawnWaves():
	randomize()
	var hazardPosX = rand_range(boundary["xMin"], boundary["xMax"])
	var hazard = asteroidPref.instance()
	hazard.transform.origin = Vector3(hazardPosX, 0, 0)
	hazards.add_child(hazard)


