extends Node2D

var brush = true

#byte Character[] = {
#	b00000,
#	b00000,
#	b00000,
#	b00000,
#	b00000,
#	b00000,
#	b00000,
#	b00000
#}

@onready var text = $TextEdit

func _process(delta):
	text.text = get_string()
	if Input.is_action_just_pressed("ui_copy"):
		DisplayServer.clipboard_set(get_string())

func get_string():
	var string = "byte Character[] = {\n"
	var bits = get_tree().get_nodes_in_group("bit")
	
	for y in 8:
		string += "b"
		for x in 5:
			string += str(int(bits[x + (y * 5)].state))
		if y != 7:
			string += ",\n"
	string += "\n}"
	
	return string
