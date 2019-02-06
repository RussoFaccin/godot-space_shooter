extends Area

export (int) var speed
var velocity = Vector3()

func _ready():
	velocity = transform.basis.z

func _process(delta):
	transform.origin += -velocity * delta * speed


func _on_Bolt_area_exited(area):
	if (area.name == 'Boundary'):
		print('========== BOUNDARY EXITED ==========')
		queue_free()


func _on_Bolt_body_entered(body):
	if (body.name == 'Asteroid'):
		body.queue_free()
		queue_free()