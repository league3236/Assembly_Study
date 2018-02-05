TITLE Edxeax
INCLUDE Irvine32.inc

.data

str1 BYTE "Input Edx 8byte:",0
str2 BYTE "Input Eax 8byte:",0
str3 BYTE "Ouput Edx+Eax to Int:",0
div1 QDWORD 10h,100h,1000h,10000h,100000h,1000000h,10000000h,100000000h,0
div2 DWORD 1h,10h,100h,1000h,10000h,100000h,1000000h,10000000h,0
result1 DWORD 8 DUP(0),0
result2 DWORD 8 DUP(0),0

.code
main PROC
mov eax,0
mov edx, OFFSET str1     ;output str1
call WriteString 

call ReadHex
mov edx,eax		;EDX<-EAX
push edx		;Push EDX

mov eax,0
mov edx, OFFSET str2
call WriteString	 ;output str2
call ReadHex

call DumpRegs
mov ebx, eax
mov ecx,8
mov esi,0
mov edx,0
L1:
	mov eax,ebx
	div div1[esi]
	mov eax,edx
	mov edx,0
	div div2[esi]
	mov result1[esi],eax	
	add esi,4
	mov edx,0
loop L1
pop edx
mov ebx,edx
mov ecx,8
mov esi,0
mov edx,0
L2:
	mov eax,ebx
	div div1[esi]
	mov eax,edx
	mov edx,0
	div div2[esi]
	mov result2[esi],eax	
	add esi,4
	mov edx,0
loop L2

mov eax,0
mov esi,0
mov ecx,8
L3:
	mov eax,result1[esi]
	call writeint
	call crlf
	add esi,4
loop L3

mov eax,0
mov esi,0
mov ecx,8
L4:
	mov eax,result2[esi]
	call writeint
	call crlf
	add esi,4
loop L4
mov edx, OFFSET str3
call WriteString	 ;output str3


exit
main ENDP
END main
