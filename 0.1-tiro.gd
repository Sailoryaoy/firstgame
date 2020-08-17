extends Node2D
var vel = 500 #velocidade na qual o tiro viaja


func _ready():
	set_process(true) #sem a parte do imput pq ele n rquer que o player aperte nada ate agora
	
	
	pass 
func _process(delta): 
	set_position (get_position() + Vector2 (0, -1) * vel * delta)
	#set_pos fefine a equação e vctor 2 (0, -1)  determina a direção na aqul o tiro viaja

	if get_position().y < -30 :
		print ("menos um tiro")	
		free()

	
		#faz o tiro sumir		pass 
	pass
pass
