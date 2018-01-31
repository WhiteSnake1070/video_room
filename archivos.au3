Func _verificarArchivos()
   Local $verificador=""
If FileExists("AE.mp4")=0 Then $verificador&="Falta Archivo AE.mp4"&@CRLF
If FileExists("wmplayer.au3")=0 Then $verificador&="Falta Archivo wmplayer.au3"&@CRLF
If FileExists("Funcs.au3")=0 Then $verificador&="Falta Archivo Funcs.au3"&@CRLF
If FileExists("Plantilla.pptx")=0 Then $verificador&="Falta Archivo Plantilla Power Point"&@CRLF
If FileExists("Plantilla Fotogramas.docx")=0 Then $verificador&="Falta Archivo Plantilla Fotogramas"&@CRLF
If FileExists("Skins_Ex.au3")=0 Then $verificador&="Falta Archivo Skins_Ex.au3"&@CRLF
If FileExists("_USkinDLL.au3")=0 Then $verificador&="Falta Archivo _USkinDLL.au3"&@CRLF
If FileExists("_UskinLibrary.au3")=0 Then $verificador&="Falta Archivo _UskinLibrary.au3"&@CRLF
If FileExists("bh.ico")=0 Then $verificador&="Falta Archivo bh.ico"&@CRLF
If FileExists("fondo.jpg")=0 Then $verificador&="Falta Archivo fondo.jpg"&@CRLF
If FileExists("Plug-in/Cosmo.au3")=0 Then $verificador&="Falta Archivo Cosmo.au3"&@CRLF
If FileExists("Plug-in/Cosmo.msstyles")=0 Then $verificador&="Falta Archivo Cosmo.msstyles"&@CRLF
If FileExists("Plug-in/1.mp3")=0 Then $verificador&="Falta Archivo 1"&@CRLF
If FileExists("Plug-in/2.mp3")=0 Then $verificador&="Falta Archivo 2"&@CRLF
If FileExists("Plug-in/3.mp3")=0 Then $verificador&="Falta Archivo 3"&@CRLF
If FileExists("Plug-in/4.mp3")=0 Then $verificador&="Falta Archivo 4"&@CRLF
If FileExists("Plug-in/5.mp3")=0 Then $verificador&="Falta Archivo 5"&@CRLF
;===================================================================================================

If $verificador="" Then

Else
   $verificador&=" "&@CRLF
   $verificador&="**************************"&@CRLF
   $verificador&=" "&@CRLF
   $verificador&="Contacte a soporte técnico"&@CRLF
   MsgBox(16,"Error",$verificador)
   Exit
EndIf
EndFunc

Func _verificarArchivos2()
   Local $verificador=""
If FileExists("AE.mp4")=0 Then $verificador&="Falta Archivo AE.mp4"&@CRLF
If FileExists("wmplayer.au3")=0 Then $verificador&="Falta Archivo wmplayer.au3"&@CRLF
If FileExists("Funcs.au3")=0 Then $verificador&="Falta Archivo Funcs.au3"&@CRLF
If FileExists("Plantilla.pptx")=0 Then $verificador&="Falta Archivo Plantilla Power Point"&@CRLF
If FileExists("Plantilla Fotogramas.docx")=0 Then $verificador&="Falta Archivo Plantilla Fotogramas"&@CRLF
If FileExists("Skins_Ex.au3")=0 Then $verificador&="Falta Archivo Skins_Ex.au3"&@CRLF
If FileExists("_USkinDLL.au3")=0 Then $verificador&="Falta Archivo _USkinDLL.au3"&@CRLF
If FileExists("_UskinLibrary.au3")=0 Then $verificador&="Falta Archivo _UskinLibrary.au3"&@CRLF
If FileExists("bh.ico")=0 Then $verificador&="Falta Archivo bh.ico"&@CRLF
If FileExists("fondo.jpg")=0 Then $verificador&="Falta Archivo fondo.jpg"&@CRLF
If FileExists("Plug-in/Cosmo.au3")=0 Then $verificador&="Falta Archivo Cosmo.au3"&@CRLF
If FileExists("Plug-in/Cosmo.msstyles")=0 Then $verificador&="Falta Archivo Cosmo.msstyles"&@CRLF
If FileExists("Plug-in/1.mp3")=0 Then $verificador&="Falta Archivo 1"&@CRLF
If FileExists("Plug-in/2.mp3")=0 Then $verificador&="Falta Archivo 2"&@CRLF
If FileExists("Plug-in/3.mp3")=0 Then $verificador&="Falta Archivo 3"&@CRLF
If FileExists("Plug-in/4.mp3")=0 Then $verificador&="Falta Archivo 4"&@CRLF
If FileExists("Plug-in/5.mp3")=0 Then $verificador&="Falta Archivo 5"&@CRLF
;===================================================================================================

If $verificador="" Then
   Local $parte1= Run("Carga.exe")
   WinWait("Iniciando...","")
   WinWaitClose("Iniciando...","")
   Local $parte1= Run("Fotogramas BH.exe")
Else
   $verificador&=" "&@CRLF
   $verificador&="**************************"&@CRLF
   $verificador&=" "&@CRLF
   $verificador&="Contacte a soporte técnico"&@CRLF
   MsgBox(16,"Error",$verificador)
   Exit
EndIf
EndFunc