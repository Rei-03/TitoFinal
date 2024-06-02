extends CanvasLayer
			#0     #1      #2       #3     #4    #5    #6       #7
@export var Imagen: TextureRect
@export var Anim: AnimationPlayer

enum NPCS {Tito, Nitrato, Azufre, Carbon, Mia, Baron, Maton1, Maton2} 

const Imagenes : Array = [
	'Tito',
	'Nitrato',
	'Azufre',
	'Carbon', 
	'Mia',
	'Baron',
	'Maton1',
	'Maton2'
]
	
const IMAGENES : Dictionary = {
	'Tito'    :   preload ("res://assets/Tito/cabeza.PNG"),
	'Nitrato' :   preload ("res://icon.svg"),
	'Azufre'  :   preload ("res://icon.svg"),
	'Carbon'  :   preload ("res://icon.svg"),
	'Mia'     :   preload ("res://icon.svg"),
	'Baron'   :   preload ("res://icon.svg"),
	'Maton1'  :   preload ("res://icon.svg"),
	'Maton2'  :   preload ("res://icon.svg"),
}

	#'Tito : Un paso mas cerca. Este salitre es crucial, pero no puedo dejar que caiga en manos equivocadas.',#0
	#'Tito : Solo un poco de alquimia. La verdadera formula esta segura... y el espectaculo acaba de comenzar.'#6
	#'Mia : Asi que esto es donde planeas tus fechorias, Baron. Es hora de cambiar un poco tus planes.',#4

#--------------------------------------------------------
const EscenaMia : Array = [
	'Tito : Necesito carbon, pero no el tipo que piensas. ¿Puedes ayudarme a encontrar algo que haga chispas pero no explote?.',#0
	'Mia : Por supuesto, !vamos a iluminar el cielo, no a quemarlo!'#1
]
const secuenciaNPCEscena1 : Array = [0,4]

#---------------------------------------------------------
const EscenaMaton1 : Array = [
	'Maton1 : ¿Que crees que estas haciendo, chico?',#0
	'Tito : Solo estoy asegurandome de que la fiesta de esta noche sea inolvidable.',#1
]
const secuenciaNPCEscena2 : Array = [0,6]

#---------------------------------------------------------
const EscenaMaton2 : Array = [
	'Maton2 : El Baron no estara contento con esto.',#0
	'Tito : Entonces sera mejor que no le digan.',#1
]
const secuenciaNPCEscena3 : Array = [0,7]

#------------------------------------------------------
const EscenaBaron : Array = [
	'Baron : !Al fin! !La formula es mia!.',#0
	'Tito : Disfruta tu victoria, pero recuerda, no todo es lo que parece.',#1
	'Baron : !¿Que has hecho?!',#2
]
const secuenciaNPCEscena4 : Array = [0,5]

#-------------------------------------------------
var chats : int = 0
 
var npc : int

#Funcion mas importante
func poner_TEXTO (TEXTO:String, NPC:int, IMAGEN:Texture) -> void:
	show()
	get_tree().paused = true
	$TEXTO.text = TEXTO
	npc = NPC
	Imagen.texture = IMAGEN
	Anim.play("SET_TEXTO")


#Funcion de Mia
func _on_mia_body_entered(body):
	if body.is_in_group('PERSONAJES'):
		poner_TEXTO(EscenaMia[chats],NPCS.Mia,IMAGENES[Imagenes[secuenciaNPCEscena1[chats]]])
		chats +=1



#Funcion de Maton1
func _on_maton_1_body_entered(body):
	if body.is_in_group('PERSONAJES'):
		poner_TEXTO(EscenaMaton1[chats],NPCS.Maton1,IMAGENES[Imagenes[secuenciaNPCEscena2[chats]]])
		chats +=1



#Funcion de Maton2
func _on_maton_2_body_entered(body):
	if body.is_in_group('PERSONAJES'):
		poner_TEXTO(EscenaMaton2[chats],NPCS.Maton2,IMAGENES[Imagenes[secuenciaNPCEscena3[chats]]])
		chats +=1


# falta el baron 
func _on_baron_body_entered(body):
	if body.is_in_group('PERSONAJES'):
		poner_TEXTO(EscenaBaron[chats],NPCS.Baron,IMAGENES[[secuenciaNPCEscena4[chats]]])
		chats +=1

func _on_boton_pressed():
	match npc: 
		
		NPCS.Mia:
			if chats < EscenaMia.size():
				poner_TEXTO(EscenaMia[chats],NPCS.Mia,IMAGENES[Imagenes[secuenciaNPCEscena1[chats  % 2]]])
				chats +=1
			else:
				#Conversacion acabo
				chats = 0
				hide()
				get_tree().paused = false
		NPCS.Maton1:
			if chats < EscenaMaton1.size():
				poner_TEXTO(EscenaMaton1[chats],NPCS.Maton1,IMAGENES[Imagenes[secuenciaNPCEscena2[chats % 2]]])
				chats +=1
			else:
				#Conversacion acabo
				chats = 0
				hide()
				get_tree().paused = false
		NPCS.Maton2:
			if chats < EscenaMaton2.size():
				poner_TEXTO(EscenaMaton2[chats],NPCS.Maton2,IMAGENES[Imagenes[secuenciaNPCEscena3[chats  % 2]]])
				chats +=1
			else:
				#Conversacion acabo
				chats = 0
				hide()
				get_tree().paused = false
		NPCS.Baron:
			if chats < EscenaBaron.size():
				poner_TEXTO(EscenaBaron[chats],NPCS.Baron,IMAGENES[Imagenes[secuenciaNPCEscena4[chats  % 2]]])
				chats +=1
			else:
				#Conversacion acabo
				chats = 0
				hide()
				get_tree().paused = false








