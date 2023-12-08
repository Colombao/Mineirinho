extends CharacterBody2D
class_name Character

var _state_machine
var is_dead: bool = false
var _is_attacking: bool = false
var e_press = KEY_E

@export_category("Variables")
@export var _move_speed: float = 64.0

@export var _acceleration: float = 0.2
@export var _friction: float = 0.2

@export_category("Objects")
@export var _attack_timer: Timer = null
@export var _animation_tree: AnimationTree = null

func _ready() -> void:
	_animation_tree.active = true
	_state_machine = _animation_tree["parameters/playback"]


func _physics_process(_delta: float) -> void:

	if slime_in_range == true:
		if Input.is_action_just_pressed("ui_filedialog_show_hidden"):
			await(DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/slime.dialogue"), "comeco"))
#			print(global.inicio_aventura)
			return
			
	if king_in_range == true:
		if Input.is_action_just_pressed("ui_filedialog_show_hidden"):
			await(DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/KingDwarfd.dialogue"), "apresentacao_rei_anao"))
			return
			
	if archer_in_range == true:
		if Input.is_action_just_pressed("ui_filedialog_show_hidden"):
			await(DialogueManager.show_example_dialogue_balloon(load("res://Dialogos/slime.dialogue"), "comeco"))
			return
			
	if is_dead:
		return
			
			
	_move()
	_attack()
	_animate()
	move_and_slide()
	
func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if _direction != Vector2.ZERO:
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/walk/blend_position"] = _direction
		_animation_tree["parameters/attack/blend_position"] = _direction
		
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)
	
func _attack() -> void:
	if Input.is_action_just_pressed("attack") and not _is_attacking:
		set_physics_process(false)
		_attack_timer.start()
		_is_attacking = true
		
		
func _animate() -> void:
	if _is_attacking:
		_state_machine.travel("attack")
		return
		
	if velocity.length() > 5:
		_state_machine.travel("walk")
		return
		
	_state_machine.travel("idle")
	pass

var slime_in_range = false
var king_in_range = false
var archer_in_range = false

func _on_attack_timer_timeout() -> void:
	set_physics_process(true)
	_is_attacking = false


func _on_attack_area_body_entered(_body) -> void:
	if _body.is_in_group("enemy"):
		_body.update_health()
	
	
func die() -> void:
	is_dead = true
	_state_machine.travel("death")
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
	

func _on_area_2d_body_entered(_body):
	if _body.has_method("slime"):
		slime_in_range = true
	if _body.has_method("king"):
		king_in_range = true
	if _body.has_method("archer"):
		archer_in_range = true

func _on_area_2d_body_exited(_body):
	if _body.has_method("slime"):
		slime_in_range = false
	if _body.has_method("king"):
		king_in_range = false
	if _body.has_method("archer"):
		archer_in_range = false

