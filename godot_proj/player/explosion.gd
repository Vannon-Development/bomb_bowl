class_name Explosion extends Node3D

@onready var _light : OmniLight3D = %Light
@onready var _model: MeshInstance3D = %Model

@export var _exp_time: float
@export var _scale_max: float = 4.0
@export var _light_size_max: float = 6.0
@export var _light_energy_max: float = 4.0

var _time: float = 0.0

func _physics_process(delta: float) -> void:
	_time += delta
	if _time >= _exp_time: queue_free()
	var sc := remap(_time, 0, _exp_time, 0.01, _scale_max)
	_model.scale = Vector3(sc, sc, sc)
	(_model.get_active_material(0) as StandardMaterial3D).albedo_color.a = clampf(remap(_time, _exp_time / 2.0, _exp_time, 1.0, 0.0), 0.0, 1.0)
	_light.omni_range = remap(_time, 0, _exp_time, 0.02, _light_size_max)
	_light.light_energy = remap(_time, 0, _exp_time, 0.01, _light_energy_max)

const _create_file := "res://player/explosion.tscn"

static func create() -> Explosion:
	return load(_create_file).instantiate()
