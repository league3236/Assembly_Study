INCLUDE Irvine32.inc
.data
str1 BYTE "Input Char: ",0
stri BYTE ?
spa BYTE " "
Num1 BYTE 20
Num2 BYTE 1

.code
main PROC

mov edx,OFFSET str1
call WriteString
mov ecx,SIZEOF stri
mov edx,OFFSET stri
call readString

L1:
movzx ecx,Num2
mov eax,0
	L2:
		.if ecx>20
		jmp next
		.endif
	inc eax
	Call writeString
	Loop L2
inc Num2
call crlf
loop L1

next:
L3:
movzx ecx,Num1
	L4:
		.if ecx<=0
		jmp quit
		.endif
	call WriteString
	Loop L4
dec Num1
call crlf
Loop L3

quit:
exit

main ENDP
END main