extends Node2D

export var size: int = 1
var color: Color = Color.red

func draw_horizontal_laser(target: Vector2, size: int, color: Color):
	var current_position = Vector2(0, 0)
	
	var y_size = ceil(abs(target.y / size))
	var x_size = target.x / y_size
	
	for i in y_size:
		var rect = Rect2(current_position, Vector2(x_size, size * sign(target.y)))
		draw_rect(rect, color)
		current_position.x += x_size 
		current_position.y += size * sign(target.y)
	
func draw_vertical_laser(target: Vector2, size: int, color: Color):
	var current_position = Vector2(0, 0)
	
	var x_size = ceil(abs(target.x / size))
	var y_size = target.y / x_size
	
	for i in x_size:
		var rect = Rect2(current_position, Vector2(size * sign(target.x), y_size))
		draw_rect(rect, color)
		current_position.x += size * sign(target.x)
		current_position.y += y_size

	
	
func draw_laser(target: Vector2, size: int, color: Color):
	if abs(target.x) == 0 or abs(target.y) == 0:
		print("um deles é 0")
		draw_line(Vector2(), target, color, size)
	elif abs(target.x) > abs(target.y):
		draw_horizontal_laser(target, size, color)
	else:
		draw_vertical_laser(target, size, color)
	
func _draw():
	draw_laser(get_local_mouse_position(), size, color)
	
func _process(delta):
	update()
