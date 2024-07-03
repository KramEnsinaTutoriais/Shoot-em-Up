extends Node2D
@onready var anim = %anim
@export var Speed_R1 = 300
@export var Speed_R2 = 600
@export var Speed_R3 = 900


func _ready():
	
	set_type_rocket()
	
func set_type_rocket():
	
	var player = get_tree().get_nodes_in_group("player")
	match  Global.parameters.rocketLevel:
		1:
			anim.play("R1")
			if player.size() >0:
				player[0].speed = Speed_R1
		2:
			anim.play("R2")
			if player.size() >0:
				player[0].speed = Speed_R2
		3:
			anim.play("R3")
			if player.size() >0:
				player[0].speed = Speed_R3
