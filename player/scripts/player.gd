extends CharacterBody2D

var move = Vector2.ZERO
var speed = 300.0


func _physics_process(delta):
	
	set_moviment()

func set_moviment():
	
	move.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	move = move.normalized()*speed
	velocity = move
	move_and_slide()
	
