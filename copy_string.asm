TITLE copy_string

INCLUDE Irvine32.inc

Str_cpy PROTO,
		source:PTR BYTE,
		target:PTR BYTE
Str_lngth PROTO,
		pString:PTR BYTE
.data
	string_1 BYTE "ABCDEFGABCDEFGABCDEFGABCDEFG",0
	string_2 BYTE 20 DUP(?),0
.code
main PROC
	call Clrscr
	
	INVOKE Str_cpy,
	ADDR string_1,
	ADDR string_2

	mov edx,string_2
	call writestring

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