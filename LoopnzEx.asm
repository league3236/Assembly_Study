TITLE LoopnzEx
; Program Description: LoopnzEx
; Author : Kwak S.H
; Creation Date : 2016-10-11
; Revisions : X
; Date :
INCLUDE Irvine32.inc
.data
	array SWORD 3,6,1,10,-10,-30,-40,-4
	sentinel SWORD 0
	outSt BYTE "First minus:"
.code
main PROC
	mov esi,0
	mov ecx, LENGTHOF array-1
	L1:
		movsx eax, array[esi]
		pushfd
		add esi, TYPE array
		popfd
		.if eax>800
			jmp next
		.endif
	loop L1
	next:
	mov edx, OFFSET outSt
	call WriteString
	call WriteInt
exit
main ENDP
END main
