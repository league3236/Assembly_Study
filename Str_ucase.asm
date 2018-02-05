TITLE Str_ucase 

INCLUDE Irvine32.inc

Str_uucase PROTO,
		pString:PTR BYTE
.data
myString BYTE "Hello",0
.code
main PROC
	INVOKE Str_uucase,ADDR myString

exit
main ENDP
END main
Str_uucase PROC USES eax esi,
	pString:PTR BYTE
	mov esi,pString

L1:
	mov al,[esi]
	cmp al,0
	je L3
	cmp al,'a'
	jb L2
	cmp al,'z'
	ja L2
	and BYTE PTR [esi],11011111b

L2:
	inc esi
	jmp L1

L3: ret
Str_uucase ENDP

