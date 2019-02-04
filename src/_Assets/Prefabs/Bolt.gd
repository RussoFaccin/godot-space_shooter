extends Area

export (int) var speed
var velocity = Vector3()

func _ready():
	velocity = transform.basis.z

func _process(delta):
	transform.origin += -velocity * delta * speed


func _on_Bolt_body_entered(body):
	print('Collision:')
	print(body.name)


func _on_Bolt_area_exited(area):
	if (area.name == 'Boundary'):
		queue_free()
