extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed = OS.get_borderless_window()
	pass # Replace with function body.


func _on_TextureButton_toggled(button_pressed):
	#Globals.set('display/window/size/borderless')
	OS.set_borderless_window(button_pressed)
	pass # Replace with function body.
