extends RigidBody

export (int) var TUMBLE
export (int) var SPEED

func _ready():
	angular_velocity = getRandVect3() * TUMBLE
	linear_velocity = Vector3(0, 0, 1) * SPEED
	
# ================================================================================
# Random Vector3
# ================================================================================

func getRandVect3():
	return Vector3(
		rand_range(0.0, 1.0),
		rand_range(0.0, 1.0),
		rand_range(0.0, 1.0)
	)
