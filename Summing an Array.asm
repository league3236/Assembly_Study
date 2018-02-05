TITLE Summing an Array

INCLUDE Irvine32.inc

.data
intarray DWORD 10000h,20000h,30000h,40000h

.code
main PROC
	mov edi, OFFSET intarray
	mov ecx, LENGTHOF intarray
	mov eax,0
L1:
	add eax, [edi]
	add edi, TYPE intarray
	loop L1

exit
main ENDP
END main