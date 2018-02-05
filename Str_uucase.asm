TITLE Str_trim 

INCLUDE Irvine32.inc

Str_ttrim PROTO,
		pString:PTR BYTE,
		char:BYTE
.data
myString BYTE "Hello###",0
.code
main PROC
	INVOKE Str_ttrim,ADDR myString,'#'

exit
main ENDP

Str_ttrim PROC USES eax ecx edi,
	pString:PTR BYTE,
	char:BYTE
	mov edi,pString
	INVOKE Str_length,edi
	cmp eax,0
	je L2
	mov ecx,eax
	dec eax
	add edi,eax
	mov al,char
	std
	repe scasb
	jne L1
	dec edi
L1:mov BYTE PTR [edi+2],0
L2:ret
END main