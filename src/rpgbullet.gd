extends Area2D

var speed = 750
var dmg = 0.754
func _physics_process(delta):
	position += transform.x * speed * delta

func _on_bullet_body_entered(body):
	if body.is_in_group("enemy"):
		body.receive_dmg(dmg) # NOTE: REPLACE REPLACE REPLACE
	queue_free()
