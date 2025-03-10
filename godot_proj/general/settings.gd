class_name Settings extends Resource

enum ControlType { MOUSE, GAMEPAD }

@export var control_type: ControlType = ControlType.MOUSE
@export var mouse_sensitivity: float = 1.0
@export var fullscreen: bool = false

static var _instance
const _path := "user://settings.res"

static func get_settings() -> Settings:
	if not is_instance_valid(_instance):
		if ResourceLoader.exists(_path):
			_instance = load(_path)
		else:
			_instance = Settings.new()
			_instance.resource_path = _path
			ResourceSaver.save(_instance)
	return _instance

static func save_settings():
	if not is_instance_valid(_instance):
		get_settings()
	ResourceSaver.save(_instance)
