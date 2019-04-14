extends KinematicBody2D

var speed = 200
var motion = Vector2()
var count = 0

func _ready():
	$Sprite.modulate = Color("f40000")
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	elif Input.is_action_pressed("ui_up"):
		motion.y = -speed
	elif Input.is_action_pressed("ui_down"):
		motion.y = speed
	else :
		motion.x = 0
		motion.y = 0
	move_and_slide(motion)
	
func getShot():
	if count<5:
		$Sprite.modulate = Color("ff4d00")
		$Tween.interpolate_property(self,"scale",Vector2(2,1),Vector2(1,1),1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
		$Tween.start()
		get_parent().get_node("Missile").queue_free()
		count = count+1
	else:
		get_parent().get_node("Missile").queue_free()
		queue_free()