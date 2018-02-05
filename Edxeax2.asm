TITLE Edxeax2
INCLUDE Irvine32.inc

.data
str1 BYTE "Input Int1:",0
str2 BYTE "Input Int2:",0
str3 BYTE "Output hex:",0
str4 BYTE "Output Int:",0
Int1 DWORD 1 DUP(?),0
Int2 DWORD 1 DUP(?),0
hexeax DWORD 1 DUP(?),0
hexedx DWORD 1 DUP(?),0
result1 DWORD 8 DUP(0),0
result2 DWORD 8 DUP(0),0

.code
main PROC

mov edx,OFFSET str1
call Writestring
call ReadInt
mov Int1, eax

mov edx,OFFSET str2
call Writestring
call ReadInt
mov Int2, eax

mov edx,OFFSET str3
call WriteString

mov eax,Int1
mul Int2
mov hexeax,eax
mov hexedx,edx
push eax
mov eax,edx
call writehex
pop eax
call writehex

call crlf
mov edx,OFFSET str4
call WriteString




exit
main ENDP
END main