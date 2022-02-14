extends Node2D #Haha good one on that


# NOTE: >WdDWQI

#
onready var enemies = $"/root/Node2D/Enviroment/Enemies" # not for the memies
onready var spawning = $"/root/Node2D/Enviroment/octo/EnemySpawning"
var enemy_current = null
#func _physics_process(delta):
#	if enemy_current == null:
#		enemy_current = pick_random()
#	else:
#		if enemy_current != null:
#			look_at(enemy_current.position)
#
#func pick_random():
#	if enemies.get_child_count() != 0:
#		return enemies.get_children()[randi() % enemies.get_child_count()]
#	else:
#		return null 

func _physics_process(delta):
	if enemy_current != null:
		print(enemies.get_children().size())
		#https://godotengine.org/qa/10085/how-to-know-a-node-is-freed-or-deleted
		if weakref(enemy_current).get_ref():
			look_at(enemy_current.position)
		else:
			set_current_enemy()
	else:
		set_current_enemy()

func set_current_enemy():
	if enemies.get_children().size() != 0:
		enemy_current = enemies.get_children()[randi() % enemies.get_children().size()]
	else:
		#spawning.plus_one()
		pass
