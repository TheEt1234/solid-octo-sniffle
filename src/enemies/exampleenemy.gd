extends KinematicBody2D

var max_hp:float=3
var speed:int=100
var dmg:int=5
var hp:float=max_hp
var velocity:Vector2 = Vector2.ZERO
onready var player = $"/root/Node2D/Enviroment/octo"

func _physics_process(delta):
	velocity = (player.global_position - global_position) * delta * speed
	if hp <= 0:
		queue_free()
	velocity = move_and_slide(velocity)

func receive_dmg(dmg):
	hp = hp-dmg


func _on_Area2D_body_entered(body):
	if body.name == "octo":
		body.receive_dmg(dmg)
