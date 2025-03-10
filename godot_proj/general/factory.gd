class_name Factory extends Object

const _ball_scene: String = "res://player/ball.tscn"

static func create_ball(direction: Vector2, speed: float, spin: float) -> Ball:
	var b := load(_ball_scene).instantiate() as Ball
	b.setup(direction, speed, spin)
	return b
