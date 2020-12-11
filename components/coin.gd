extends Area2D



func _ready():
	
	
	pass



func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		get_parent().remove_child(self);
		Events.emit_signal("coin_colleted");
		
		
	pass
