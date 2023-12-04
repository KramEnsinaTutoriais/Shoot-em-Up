extends Area2D

var damage = 10
var speed = 1000
var destroy = false

func _ready():
	
	$AnimatedSprite2D.play("move")


func _physics_process(delta):
	
	position += transform.x*speed*delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	
	if destroy == false:
		queue_free()
	

func _on_body_entered(body):
	
	if !body.is_in_group("player") and destroy == false:
		set_physics_process(false)
		destroy = true
		$AnimatedSprite2D.play("destroy")
		$Timer.start()

func _on_timer_timeout():
	queue_free()
