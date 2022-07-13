extends Node


var size = 1

func chance_size(value):
	if size + value == 0:
		size = 1
	else:
		size += value
		
	$PixelLaser.size = size
	$Label.text = str(size)
	
	
func _on_Button_add_1_pressed():
	chance_size(1)

func _on_Button_sub_1_pressed():
	chance_size(-1)
