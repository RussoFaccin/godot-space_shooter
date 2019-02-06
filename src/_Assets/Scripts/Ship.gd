extends RigidBody

var SPEED = 10
var tiltFactor = 15
var cannon
var bolt
var boltPref
var now = 0
var fireRate = 0.25

var boundary = {
	"xMin": -6,
	"xMax": 6,
	"zMin": -6,
	"zMax": 10
}

var movement = Vector3()

func _ready():
	cannon = get_node('Cannon')
	var root = get_node('/root')
	boltPref = preload('res://_Assets/Prefabs/Bolt.tscn')
	
func _process(delta):
	now += delta
	handleInput()
	
	if (Input.is_key_pressed(KEY_SPACE) && now >= fireRate):
		spawnBolt()
		now = 0

func _physics_process(delta):
	pass
	
func _integrate_forces(state):
	state.linear_velocity = movement * SPEED
	state.transform.origin = Vector3(
		clamp(state.transform.origin.x, boundary["xMin"], boundary["xMax"]),
		0,
		clamp(state.transform.origin.z, boundary["zMin"], boundary["zMax"])
	)
	rotate_z(movement.x * tiltFactor)
	
func handleInput():
	movement.x = 0
	movement.z = 0
	if Input.is_action_pressed('ui_right'):
		movement.x = 1
	if Input.is_action_pressed('ui_left'):
		movement.x = -1
	if Input.is_action_pressed('ui_up'):
		movement.z = -1
	if Input.is_action_pressed('ui_down'):
		movement.z = 1
		
func spawnBolt():
	bolt = boltPref.instance()
	cannon.add_child(bolt)