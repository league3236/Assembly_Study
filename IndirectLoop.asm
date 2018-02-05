TITLE IndirectLoop	(IndirectLoop.asm)

INCLUDE Irvine32.inc

.data
	Xbyte BYTE 1,2,3,4,5,6,7,8,9	;Xbyte�� ������
	Ybyte BYTE 1,2,3,4,5,6,7,8,9	;Ybyte�� ������
	Zbyte BYTE 9 DUP(0)		;Zbyte ũ��[9]�迭�� 0���� �ʱⰪ����.
	Countz BYTE 0			;�迭�̵����� COUNT
.code
main PROC

	mov	ecx,9		;9���ݺ�
	mov	eax, 00000000h	;eax�ʱ�ȭ
	mov	esi,OFFSET Xbyte	;esi�� Xbyte�����ּ� ����
	mov	edi,OFFSET Ybyte	;edi�� Ybyte�����ּ� ����
L1:
	mov	al,[esi]
	add	al,[edi]
	add	esi,TYPE Xbyte		;Xbyte TYPE��ŭ ����
	add	edi,TYPE Xbyte		;Ybyte TYPE��ŭ ����
	mov	Zbyte,al		;Zbyte�� ����.
	
	call	DumpRegs		;Zbyte�� ���
	
	loop	L1		;repeat the loop
	exit
main ENDP
END main