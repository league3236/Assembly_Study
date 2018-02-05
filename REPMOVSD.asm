INCLUDE Irvine32.inc

.data
array DWORD 1,1,2,3,4,5,6,7,8,9,10

.code
main PROC

cld
mov ecx,(LENGTHOF array)-1
mov esi,OFFSET array+4
mov edi,OFFSET array
rep movsd

mov esi,0
mov ecx,(LENGTHOF array)

L1:
	mov eax,array[esi]
	call writeint
	call crlf
	add esi,4
loop L1

exit
main ENDP
END main