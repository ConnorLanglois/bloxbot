#include <Constants.au3>
#include <Array.au3>

_Main()

Func _Main()
   _Init()
   _Run()
EndFunc

Func _Init()
   HotKeySet('{END}', '_Exit')
   AutoItSetOption('SendKeyDownDelay', 145)

   _Window_Attach('Bloxorz')
EndFunc

Func _Run()
   Local $moves = 'rdrrddr.' & _
				  'urdrrrruuddrrrrulu.' & _
				  'rurrrurdluurdlurrrdddr.' & _
				  'ulurrurrrrrrdrdddddrulllllld.' & _
				  'lllrlllllldrdrdrrrrrdrrrlllldllllll.' & _
				  'rrrddrddrdrullluuluuurrdrrulddrrddr.' & _
				  'dlurrrrrdrlullllldrdrdrrruurdluruurrrdrdrdlu.' & _
				  'rr,dddrr uuurr.' & _
				  'rdrrrrrrur,dlllllu drrrrrd.' & _
				  'rr,ldddrdddddllllullldurrrdrrru ddrrdrdddlduruuuluur, lllllll llllllllll.' & _
				  'rrrruldddrrrruuluullldrurrdrulllddllluuruuldrurdl.'

   For $move in StringSplit($moves, '', $STR_NOCOUNT)
	  If $move = '.' Then
		 Sleep(5000)
	  ElseIf $move = ',' Then
		 Sleep(1000)
	  Else
		 Local $key

		 If $move = 'u' Then
			$key = '{UP}'
		 ElseIf $move = 'd' Then
			$key = '{DOWN}'
		 ElseIf $move = 'l' Then
			$key = '{LEFT}'
		 ElseIf $move = 'r' Then
			$key = '{RIGHT}'
		 ElseIf $move = ' ' Then
			$key = '{SPACE}'
		 EndIf

		 Send($key)
		 Sleep(100)
	  EndIf
   Next
EndFunc

Func _Window_Attach($title)
   Local $hWnd = WinWait($title, '', 5)

   If @error Then
	  MsgBox(0, 'ERROR', 'Could not locate window', 5)
	  _Exit()
   EndIf

   WinActivate($hWnd)

   If Not WinWaitActive($hWnd, '', 5) Then
	  MsgBox(0, 'ERROR', 'Could not activate window')
	  _Exit()
   EndIf

   Sleep(1000)
EndFunc

Func _Exit()
   Exit
EndFunc
