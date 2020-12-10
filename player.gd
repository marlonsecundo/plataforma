extends KinematicBody2D


var gravity = 9.8;
var velocity = Vector2();
var speed = Vector2(200, 650);
var slowdown = Vector2(20, 0);
var acceleration = Vector2(0,0)
var max_acceleration = Vector2(450,0);
var speed_acce = 2;

func _ready():
	pass


func _physics_process(delta):
	velocity.y += gravity;
	
	velocity = move_and_slide(velocity, Vector2.UP);
	
	_handle_input();
	
	_handle_animation();
	
	_handle_acceleration();
	
	_handle_collision();
	
	
func _handle_input():
	if Input.is_action_pressed("ui_left"):
		acceleration.x += speed_acce;
		velocity.x = - speed.x - acceleration.x;
		
	elif Input.is_action_pressed("ui_right"):
		acceleration.x += speed_acce;
		velocity.x = speed.x + acceleration.x;
	else:
		_handle_no_input();
		
		
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		velocity.y = -speed.y;
		
func _handle_no_input():
	
	acceleration.x -= slowdown.x;
	
	if (velocity.x > 0):
		velocity.x -= slowdown.x;
	elif (velocity.x < 0):
		velocity.x += slowdown.x;
		
	if (velocity.x < slowdown.x && velocity.x > -slowdown.x):
		velocity.x = 0;
		
	if (acceleration.x < 0):
		acceleration.x = 0;
		
func _handle_animation():
	if (velocity.x < 0):
		$animation.flip_h = true;
	elif (velocity.x > 0):
		$animation.flip_h = false;
	
	if is_on_floor() && velocity.x != 0:
		$animation.play("walk");
	elif not is_on_floor():
		$animation.play("jump");
	else:
		$animation.play("idle");
		
func _handle_acceleration():
	if (acceleration.x > max_acceleration.x):
		acceleration.x = max_acceleration.x;
		
	
func _handle_collision():
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("danger"):
			Events.emit_signal("player_died");
