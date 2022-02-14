extends KinematicBody2D # octo's body
# okay i think i should stop


var max_hp:float=15.3
var speed:int=600

var hp:float=max_hp
var velocity:Vector2

export (PackedScene) var Bullet
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("d"):
		velocity.x += 1
	if Input.is_action_pressed("a"):
		velocity.x -= 1
	if Input.is_action_pressed("s"):
		velocity.y += 1
	if Input.is_action_pressed("w"):
		velocity.y -= 1
	if Input.is_action_just_pressed("h"):
		shoot()
	velocity = velocity * speed # octo's funny physics

func _physics_process(delta):
	if hp != max_hp: hp=hp+0.03
	if hp <= 0:
		queue_free()
	$RPG.look_at(get_global_mouse_position())
	get_input()
	velocity = move_and_slide(velocity)

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $RPG.global_transform

func receive_dmg(dmg):
	hp = hp-dmg
