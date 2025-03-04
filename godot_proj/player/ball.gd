class_name Ball extends CharacterBody3D

@onready var _sm: StateMachine = %SM

var _direction: Vector2
var _speed: float
var _spin: float

func _ready() -> void:
	_sm.context["direction"] = _direction
	_sm.context["speed"] = _speed
	_sm.context["spin"] = _spin
	_sm.context["root"] = self

const spawn_file = "res://player/ball.tscn"

static func create(direction: Vector2, speed: float, spin: float) -> Ball:
	var b := load(spawn_file).instantiate() as Ball
	b._direction = direction
	b._speed = speed
	b._spin = spin
	return b
