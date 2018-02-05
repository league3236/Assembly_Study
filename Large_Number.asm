INCLUDE Irvine32.inc

.data
str1 BYTE "Input Number1: ",0
str2 BYTE "Input Number2: ",0
str3 BYTE "Large Number: ",0
Num1 DWORD ? ,0
Num2 DWORD ?,0
.code
main PROC
mov edx,OFFSET str1
call WriteString
call ReadInt
mov Num1, eax

mov edx,OFFSET str2
call WriteString
call ReadInt
mov Num2,eax

.if eax<Num1
	mov eax, Num1
.endif

mov edx, OFFSET str3
call WriteString
call WriteInt

exit
main ENDP
END main