extends Area2D


export(String) var teleportScene;


func _ready():
	pass



func _on_Portal_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("player"):
		get_tree().change_scene("res://levels/"+teleportScene+".tscn");
	pass
