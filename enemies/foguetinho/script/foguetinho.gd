extends Area2D

var speed = 12
var destroyed = false
var life = 30
var targetDir = ""
func  _physics_process(delta):
	
	if destroyed == false:
		position.y += speed
	match targetDir:
		"left":
			position.x += speed
		"right":
			position.x -= speed
		"leftSpeed":
			position.x += (speed*1.5)
		"rightSpeed":
			position.x -= (speed*1.5)
			
func create_shoot():
	
	var bullet = preload("res://enemies/foguetinho/bulletEnemy1.tscn").instantiate()
	get_tree().get_root().call_deferred("add_child",bullet)
	bullet.global_position = $Marker2D.global_position
	bullet.global_transform = $Marker2D.global_transform
	bullet.speed = 1500
func _on_visible_on_screen_notifier_2d_screen_exited():
	
	queue_free()
	

func _on_timer_shoot_timeout():
	if destroyed == false:
		create_shoot()
	
func destroy():
	
	if life <= 0:
		destroyed = true
		set_physics_process(false)
		$AnimationPlayer.play("destroy")
		
func _on_area_entered(area):
	if area.is_in_group("bulletPlayer"):
		print(area.damage)
		life -= area.damage
		destroy()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "destroy":
		print("destruiu")
		$".".queue_free()
