extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_ready():
	
	pass # Replace with function body.


func _on_area_2d_body_entered(_body) -> void:
	if _body is Character:
		get_tree().change_scene_to_file("res://levels/scenes/test_level.tscn")
