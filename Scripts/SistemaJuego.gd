extends Control

var niveles : Array[String] = [
	"res://Scenes/Levels/nivel_1.tscn"
]
var nivel_actual : int = -1
@onready var anim : AnimationPlayer = $Transicion

func cargar_escena(escena: String):
	anim.play('mostrar')
	await anim.animation_finished
	
	get_tree().change_scene_to_file(escena)
	
	anim.play_backwards('mostrar')
	await anim.animation_finished

func comenzar_juego():
	nivel_actual = 0
	cargar_escena(niveles[0])
	SistemaAudio.reproducir_musica("loop_juego")

func siguiente_nivel():
	if nivel_actual < niveles.size() - 1:
		nivel_actual += 1
		cargar_escena(niveles[nivel_actual])
	else:
		# TODO: Pantalla de juego finalizado
		reiniciar_nivel()
		print("GANASTE")

func reiniciar_nivel():
	cargar_escena(niveles[nivel_actual])

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()
		elif event.keycode == KEY_R:
			reiniciar_nivel()
		
	
