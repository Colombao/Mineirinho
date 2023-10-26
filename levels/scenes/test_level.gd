extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/introducao.dialogue"), "inicio")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_on_portal_ready()
	pass

func _on_door_component_area_entered(area):
	pass

func _on_portal_body_entered(_body):
	if _body is Character:
		get_tree().change_scene_to_file("res://levels/scenes/LevelCave.tscn")

func _on_portal_ready():
	if global.inicio_aventura:
		$"Portal".show()
	else:
		$"Portal".hide()

