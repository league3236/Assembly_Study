INCLUDE Irvine32.inc
.data
str1 BYTE "Input Char: ",0
str2 BYTE "Input Int: ",0
str4 BYTE ?
num DWORD ?

.code 
main PROC

mov edx, OFFSET str1
call WriteString
call ReadChar
call WriteChar
mov str4, al
mov ecx, 0
call crlf

mov edx, OFFSET str2
call WriteString
call ReadInt
mov num, eax
mov ecx, 0

mov ecx,num
mov al,str4
L1:
push ecx
	L2:
	call WriteChar

	loop L2
call crlf
pop ecx
loop L1	

main ENDP
END main
exit
