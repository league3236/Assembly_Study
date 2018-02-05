TITLE InputString

INCLUDE Irvine32.inc

.data
	Ask BYTE "Put in your answer:",0
	Answer BYTE 8 DUP(?)
	Count DWORD ?	
.code
main PROC

	mov edx, OFFSET Ask
	call WriteString
	mov edx, OFFSET Answer
	mov ecx, SIZEOF Answer-1
	call ReadString
	
	mov Count, eax
	mov ecx, Count
	mov esi, 0
	L1:
		mov al, Answer[esi]
		push eax
		inc esi
		call WriteChar
	loop L1
	mov ecx, Count
	mov esi, 0
	L2:
		pop eax
		call WriteChar	
	loop L2
	exit
main ENDP
END main