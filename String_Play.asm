INCLUDE Irvine32.inc
.data
str1 BYTE "Input Text: ",0
input BYTE 100 DUP(?),0
str2 BYTE "Exchange Text: ",0
Count BYTE 0
sizeoff DWORD 0
.code

main PROC

mov edx,OFFSET str1
call WriteString
mov ecx,SIZEOF input-1
mov edx,OFFSET input
call readString
mov sizeoff,eax
mov input[eax],' '
mov ecx,eax
mov edx,OFFSET str2
call WriteString
L1:
	movzx eax,input[esi]
	push eax
	inc Count 
	.if input[esi]==' '
	L2:
		movzx ecx,Count
		pop eax
		call WriteChar
		dec Count
	Loop L2
	.endif
	.if esi>sizeoff
	jmp next
	.endif
	inc esi
Loop L1
next:

exit
main ENDP
END main