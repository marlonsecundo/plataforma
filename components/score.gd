extends Node2D

func _ready():
	
	
	pass
	
func _process(delta):
	$text.text = str(Game.score);


