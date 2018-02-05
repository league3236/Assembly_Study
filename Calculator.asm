TITLE Calculator
INCLUDE Irvine32.inc
.data
	str1 BYTE "�ΰ��� ���ڸ� �Է��Ͻÿ�:",0
	str2 BYTE "1.����",0Dh,0Ah,
		"2.����",0Dh,0Ah,
		"3.����",0Dh,0Ah,
		"4.������",0Dh,0Ah,0
	str3 BYTE "����: ",0
	str4 BYTE "���: ",0
	num1 DWORD ?	;����1
	num2 DWORD ?	;����2
	cnt DWORD 0
.code
main PROC

	mov edx, OFFSET str1
	call WriteString
	call Crlf
	
	call ReadInt ;num1	;num1, num2����
	mov eax, num1
	call ReadInt ;num2
	mov eax, num2

	mov edx, OFFSET str2	;menu���
	call WriteString
	call Crlf
	mov edx, OFFSET str3
	call WriteString
	call Crlf

	call ReadInt		;���ù�ȣ ����
	call Crlf
	mov edx,OFFSET str4
	call WriteString

	cmp eax,1
	je Menu1
	cmp eax,2
	je Menu2
	cmp eax,3
	je Menu3
	cmp eax,4
	je Menu4
	jmp DONE			;�ƹ��͵� �������� ����.

	Menu1:call Addnum
	jmp DONE
	Menu2:call Subnum
	jmp DONE
	Menu3:call Multiplication
	jmp DONE
	Menu4:call Division
	jmp DONE

DONE:

exit
main ENDP

Addnum PROC
	mov eax,num1
	add eax,num2
	
	call WriteDec
	call Crlf

	ret
Addnum ENDP		;���ϱ� �Լ� ����

Subnum PROC
	mov eax,num1
	sub eax,num2
	
	call WriteDec
	call Crlf

Subnum ENDP

Multiplication PROC
	mov ecx,num2
	mov eax,0
L1:
	add eax,num1
loop L1
	call WriteDec
	call Crlf
Multiplication ENDP

Division PROC
	mov eax,num1
	mov ebx,0
	mov ecx,num1
L1:
	inc cnt
	mov eax,num1
	add ebx,num2
	cmp eax,ebx
	je DONE2	;eax=ebx�̸� ���� ī��ƮȽ��
	jb DONE3	;eax<ebx�̸� ���� ī��Ʈ Ƚ�� -1
loop L1

DONE3:
	dec cnt
	
DONE2:
	mov eax,cnt
	call WriteDec
	call Crlf
ret
Division ENDP

END main
