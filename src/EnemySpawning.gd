extends Area2D

var Enemy=load("res://src/enemies/exampleenemy.tscn")
var NEO=load("res://src/enemies/Enemy NEO.tscn")
var o_round = 0

func plus_one():
	o_round +=1
	new_round(o_round)
func _ready():
	randomize()
	plus_one()
func new_round(o_round):
	if o_round >= 5:
		for i in o_round/5: # every 5 o_round +1
			yield(get_tree().create_timer(1.0), "timeout")
			var enemy = NEO.instance()
			enemy.position = Vector2(rand_range($CollisionShape2D.shape.extents.x, $CollisionShape2D.shape.extents.y ),
			 rand_range($CollisionShape2D.shape.extents.x,$CollisionShape2D.shape.extents.y))
			get_parent().get_parent().get_node("Enemies").add_child(enemy)

	if o_round <= 120:
		for i in o_round/6+10: # a lot, usally more than 10
			yield(get_tree().create_timer(1.0), "timeout")
			var enemy = Enemy.instance()
			enemy.position = Vector2(rand_range($CollisionShape2D.shape.extents.x, $CollisionShape2D.shape.extents.y ),
			 rand_range($CollisionShape2D.shape.extents.x,$CollisionShape2D.shape.extents.y))
			get_parent().get_parent().get_node("Enemies").add_child(enemy)
