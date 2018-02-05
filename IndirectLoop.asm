TITLE IndirectLoop	(IndirectLoop.asm)

INCLUDE Irvine32.inc

.data
	Xbyte BYTE 1,2,3,4,5,6,7,8,9	;Xbyte에 값저장
	Ybyte BYTE 1,2,3,4,5,6,7,8,9	;Ybyte에 값저장
	Zbyte BYTE 9 DUP(0)		;Zbyte 크기[9]배열을 0으로 초기값지정.
	Countz BYTE 0			;배열이동위한 COUNT
.code
main PROC

	mov	ecx,9		;9번반복
	mov	eax, 00000000h	;eax초기화
	mov	esi,OFFSET Xbyte	;esi에 Xbyte시작주소 저장
	mov	edi,OFFSET Ybyte	;edi에 Ybyte시작주소 저장
L1:
	mov	al,[esi]
	add	al,[edi]
	add	esi,TYPE Xbyte		;Xbyte TYPE만큼 증가
	add	edi,TYPE Xbyte		;Ybyte TYPE만큼 증가
	mov	Zbyte,al		;Zbyte에 저장.
	
	call	DumpRegs		;Zbyte값 출력
	
	loop	L1		;repeat the loop
	exit
main ENDP
END main