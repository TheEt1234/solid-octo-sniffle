extends KinematicBody2D

var max_hp:float=13
var speed:int=150
var dmg:int=9
var hp:float=max_hp
var velocity:Vector2 = Vector2.ZERO
var lethal_strike = false
onready var player = $"/root/Node2D/Enviroment/octo"

func _physics_process(delta):
	velocity = (player.global_position - global_position) * delta * speed
	if hp <= 0:
		if lethal_strike == true:
			queue_free()
		else:
			hp += 0.1
			lethal_strike = true
			max_hp = 0.1
	if hp < max_hp and !lethal_strike:	hp += 0.01
	velocity = move_and_slide(velocity)

func receive_dmg(dmg):
	hp = hp-dmg


func _on_Area2D_body_entered(body):
	if body.name == "octo":
		body.receive_dmg(dmg)
		body.receive_dmg(dmg/50)
		position -= position.direction_to(body.position) * speed*3
