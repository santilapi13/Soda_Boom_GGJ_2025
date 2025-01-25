extends Estado

@export var estado_quieto: Estado
@export var estado_cayendo: Estado

@export var velocidad_maxima: float = 300.0
@export var aceleracion: float = 600.0
@export var friccion: float = 1200.0

func update_fisica(delta):
	super(delta)
	if eje_x != 0 and eje_x == sign(jugador.velocity.x):
		jugador.velocity.x = lerp(jugador.velocity.x, velocidad_maxima * eje_x, aceleracion * delta)
	elif eje_x != 0:
		jugador.velocity.x = lerp(jugador.velocity.x, friccion * eje_x, aceleracion * delta)
	elif abs(jugador.velocity.x) < 50:
		maquina_de_estados.cambiar_estado(estado_quieto)
	else:
		jugador.velocity.x =lerp(jugador.velocity.x, 0.0, friccion * delta)
		
	if not jugador.is_on_floor():
		maquina_de_estados.cambiar_estado(estado_cayendo)
