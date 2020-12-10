extends Node2D


var spawn_position = Vector2(1020, 2500);



func _ready():
	Events.connect("player_died", self, "player_died");
	pass


func player_died():
	$Player.position = spawn_position;
	
