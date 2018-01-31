Local $k=0
Local $hojas=0
#Region ### Aqui comienza la region de funciones ###

Func _fin()
   MsgBox(16,"Traspaso","Finalizó el proceso de pegado, malditos perezosos")
EndFunc


Func _help()
   $ayuda&="Versión: "&$version&@CRLF
   $ayuda&="Botón Emergencia: F9"&@CRLF
   $ayuda&="Botón Pausa: F8"&@CRLF
   $ayuda&="Software ®: Black Horse"&@CRLF
   $ayuda&="Soporte: +57 3187826104"&@CRLF
   MsgBox(16,"Help",$ayuda)
   $ayuda=""
EndFunc


Func Ayuda()
	  _help()
EndFunc


Func _pistola()
   $mensaje&="                              /´ /)		"&@CRLF
   $mensaje&="                          , /¯   /		"&@CRLF
   $mensaje&="                          /     /		"&@CRLF
   $mensaje&="                       ,/¯   /		"&@CRLF
   $mensaje&="                      /     /		"&@CRLF
   $mensaje&="               /´¯/'    '/´¯`•¸		"&@CRLF
   $mensaje&="             /'/   /     /        /¨¯\		"&@CRLF
   $mensaje&="            ('(   ´(            ,~/'   ')		"&@CRLF
   $mensaje&="              \                   \/    /		"&@CRLF
   $mensaje&="                \''               _ •´		"&@CRLF
   $mensaje&="                  \              		"&@CRLF
   $mensaje&="                    \             		"&@CRLF
   $mensaje&="                  		"&@CRLF
   $mensaje&="               AQUÍ TIENE POR IRSE "&@CRLF
   GUICtrlSetColor(-1, 0xFFFFFF)
   MsgBox(64,"Black Horse",$mensaje,99,$Form1)
   $mensaje=""
EndFunc


Func _salidaemergencia()
   Local $parte1= Run("Fotogramas BH.exe")
   Exit
EndFunc


Func _pausar()
   $pausa&="Programa en pausa"&@CRLF
   $pausa&="Click en aceptar para continuar"&@CRLF
   $pausa&="Precaución, debe estar en el mismo lugar en el que pauso"&@CRLF
   MsgBox(16,"Pausa",$pausa,99,$Form1)
   $pausa=""
EndFunc


Func _pregunta()
   $pregunta=MsgBox(4,"Black Horse","Esta seguro que desea salir?                                   ")
   If($pregunta=6)Then
	  _pistola()
   Exit
   Else
   EndIf
EndFunc

Func _imagenesapowerpoint()
   WinActivate("[CLASS:CabinetWClass]","")
   Send("{ctrldown}c{ctrlup}")
   WinActivate("[CLASS:PPTFrameClass]","")
   Send("{ctrldown}v{ctrlup}")
   Send("{esc}")
   Send("{esc}")
   Send("{esc}")
   Sleep(500)
   Send("{down}")
   WinActivate("[CLASS:CabinetWClass]","")
   Send("{down}")
EndFunc

Func _imparAWord()
   WinActivate("[CLASS:PPTFrameClass]","")
   Sleep(200)
   Send("{ctrldown}c{ctrlup}")
   Sleep(200)
   WinActivate("[CLASS:OpusApp]","")
   Sleep(200)
   Send("{ctrldown}v{ctrlup}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   WinActivate("[CLASS:PPTFrameClass]","")
   Sleep(200)
   Send("{down}")
EndFunc

Func _parAWord()
   WinActivate("[CLASS:PPTFrameClass]","")
   Sleep(200)
   Send("{ctrldown}c{ctrlup}")
   Sleep(200)
   WinActivate("[CLASS:OpusApp]","")
   Sleep(200)
   Send("{ctrldown}v{ctrlup}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   WinActivate("[CLASS:PPTFrameClass]","")
   Sleep(200)
   Send("{down}")
   Sleep(200)
   Send("{ctrldown}c{ctrlup}")
   Sleep(200)
   WinActivate("[CLASS:OpusApp]","")
   Sleep(200)
   Send("{ctrldown}v{ctrlup}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   WinActivate("[CLASS:PPTFrameClass]","")
   Sleep(200)
   Send("{down}")
EndFunc

Func _textoImpar()
   WinActivate("[CLASS:OpusApp]","")
   Sleep(500)
   Send("IMAGEN No. ")
   Send($leerConteo)
   $leerConteo=$leerConteo+1
   Send(" Descripción: Siendo las :: horas, del día ")
   Send($leerfecha)
   Send(", En la imagen extraída del video, cámara ")
   Send($leercamara)
   Send(", se aprecia el inicio del video.")
   Sleep(400)
   Send("{ctrldown}j")
   Send("{ctrlup}")
   Sleep(400)
   Send("{tab}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   Send("{tab}")
   Sleep(200)
   $sContador=1
EndFunc

Func _textoPar()
   Send("IMAGEN No. ")
   Send($leerConteo)
   $leerConteo=$leerConteo+1
   Send(" Descripción: Siendo las :: horas, del día ")
   Send($leerfecha)
   Send(", En la imagen extraída del video, cámara ")
   Send($leercamara)
   ;***********************************************************		INICIO	1
   If($i=1)Then
	  ;***********************************************************	INICIO	2
	  If ($sContador=0) Then
		 Send(", se aprecia el inicio del video.")
		 Sleep(400)
		 Send("{ctrldown}j")
		 Send("{ctrlup}")
		 Sleep(400)

	  Else

		 Send(", se aprecia .")
		 Sleep(400)
		 Send("{ctrldown}j")
		 Send("{ctrlup}")
	  EndIf
	  ;***********************************************************	FIN		2
   Else
	  Send(", se aprecia .")
	  Sleep(400)
	  Send("{ctrldown}j")
	  Send("{ctrlup}")
	  Sleep(400)
   EndIf
   ;***********************************************************		FIN		1
   Send("{tab}")
   Sleep(100)
   Send("IMAGEN No. ")
   Send($leerConteo)
   $leerConteo=$leerConteo+1
   Send(" Descripción: Siendo las :: horas, del día ")
   Send($leerfecha)
   Send(", En la imagen extraída del video, cámara ")
   Send($leercamara)
   ;***********************************************************		INICIO
   If ($i=($leerCantidad/2))Then
	  Send(", se aprecia el final del video.")
   Else
	  Send(", se aprecia .")
	  Sleep(400)
	  Send("{ctrldown}j")
	  Send("{ctrlup}")
	  Sleep(400)
   EndIf
   ;***********************************************************		FIN
   Send("{tab}")
   Sleep(100)
   Send("{tab}")
   Sleep(100)
   Send("{tab}")
   Sleep(100)
EndFunc

Func _radioAWord()
   GUICtrlSetState($fecha, $GUI_DISABLE)
   GUICtrlSetState($camara, $GUI_DISABLE)
   GUICtrlSetState($inicio, $GUI_DISABLE)
   GUICtrlSetState($rbpar, $GUI_ENABLE)
   GUICtrlSetState($rbimpar, $GUI_ENABLE)
   GUICtrlSetState($rbpar, $GUI_CHECKED)
EndFunc

Func _radioAPp()
   GUICtrlSetState($fecha, $GUI_DISABLE)
   GUICtrlSetState($camara, $GUI_DISABLE)
   GUICtrlSetState($inicio, $GUI_DISABLE)
   GUICtrlSetState($rbpar, $GUI_DISABLE)
   GUICtrlSetState($rbimpar, $GUI_DISABLE)
EndFunc

Func _radioTextos()
   GUICtrlSetState($fecha, $GUI_ENABLE)
   GUICtrlSetState($camara, $GUI_ENABLE)
   GUICtrlSetState($inicio, $GUI_ENABLE)
   GUICtrlSetState($rbpar, $GUI_ENABLE)
   GUICtrlSetState($rbimpar, $GUI_ENABLE)
   GUICtrlSetState($rbpar, $GUI_CHECKED)
EndFunc

Func _verificacion()
   If $leerCantidad = "" Then $sError &= "El campo cantidad de imagenes esta vacío"&@CRLF
	  If GUICtrlRead($textos) = 1 Then
	  If $leerConteo = "" Then $sError &= "El campo conteo esta vacío"&@CRLF
	  If $leerFecha = "" Then $sError &= "El campo fecha de camaras esta vacío"&@CRLF
	  If $leerCamara = "" Then $sError &= "El campo camara esta vacío"&@CRLF
   Else
   EndIf
EndFunc

Func _abrirArchivoPp()
   $hojas=InputBox("Power Point","Cuantas hojas desea?","0")
   If $hojas="" Then

   Else

	  Run("explorer.exe " & "Plantilla.pptx")
	  WinWait("Plantilla")
	  WinActivate("Plantilla")

	  For $k=1 To $hojas Step +1
		 Send("{alt}")
		 Sleep(200)
		 Send("b")
		 Sleep(200)
		 Send("d")
		 Send("{down 2}")
		 Send("{enter}")
	  Next
   EndIf
EndFunc

Func _abrirArchivoWord()
   Run("explorer.exe " & "Plantilla Fotogramas.docx")
   WinWait("Plantilla Fotogramas")
   WinActivate("Plantilla Fotogramas")
EndFunc

Func _IsChecked($idControlID)
    Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
 EndFunc   ;==>_IsChecked


 Func _escogercancion()
	  Local $random = Random(1,5,1)
	  Local $ruta = "Plug-in/"&$random&".mp3"
	  SoundPlay($ruta)
   EndFunc


Func pantallazo()
;~    Sleep(3000)
   _ScreenCapture_Capture(@MyDocumentsDir & "\Imagen "&$contador&".jpg")
   $contador=$contador+1
   MsgBox(64,"Info","Listo",1)
EndFunc


Func _Conteo()
   Local $c=0
   For $c=3 To 0 Step -1
	  Sleep(1000)
	  GUICtrlSetData($LabelConteo,$c)
   Next
EndFunc


#EndRegion ### Aqui finaliza la region de funciones ###