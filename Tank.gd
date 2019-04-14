extends Area2D

const MISSILE = preload("res://Missile.tscn")
var tankRadius = 500
var target

func _ready():
	var shape = CircleShape2D.new()
	shape.radius = tankRadius
	$CollisionShape2D.shape = shape
	pass

func _physics_process(delta):
	
	if target :
		rotation = (target.position - position).angle()
		if Input.is_action_just_pressed("ui_select"):
			var targetposition = get_parent().get_node("Actor")
			$Tween.interpolate_property(self,"scale",Vector2(2,1),Vector2(1,1),1.0,Tween.TRANS_ELASTIC,Tween.EASE_OUT)
			$Tween.start()
			var missile = MISSILE.instance()
			missile.start($Position2D.global_position,targetposition)
			get_parent().add_child(missile)

func _on_Tank_body_entered(body):
	target = body
	pass # replace with function body


func _on_Tank_body_exited(body):
	if body == target :
		target = null
	pass # replace with function body
