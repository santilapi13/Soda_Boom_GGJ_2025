extends Node

@export var maximo_reproductores : int = 10
var rutas_sfx : Dictionary = {
	"Recoger": "res://Resources/SFX/Recoger.mp3",
	"Victoria": "res://Resources/SFX/Victoria.mp3",
	"Soda": "res://Resources/SFX/SoderoSifon.wav",
	"sifon_palmerasA": "res://Resources/SFX/CHORRO 1 SODA.wav",
	"sifon_palmerasB": "res://Resources/SFX/CHORRO 2 SODA.wav",
	"Fallo": "res://Resources/SFX/Fallo.mp3",
	"sifonazo": "res://Resources/SFX/chorrito soda.wav",
	"Explosion": "res://Resources/SFX/Explosion.wav",
	"Champagne": "res://Resources/SFX/explosion champagne.wav"
}
var rutas_musica : Dictionary = {
	"loop_juego": "res://Resources/Music/LOOP GAME.wav",
	"loop_menu": "res://Resources/Music/LOOP SALVATION.wav"
	# TODO: Poner pares "nombrePista": "rutaPista"
}
var pistas_sfx : Dictionary = {}
var pistas_musica : Dictionary = {}
@onready var reproductor_musica : AudioStreamPlayer2D = $ReproductorMusica
var reproductores : Array = []

func _ready():
	var nodo_reproductores : Node = $ReproductoresSFX
	for i in range(maximo_reproductores):
		var reproductor = AudioStreamPlayer2D.new()
		nodo_reproductores.add_child(reproductor)
		reproductores.append(reproductor)

	for ruta in rutas_musica:
		pistas_musica[ruta] = load(rutas_musica[ruta])
		
	for ruta in rutas_sfx:
		pistas_sfx[ruta] = load(rutas_sfx[ruta])
		
	reproducir_musica("loop_menu")

func reproducir_musica(pista: String):
	reproductor_musica.stream = pistas_musica[pista]
	reproductor_musica.play()

func parar_musica():
	reproductor_musica.stop()
	
func reproducir_sonido(sfx: String, posicion: Vector2 = Vector2.ZERO):
	for reproductor in reproductores:
		if not reproductor.playing:
			reproductor.stream = pistas_sfx[sfx]
			reproductor.global_position = posicion
			reproductor.play()
			return
			
func parar_todos():
	reproductor_musica.stop()
	for reproductor in reproductores:
		reproductor.stop()
