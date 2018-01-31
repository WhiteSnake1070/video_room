#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
#include <ComboConstants.au3>
#include "Funcs.au3"
#include "archivos.au3"
#include <ScreenCapture.au3>

#Region ### En esta región se establece el Skin del Form
;----> Only the lines to skin your program...
#include "_UskinLibrary.au3"
;--
_Uskin_LoadDLL()
_USkin_Init(@ScriptDir & "\Plug-in\Cosmo.msstyles"); <-- Put here your skin...
;--
; If you use skin embedded...
;_Uskin_LoadDLL()
;#include ".\Skins\Pacifica.au3"
;_USkin_Init(_Pacifica(True))
;<----
#EndRegion

_verificarArchivos()

If _Singleton("Fotogramas BH", 1) = 0 Then
MsgBox(16,"","")
 Exit
EndIf

$version="5.5"

#Region ### START Koda GUI section ### Form=C:\Users\juanf\OneDrive\Programacion\WhiteSnake\koda_1.7.3.0\Forms\Form1.kxf
$Form1 = GUICreate("Fotogramas Black Horse", 615, 260, 100, 40)
GUISetIcon("bh2.ico", -1)


;=============== GRUPO INGRESAR LA CANTIDAD DE IMAGENES A TRABAJAR ====================
$Group1 = GUICtrlCreateGroup("Imágenes", 8, 8, 400, 73)
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Ingrese la cantidad de imágenes o textos a trabajar:", 16, 40, 306, 20)
GUICtrlSetColor(-1, 0xFFFFFF)
$cantidad = GUICtrlCreateInput("", 328, 40, 49, 24)
GUICtrlCreateGroup("", -99, -99, 1, 1)


;=============== GRUPO RADIO BUTTONS OPCIONES ====================
$Opciones = GUICtrlCreateGroup("Opciones", 416, 8, 185, 233)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$iTopp = GUICtrlCreateRadio("Imágenes a P. Point", 424, 40, 145, 17)
;~ GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetColor(-1, 0xFFFFFF)
$iToword = GUICtrlCreateRadio("Imágenes a Word", 424, 72, 145, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
$textos = GUICtrlCreateRadio("Textos", 424, 104, 113, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
$btnempezar = GUICtrlCreateButton("Inicio", 432, 200, 75, 25)
GUICtrlSetTip(-1,"Iniciar Proceso")
GUICtrlSetCursor ($btnempezar, 0)
$salir = GUICtrlCreateButton("Salir", 512, 200, 75, 25)
GUICtrlSetTip(-1,"Salir de la aplicación")
GUICtrlSetCursor ($salir, 0)


;=============== GRUPO OPCIONES DE INGRESAR TEXTOS ====================
$Group2 = GUICtrlCreateGroup("Datos", 8, 96, 400, 145)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("Inicio conteo:", 16, 120, 96, 20)
GUICtrlSetColor(-1, 0xFFFFFF)
$Label3 = GUICtrlCreateLabel("Fecha camaras:", 16, 160, 115, 20)
GUICtrlSetColor(-1, 0xFFFFFF)
$Label4 = GUICtrlCreateLabel("Cámara:", 16, 200, 62, 20)
GUICtrlSetColor(-1, 0xFFFFFF)
$inicio = GUICtrlCreateInput("", 152, 120, 121, 24)
GUICtrlSetState(-1, $GUI_DISABLE)
$fecha = GUICtrlCreateInput("", 152, 160, 121, 24)
GUICtrlSetState(-1, $GUI_DISABLE)
$camara = GUICtrlCreateInput("", 152, 200, 121, 24)
GUICtrlSetState(-1, $GUI_DISABLE)


;=============== GRUPO RADIO BUTTONS PAR O IMPAR ====================
$Group3 = GUICtrlCreateGroup("Par o Impar", 424, 128, 169, 65)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$rbPar = GUICtrlCreateRadio("Par", 432, 152, 113, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetState(-1, $GUI_DISABLE)
$rbImpar = GUICtrlCreateRadio("Impar", 432, 168, 113, 17)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetState(-1, $GUI_DISABLE)


;====== IMAGEN ===================
$Pic1 = GUICtrlCreatePic("fondo.jpg", 280, 120, 120, 108)
GUICtrlSetTip(-1,"Black Horse Software")
GUICtrlSetCursor ($Pic1, 7)


;====== VARIABLES DEL LECTURA ==========
Local $leerCantidad=""
Local $leerMusica=""
Local $leerConteo=""
Local $leerFecha=""
Local $leerCamara=""
Local $sError=""
Local $sContador=0
Local $mensaje=""
Local $pausa=""
Local $pregunta=""
Local $contador=0


;===== ABRIR DOCUMENTOS =================
$btnOpenPp = GUICtrlCreateButton("P", 530, 0, 25, 20)
GUICtrlSetTip(-1,"Abrir archivo de Power Point, Plantilla")
$btnOpenWord = GUICtrlCreateButton("W", 555, 0, 25, 20)
GUICtrlSetTip(-1,"Abrir archivo de Word, Plantilla")


;===== AYUDA ============================
$btnayuda = GUICtrlCreateButton("?", 580, 0, 25, 20)
GUICtrlSetTip(-1,"Ayuda")
$ayuda=""


;===== HotKeys ==========================
HotKeySet("{F1}","Ayuda")
HotKeySet("{f9}","_salidaemergencia")
HotKeySet("{f8}","_pausar")


;==== MUSICA ============================
$cuadroMusica=GUICtrlCreateCheckbox(" ",8,241)
GUICtrlSetState(-1, $GUI_CHECKED)
$Label7 = GUICtrlCreateLabel("Música",30,245)
GUICtrlSetColor(-1, 0xFFFFFF)
_escogercancion()


;==== PANTALLAZO ========================
$btnPantallazo = GUICtrlCreateButton("Pantallazo", 460, 241, 100, 20)
GUICtrlSetTip(-1,"Tomar Pantallazo, se guarda en mis documentos")
$LabelConteo=GUICtrlCreateLabel("0",565,244)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetTip($LabelConteo,"Conteo previo para tomar pantallazo")


;==== ComboBox ==========================
;~ $combo=GUICtrlCreateCombo("", 100, 240, 200, 10, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
;~ GUICtrlSetData(-1, "hOLA|GAGA|GAGA|AGAGSD|WEGFADF|QHSDWVW|WEGFDV|WEGSDVDWAQ|QEGADVQ|QGADV")


GUISetState(@SW_SHOW, $Form1)
#EndRegion ### END Koda GUI section ### Form=C:\Users\juanf\OneDrive\Programacion\WhiteSnake\koda_1.7.3.0\Forms\Form1.kxf


While 1

	$nMsg = GUIGetMsg()
	Switch $nMsg

	Case $btnempezar;======== CONTROL DE INICIO DE PREOCESO ============
		 $leerCantidad = GUICtrlRead($cantidad);========================== Cantidad de imagenes a trabajar
		 $leerConteo = GUICtrlRead($inicio);============================== Conteo $i para la escritura
		 $leerFecha = GUICtrlRead($fecha);================================ Fecha de los hechos
		 $leerCamara = GUICtrlRead($camara);============================== Camara grabacion
		 $leerMusica = GUICtrlRead($cuadroMusica);======================== Lectura de cuadro música

		 ;======== INICIO DE VERIFICACION QUE LOS CAMPOS ESTEN LLENOS ===================================
		 $sError = ""
		 _verificacion()
		 ;======== FIN DE VERIFICACION QUE LOS CAMPOS ESTEN LLENOS ======================================

		 If $sError = "" Then

			; INICIO DEL PRIMER MODULO, ENVIAR LAS IMAGENES DE LA CARPETA AL POWER POINT =========================================================================
			If GUICtrlRead($iTopp) = 1 Then
			   For $i=1 To $leerCantidad Step +1
				  _imagenesapowerpoint()
			   Next
			   _fin()

			 ; INICIO DEL SEGUNDO MODULO, ENVIAR LAS IMAGENES DEL POWER POINT AL WORD ======================================================================
			ElseIf GUICtrlRead($iToword) = 1 Then
			 ;Si es impar la seleccion del radio button hacer un paso mas
			   If GUICtrlRead($rbImpar)=1 Then
				  _imparAWord()
			   Else
			   EndIf

			   For $i=1 To ($leerCantidad/2) Step +1
				  _parAWord()
			   Next
			   _fin()

			 ; INICIO DEL TERCER MODULO, ESCRIBIR LOS TEXTOS EN EL WORD PARA AHORRAR TIEMPO =====================================================================================
			ElseIf GUICtrlRead($textos) = 1 Then

			   ;Si es impar la seleccion del radio button hacer un paso mas
			   If GUICtrlRead($rbImpar)=1 Then
				  _textoImpar()
			   Else
			   EndIf
			   WinActivate("[CLASS:OpusApp]","")
			   Sleep(500)
			   For $i=1 To ($leerCantidad/2) Step +1
				  _textoPar()
			   Next
			   GUICtrlSetData($inicio,$leerconteo)
			Else
			EndIf
			$sContador=0
		 Else
			MsgBox(16,"Error",$sError,99,$Form1)
		 EndIf

	Case $iToword;======== CONTROL DE R.BOTONES ============
	   _radioAWord()

	Case $iTopp;======== CONTROL DE R.BOTONES ============
	   _radioAPp()

	Case $textos;======== CONTROL DE R.BOTONES ============
	   _radioTextos()
	   ;======== FIN CONTROL DE R.BOTONES ========

	Case $btnayuda
		 _help()

	Case $btnOpenWord
	   _abrirArchivoWord()

    Case $btnOpenPp
	   _abrirArchivoPp()

	Case $cuadroMusica
	   If _IsChecked($cuadroMusica) Then
		  _escogercancion()
	   Else
		   SoundPlay("")
		EndIf

	 Case $btnPantallazo
		_Conteo()
		pantallazo()

    Case $GUI_EVENT_CLOSE,$salir
		 _pregunta()

	EndSwitch

WEnd


