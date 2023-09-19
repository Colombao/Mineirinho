extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _body_entered(_body):
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/placa.dialogue"), "placa")

