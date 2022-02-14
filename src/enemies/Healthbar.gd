extends Node2D

var bar_red = preload("res://assets/bar-low.png")
var bar_green = preload("res://assets/bar-happy.png")
var bar_yellow = preload("res://assets/bar-normal.png")

onready var healthbar = $TextureProgress

func _ready():
	healthbar.max_value = get_parent().max_hp
#https://kidscancode.org/godot_recipes/ui/unit_healthbar/
func _physics_process(_delta):
	update_healthbar(get_parent().hp)
func update_healthbar(value):
	healthbar.texture_progress = bar_green
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar_yellow
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar_red
	if value < healthbar.max_value * 0.1:
		healthbar.texture_over = bar_red
	healthbar.value = value
