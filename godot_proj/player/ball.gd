class_name Ball extends CharacterBody3D

var _direction: Vector2
var _speed: float
var _spin: float

func _physics_process(_delta: float) -> void:
	velocity = Vector3(_direction.x, 0, _direction.y) * _speed
	move_and_slide()

const spawn_file: PackedScene = preload("res://player/ball.tscn")

static func create(direction: Vector2, speed: float, spin: float) -> Ball:
	var b := spawn_file.instantiate() as Ball
	b._direction = direction
	b._speed = speed
	b._spin = spin
	return b
