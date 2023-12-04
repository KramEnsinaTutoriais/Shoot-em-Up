extends Node2D
var AmountShootPoints = 1
var freqDelay = 0.5
var canShoot = true

func _ready():
	
	set_type_wing()
	
func set_type_wing():
		
	match Global.parameters.wingLevel:
		
		1:
			$anim.play("wing_1")
			$AnimPos.play("w1")
			AmountShootPoints = 1
		2:
			$anim.play("wing_2")
			$AnimPos.play("w2")
			AmountShootPoints = 2
		3:
			$anim.play("wing_3")
			$AnimPos.play("w3")
			AmountShootPoints = 3

func Shoot():
	
	if canShoot :
		
		canShoot = false
		
		for i in AmountShootPoints:
			print(i)
			var bullet = preload("res://player/bullets/bullet.tscn").instantiate()
			get_tree().get_root().call_deferred("add_child",bullet)
			bullet.global_position = get_node(str("pos",i)).global_position
			bullet.global_transform = get_node(str("pos",i)).global_transform
			
		$Timer.start(freqDelay);await $Timer.timeout
		canShoot =true
