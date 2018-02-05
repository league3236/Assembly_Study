INCLUDE Irvine32.inc
.data

str1 BYTE 100 DUP(?),0
.code
main PROC
	mov ecx, LENGTHOF str1-1
	mov edx, OFFSET str1
	call ReadString
	mov esi,0
	mov ecx, LENGTHOF str1-1

L1:
	.if str1[esi]>=97 && str1[esi]<=122
	sub str1[esi],32
	movzx eax,str1[esi]
	call WriteChar

	.elseif str1[esi]>=65 && str1[esi]<=90
	add str1[esi],32
	movzx eax,str1[esi]
	call WriteChar

	.elseif str1[esi]==32
	movzx eax,str1[esi]
	call WriteChar
	jmp next
	
	.endif
	
	next:
	inc esi

Loop L1

exit
	
main ENDP
END main