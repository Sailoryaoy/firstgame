extends Node2D
var pre_tiro = preload("res://scenes/tiro.tscn")

var vel = 200 # determina a velocidade da nave
var intervalo = .3
var ultimo_disparo = 0

func _ready():  # começo do codigo
	set_process_input(true) 
	pass

func _process(delta): # função principal do movimento
	# variaveis do movimento
	var d = 0 
	var e = 0
	
	if Input.is_action_pressed("direita"): #função que altera o movinto
		d = 1
	
	if Input.is_action_pressed("esquerda"):
		e = -1
	if get_position().x > (640 - 50):
		d = 0
		
	if get_position().x < 50:
		
		e = 0
		
	set_position(get_position() + Vector2(1, 0) * vel* delta * (d + e)) #equação que determina o movimento
	#vel nessa instacia vira um escalar, que pode ser alterado para mudar o sentido de viagem do objeto
	# disparo
	if Input.is_action_pressed("tiro"):
		if ultimo_disparo <= 0:
			var tiro = pre_tiro.instance()#variavel que representa o tiro

			tiro.set_global_position(get_node("PositionCE").get_global_position())#linka a posição do tiro à do node PositionCE
			get_node("../").add_child(tiro)#vai buscar a main node para carregar os assets
			ultimo_disparo = intervalo # altera o valor do ultimi dis paro pra evitar que ele dispare sem parar
			
			
			tiro = pre_tiro.instance()#nessa parte n necessecita recolocar o var tiro, pois ela ja foi carregada ateriormente
			tiro.set_global_position(get_node("PositionCD").get_global_position())#linka a posição do tiro à do node PositionCD
			get_node("../").add_child(tiro)
			ultimo_disparo = intervalo 
			
		pass
		
	if ultimo_disparo > 0:
		ultimo_disparo -= delta# ultimo disparo vira menor que 0, tira o tempo do ultimo disparo
	pass
