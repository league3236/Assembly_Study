TITLE HexTODec
INCLUDE Irvine32.inc
.DATA
	str1 BYTE "Input Hex:",0
	str2 BYTE "output Dec:",0
	str3 BYTE "Continue?(y/n):",0
	str4 BYTE "Error",0

	key DWORD ?,0

.CODE

main PROC

	op:
		mov edx,OFFSET str1
		call writestring
		mov eax,0
		call readhex
		push eax
		call crlf

		mov edx,OFFSET str2
		call writestring
		pop eax
		call writedec
		call crlf

		op3:
		mov edx,OFFSET str3
		call writestring
		mov eax,0
		call readchar
		call writechar
		mov key,eax
		
		.if key=='y'	
			call crlf
			jmp op
		.elseif key=='n'
			call crlf
			jmp op2
		.elseif
			call crlf
			mov edx,OFFSET str4
			call writestring
			call crlf
			jmp op3
		.endif
	
	op2:
	

exit
main ENDP
END main
4+32+768+8192