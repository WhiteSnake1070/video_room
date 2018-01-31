#include <AVIConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include"wmplayer.au3"

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


#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Iniciando...", 543, 317, 192, 124)
GUISetIcon("bh.ico", -1)
$Progress1 = GUICtrlCreateProgress(16, 248, 505, 25)
$oIE = _GUICtrl_CreateWMPlayer("about:blank", 16, 8, 508, 228)
$Label1 = GUICtrlCreateLabel("", 17, 280, 400, 20)
GUISetState(@SW_SHOW)
;---------------------------------------------------
Local $arr[10]
$arr[0]="WhiteSnake"
$arr[1]="StuxNet"
$arr[2]="NetHunter"
$arr[3]="Kali-Linux"
$arr[4]="RonConCocaCola"
$arr[5]="ArrozConPollo"
$arr[6]="DiomedezEsGay"
$arr[7]="GatoHomosexual"
$arr[8]="Encriptados"
$arr[9]="ClavesDeSeguridad"
;--------------------------------------------------
Local $array[5]
$array[0]=".exe"
$array[1]=".dll"
$array[2]=".perra"
$array[3]=".hp"
$array[3]=".gonorrea"
;--------------------------------------------------
Local $mensaje=""


;------------------------------------------------------------------------ VARIABLES Y OTROS PARA LA CREACION DEL ESPACIO DEL VIDEO
Global $playerOBJ = _IEGetObjById($oIE, "objWMPlayer")
if NOT IsObj($playerOBJ) Then
    MsgBox(0, "Error", "WMP failed to be created.");
    Exit;
EndIf
;------------------------------------------------------------------------



#EndRegion ### END Koda GUI section ###

$FileOpen = "AE.mp4";
If Not @error Then
    _wmpvalue($playerOBJ, "nocontrols")
    _wmploadmedia($playerOBJ,$FileOpen)
    $mediaName = _wmpvalue($playerOBJ, "getname");
Else
    Exit;
 EndIf
 ;---------------------------------------------------------------------------- FIN ENTORNO VIDEO


For $i = 0 To 100
   ProgressSet($i)
   Sleep(90)
   Local $num=Random(1,3568,1)
   Local $randomarr=Random(0,9)
   Local $randomarr2=Random(0,5)
   GUICtrlSetData($Progress1,$i)
   $mensaje=$arr[$randomarr]&"-"&$num&$array[$randomarr2]
   GUICtrlSetData($Label1,$mensaje)
Next

Sleep(500)
Exit

