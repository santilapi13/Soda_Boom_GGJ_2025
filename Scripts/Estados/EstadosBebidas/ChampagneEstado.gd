extends EstadoBebida

@export var fuerza_de_salto = 100.0

@export var estado_cayendo: Estado

func activarse():
	super()

func entrar():
	var eje_x =  sign(Input.get_axis("left","rigth"))
	var eje_y =  sign(Input.get_axis("up","down"))
	SistemaAudio.reproducir_sonido("Champagne")
	print(Vector2(eje_x,eje_y).normalized())
	if eje_x == 0 and eje_y == 0:
		eje_x = 1
	jugador.velocity = Vector2(eje_x,eje_y).normalized() * fuerza_de_salto
	
	

	
func update_fisica(delta):
	maquina_de_estados.cambiar_estado(estado_cayendo)
