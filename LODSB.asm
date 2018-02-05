INCLUDE Irvine32.inc

.data
array BYTE 1,2,3,4,5,6,7,8,9
.code
main PROC

	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	cld
L1:
	lodsb
	or al,30h
	call WriteChar
	loop L1

exit
main ENDP
END main