TITLE spacechange
INCLUDE Irvine32.inc	
.DATA
	str1 BYTE "Input String:",0
	str2 BYTE "Output String:",0

	str3 BYTE 20 DUP(?),0

	ecc DWORD ?,0
.CODE

main PROC

	mov edx,OFFSET str1
	call writestring

	mov edx,0
	mov ecx,sizeof str3-1
	mov edx,OFFSET str3
	call readstring
	
	mov edx,OFFSET str2
	call writestring
	
	mov esi,0
	mov ecx,sizeof str3-1
	mov eax,0
	mov ebx,0
	L1:
		movzx eax,str3[esi]
		.if(str3[esi]>='a'&&str3[esi]<='z')||(str3[esi]>='A'&&str3[esi]<='Z')
			push eax
			add ebx,1
		.else
			mov ecc,ecx
			mov ecx,ebx
			L2:
			pop eax
			.if eax>='a'&&eax<='z'||eax>='A'&&eax<='Z'
			call writechar
			.endif
			Loop L2
			.if(str3[esi]==' ')
			movzx eax,str3[esi]
			call writechar
			.endif
			mov ebx,0
			mov ecx,ecc
		.endif
		add esi,1 
	Loop L1

exit
main ENDP
END main