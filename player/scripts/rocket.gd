extends Node2D
@onready var anim = %anim
@export var Speed_R1 = 300
@export var Speed_R2 = 600
@export var Speed_R3 = 900
@onready var p1 = %particle1
@onready var p2 = %particle2
@onready var p3 = $particle3

func _ready():
	
	set_type_rocket()
	
func set_type_rocket():
	
	var player = get_tree().get_nodes_in_group("player")
	match  Global.parameters.rocketLevel:
		1:
			anim.play("R1")
			p1.visible = true
			p1.emitting = true
			p2.emitting = false
			p2.visible = false
			p3.emitting = false
			p3.visible = false
			if player.size() >0:
				player[0].speed = Speed_R1
				
		2:
			anim.play("R2")
			p1.visible = false
			p1.emitting = false
			p2.emitting = true
			p2.visible = true
			p3.emitting = true
			p3.visible = true
			p2.position = Vector2(-35,25)
			p3.position = Vector2(35,25)
			if player.size() >0:
				player[0].speed = Speed_R2
		3:
			anim.play("R3")
			p1.visible = true
			p1.emitting = true
			p2.emitting = true
			p2.visible = true
			p3.emitting = true
			p3.visible = true
			p2.position = Vector2(-45,50)
			p3.position = Vector2(45,50)
			if player.size() >0:
				player[0].speed = Speed_R3
				
