extends Estado

@export var estado_caminando: Estado
@export var estado_cayendo: Estado

func update_fisica(delta):
	super(delta)
	if eje_x != 0:
		maquina_de_estados.cambiar_estado(estado_caminando)
	if not jugador.is_on_floor():
		maquina_de_estados.cambiar_estado(estado_cayendo)

func entrar():
	super()
	jugador.velocity.x = 0
