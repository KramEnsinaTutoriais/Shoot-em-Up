extends Node2D

var CounterCreatedEnemies = 0
var spawBoss = false

func create_enemie(minPos,MaxPos,target):
	
	var minPosx = minPos
	var MaxPosx = MaxPos
	var posX = randi_range(minPosx,MaxPosx)
	var enemy = preload("res://enemies/foguetinho/foguetinho.tscn").instantiate()
	get_parent().call_deferred("add_child",enemy)
	enemy.global_position = Vector2(posX,global_position.y)
	enemy.targetDir = target
	check_spawn()
	
func check_spawn():
	
	if Global.lv_dificult > 1:
		$TimerSpawn.wait_time = 2
		
	if CounterCreatedEnemies == 10:
		Global.lv_dificult += 1
		
	if CounterCreatedEnemies == 20:
		Global.lv_dificult += 1
		
	if CounterCreatedEnemies >= 30:
		Global.lv_dificult += 1
		spawBoss = true
	
func set_pattern():
	
	randomize()
	var patternNum = int(randi_range(1,3))
	var max_spawn = int(randi_range(1,5))
	if Global.lv_dificult <= 1:
		max_spawn = int(randi_range(1,3))
	match patternNum:
		1:#left
			var delay = Timer.new()
			add_child(delay)
			for i in max_spawn:
				delay.start(0.2);await (delay.timeout)
				match i :
					0:
						create_enemie(global_position.x,global_position.x+2200,"center")
					1:
						create_enemie(global_position.x,global_position.x+2200,"left")
					2:
						create_enemie(global_position.x,global_position.x+2200,"leftSpeed")
			delay.queue_free()
		2:#center
			var delay = Timer.new()
			add_child(delay)
			for i in max_spawn:
				delay.start(0.2);await (delay.timeout)
				create_enemie((global_position.x+2200),(global_position.x+4200),"center")
			delay.queue_free()
		3:#right
			var delay = Timer.new()
			add_child(delay)
			for i in max_spawn:
				delay.start(0.2);await (delay.timeout)
				
				match i :
					0:
						create_enemie((global_position.x+4200),(global_position.x+6500),"center")
					1:
						create_enemie((global_position.x+4200),(global_position.x+6500),"right")
					2:
						create_enemie((global_position.x+4200),(global_position.x+6500),"rightSpeed")
			delay.queue_free()


func _on_timer_spawn_timeout():
		
	if spawBoss == false:
		set_pattern()
	else:
		pass
		# instanciar nosso boss
	
