class_name Ball extends CharacterBody3D

@onready var _sm: StateMachine = %SM

var _direction: Vector2
var _speed: float
var _spin: float

func setup(direction: Vector2, speed: float, spin: float):
	_direction = direction
	_speed = speed
	_spin = spin

func _ready() -> void:
	_sm.context["direction"] = _direction
	_sm.context["speed"] = _speed
	_sm.context["spin"] = _spin
	_sm.context["root"] = self
