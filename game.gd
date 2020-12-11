extends Node



var score = 0;



func _ready():
	Events.connect("coin_colleted",self, "_handle_coin_collected");
	Events.connect("player_died",self, "_handle_player_died");
	pass


func _handle_coin_collected():
	score += 1;
	
func _handle_player_died():
	score = 0;
	
