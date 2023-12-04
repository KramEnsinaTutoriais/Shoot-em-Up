extends CharacterBody2D
@onready var wingLeft = $%wingLeft
@onready var wingRight = $%wingRight
var move = Vector2.ZERO
var speed = 300.0


func _physics_process(delta):
	
	set_moviment()
	call_shoot()
	
func set_moviment():
	
	move.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	move = move.normalized()*speed
	velocity = move
	move_and_slide()

func call_shoot():
	
	if Input.is_action_pressed("shoot"):
		
		wingLeft.Shoot()
		wingRight.Shoot()
		
func verify_parameters():
	
	match Global.parameters.wingLevel:
		
		1:
			pass
		2:
			pass
		3:
			pass
	
