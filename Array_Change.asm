TITLE Array_Change
INCLUDE Irvine32.inc

.data
arrayA DWORD 1,2,3
.code
main PROC
mov eax, arrayA
push eax
mov eax, [arrayA+4]
push eax
mov eax, [arrayA+8]
push eax
pop eax
mov [arrayA], eax
pop eax
mov [arrayA+4], eax
pop eax
mov [arrayA+8], eax

mov ecx,LENGTHOF arrayA
mov esi,0
L1:
	mov eax,arrayA[esi]
	call WriteInt
	add esi, TYPE arrayA
loop L1

exit

main ENDP
END main