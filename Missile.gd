extends Area2D

var targetpos

func start(pos,target):
	position = pos
	targetpos = target
	$Sprite.play("default")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$Tween.interpolate_property(self,"position",position,targetpos.position,1.0,Tween.TRANS_CUBIC,Tween.EASE_OUT)
	$Tween.start()
	pass

func _on_Missile_body_entered(body):
	if body.name=="Actor":
		body.getShot()
	pass # replace with function body
