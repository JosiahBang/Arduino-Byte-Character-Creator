extends Node2D

@export var off_color : Color
@export var on_color : Color

@onready var panel = $Panel
@onready var mesh = $MeshInstance2D
@onready var main = get_parent()

var state = false
var mouse_in = false
var mouse_down = false

func _on_mouse_entered():
	mouse_in = true

func _on_mouse_exited():
	mouse_in = false

func _ready():
	update()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if not mouse_down and mouse_in:
				state = !state
				main.brush = state
			mouse_down = true
		if event.is_released():
			mouse_down = false
	if event is InputEventMouseMotion:
		if mouse_down and mouse_in:
			state = main.brush
	update()

func update():
	if state:
		mesh.modulate = on_color
	else:
		mesh.modulate = off_color
