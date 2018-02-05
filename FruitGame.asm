TITLE Fruit Game
INCLUDE Irvine32.inc

.data
	str1 BYTE "FruitGame Start",0
	Banana BYTE "Banana :",0
	Apple BYTE "Apple: ",0
	Orange BYTE "Orange: ",0
	allfruit BYTE "ALL NUMBER: ",0 
	str2 BYTE "You can choose fruit.1.Banana 2.Apple 3.Orange : ",0
	str3 BYTE "Get num ",0
	str4 BYTE "THE Number is oversize you can repeat : ",0
	str5 BYTE "You Lose",0
	str6 BYTE "Computer choose fruit. : ",0
	str7 BYTE "Computer get num. : ",0
	str8 BYTE "You Win",0
	str9 BYTE "Computer Win",0

	Fruit DWORD 7,6,5,0	;���ϰ��� ����
	AllNum DWORD ?,0	;�� ���ϰ���
	Menu DWORD ?,0		;����� �������� ����
	Get DWORD ?,0			;������ ����
	

.code
main PROC
	mov edx,OFFSET str1
	call WriteString
	mov ecx,3	;3���� �������� ���
	mov esi,0
L1:			;�� ������ ���� ����
	mov eax,8
	call RandomRange
	add eax,1		;+1�����ν� 0�� �Ǵ°��� ����
	mov Fruit[esi],eax
	add esi,4
	loop L1		;�� ������ ���� �� �� ���� ���� ����Ϸ�

	call Num_out	;���� ���� ���
	mov AllNum,0	;��� ���� �ʱ�ȭ

	mov ecx,30

	L2:

	call User_game	;���� ����
	call Num_out	;���ϰ��� ���
	.if AllNum==1
		jmp L3
	.endif
	mov AllNum,0	;��� ���� �ʱ�ȭ

	call Com_game	;��ǻ�� ����
	call Num_out	;���ϰ��� ���
	.if AllNum==1
		jmp L4
	.endif
	mov AllNum,0	;��� ���� �ʱ�ȭ

	Loop L2
	L3:	
		call crlf
		mov edx,OFFSET str8
		call writestring
		exit
	L4:
		call crlf
		mov edx,OFFSET str9
		call writestring
	
exit
main ENDP
Num_out PROC 		;���� ���� ���
	call crlf
	mov esi,0
	mov edx,OFFSET Banana
	call WriteString
	mov eax, Fruit[esi]
	add AllNum,eax
	call WriteInt

	call crlf
	add esi,4
	mov edx,OFFSET Apple
	call WriteString
	mov eax,Fruit[esi]
	add AllNum,eax
	call WriteInt

	call crlf
	add esi,4
	mov edx,OFFSET Orange
	call WriteString
	mov eax,Fruit[esi]
	add AllNum,eax
	call WriteInt

	call crlf
	mov edx,OFFSET allfruit
	call WriteString
	mov eax,AllNum
	call WriteInt
	ret

Num_out ENDP

User_game PROC	;����� ����
	call crlf
	mov edx,OFFSET str2
	call WriteString	
	call ReadInt
	mov Menu,eax
	.if Menu==1
		mov esi,0
		mov edx,OFFSET str3
		call WriteString
		mov edx,OFFSET Banana
		call WriteString
		call ReadInt
		mov Get,eax
		.if eax > Fruit[esi]		;���� ������ �ʰ��ϸ� �ٽ� �Է�
			mov edx,OFFSET str4
			call WriteString
			call ReadInt
			mov Get,eax
		.endif
		sub Fruit[esi],eax
	.elseif Menu==2
		mov esi,4
		mov edx,OFFSET str3
		call WriteString
		mov edx,OFFSET Apple
		call WriteString
		call ReadInt
		mov Get,eax
		.if eax > Fruit[esi]		;���� ������ �ʰ��ϸ� �ٽ� �Է�
			mov edx,OFFSET str4
			call WriteString
			call ReadInt
			mov Get,eax
		.endif
		sub Fruit[esi],eax
	.elseif Menu==3
		mov esi,8
		mov edx,OFFSET str3
		call WriteString
		mov edx,OFFSET Apple
		call WriteString
		call ReadInt
		mov Get,eax
		.if eax > Fruit[esi]		;���� ������ �ʰ��ϸ� �ٽ� �Է�
			mov edx,OFFSET str4
			call WriteString
			call ReadInt
			mov Get,eax
		.endif
		sub Fruit[esi],eax
	.endif
	.if AllNum==1
		mov edx,OFFSET str5
		call WriteString
	.endif
	ret
User_game ENDP
Com_game PROC
	call crlf
	mov edx,OFFSET str6
	call writestring
	mov esi,0
	.if (Fruit[esi]==1&&Fruit[esi+4]==1&&Fruit[esi+8]==0)||(Fruit[esi]==1&&Fruit[esi+4]==0&&Fruit[esi+8]==1);0,1,1�� ������ ���
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi],1
		call crlf
	.elseif (Fruit[esi]==0&&Fruit[esi+4]==1&&Fruit[esi+8]==1)
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi+4],1
		call crlf
	.elseif (Fruit[esi]==1&&Fruit[esi+4]==2&&Fruit[esi+8]==0)||(Fruit[esi]==0&&Fruit[esi+4]==2&&Fruit[esi+8]==1);0,2,1��������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,2
		call writeint
		sub Fruit[esi+4],2
		call crlf
	.elseif (Fruit[esi]==2&&Fruit[esi+4]==1&&Fruit[esi+8]==0)||(Fruit[esi]==2&&Fruit[esi+4]==0&&Fruit[esi+8]==1)
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,2
		call writeint
		sub Fruit[esi],2
		call crlf
	.elseif (Fruit[esi]==0&&Fruit[esi+4]==1&&Fruit[esi+8]==2)||(Fruit[esi]==1&&Fruit[esi+4]==0&&Fruit[esi+8]==2)
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,2
		call writeint
		sub Fruit[esi+8],2
		call crlf
	.elseif (Fruit[esi+4]==0&&Fruit[esi+8]==0) ; 0,0,n�� �������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,1
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==0&&Fruit[esi+8]==0) ; 0,0.n�� �������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,1
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==0&&Fruit[esi+4]==0) ; 0,0,n�� �������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,1
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]==2&&Fruit[esi+4]==2&&Fruit[esi+8]==0)||(Fruit[esi]==2&&Fruit[esi+4]==0&&Fruit[esi+8]==2);2,2�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==0&&Fruit[esi+4]==2&&Fruit[esi+8]==2);2,2�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==1&&Fruit[esi+8]==0)||(Fruit[esi]!=0&&Fruit[esi+4]==0&&Fruit[esi+8]==1);1,n�� �������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==1&&Fruit[esi+4]!=0&&Fruit[esi+8]==0)||(Fruit[esi]==0&&Fruit[esi+4]!=0&&Fruit[esi+8]==1);1,n�� �������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==1&&Fruit[esi+4]==0&&Fruit[esi+8]!=0)||(Fruit[esi]==0&&Fruit[esi+4]==1&&Fruit[esi+8]!=0);1,n�� �������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]==3&&Fruit[esi+4]==2&&Fruit[esi+8]==0)||(Fruit[esi]==3&&Fruit[esi+4]==0&&Fruit[esi+8]==2);2,3�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==2&&Fruit[esi+4]==3&&Fruit[esi+8]==0)||(Fruit[esi]==0&&Fruit[esi+4]==3&&Fruit[esi+8]==2);2,3�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==2&&Fruit[esi+4]==0&&Fruit[esi+8]==3)||(Fruit[esi]==0&&Fruit[esi+4]==2&&Fruit[esi+8]==3);2,3�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==1&&Fruit[esi+8]==1);n,1,1�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,1
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==1&&Fruit[esi+4]!=0&&Fruit[esi+8]==1);n,1,1�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,1
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==1&&Fruit[esi+4]==1&&Fruit[esi+8]!=0);n,1,1�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,1
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==2&&Fruit[esi+8]==2);n,2,2�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==2&&Fruit[esi+4]!=0&&Fruit[esi+8]==2);n,2,2�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==2&&Fruit[esi+4]==2&&Fruit[esi+8]!=0);n,2,2�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==2&&Fruit[esi+8]==3)||(Fruit[esi]!=0&&Fruit[esi+4]==3&&Fruit[esi+8]==2);n,2,3�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,1
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==3&&Fruit[esi+4]!=0&&Fruit[esi+8]==2)||(Fruit[esi]==2&&Fruit[esi+4]!=0&&Fruit[esi+8]==3);n,2,3�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,1
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==3&&Fruit[esi+4]==2&&Fruit[esi+8]!=0)||(Fruit[esi]==2&&Fruit[esi+4]==3&&Fruit[esi+8]!=0);n,2,3�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,1
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif Fruit[esi]>2||(Fruit[esi]!=0&&Fruit[esi+4]==2&&Fruit[esi+8]==0)||(Fruit[esi]!=0&&Fruit[esi+4]==0&&Fruit[esi+8]==2);2,n�� �������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,2
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif Fruit[esi+4]>2||(Fruit[esi]==2&&Fruit[esi+4]!=0&&Fruit[esi+8]==0)||(Fruit[esi]==0&&Fruit[esi+4]!=0&&Fruit[esi+8]==2);2,n�� �������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,2
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif Fruit[esi+8]>2||(Fruit[esi]==2&&Fruit[esi+4]==0&&Fruit[esi+8]!=0)||(Fruit[esi]==0&&Fruit[esi+4]==2&&Fruit[esi+8]!=0);2,n�� �������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,2
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif Fruit[esi]>2||(Fruit[esi]!=0&&Fruit[esi+4]==1&&Fruit[esi+8]==3)||(Fruit[esi]!=0&&Fruit[esi+4]==3&&Fruit[esi+8]==1);n,1,3�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,2
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif Fruit[esi+4]>2||(Fruit[esi]==3&&Fruit[esi+4]!=0&&Fruit[esi+8]==1)||(Fruit[esi]==1&&Fruit[esi+4]!=0&&Fruit[esi+8]==3);n,1,3�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,2
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif Fruit[esi+8]>2||(Fruit[esi]==3&&Fruit[esi+4]==1&&Fruit[esi+8]!=0)||(Fruit[esi]==1&&Fruit[esi+4]==3&&Fruit[esi+8]!=0);n,1,3�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,2
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif Fruit[esi]>3||(Fruit[esi]!=0&&Fruit[esi+4]==1&&Fruit[esi+8]==2)||(Fruit[esi]!=0&&Fruit[esi+4]==2&&Fruit[esi+8]==1);n,1,2�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,3
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif Fruit[esi+4]>3||(Fruit[esi]==2&&Fruit[esi+4]!=0&&Fruit[esi+8]==1)||(Fruit[esi]==1&&Fruit[esi+4]!=0&&Fruit[esi+8]==2);n,1,2�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,3
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif Fruit[esi+8]>3||(Fruit[esi]==2&&Fruit[esi+4]==1&&Fruit[esi+8]!=0)||(Fruit[esi]==1&&Fruit[esi+4]==2&&Fruit[esi+8]!=0);n,1,2�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,3
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==3&&Fruit[esi+8]==3);n,3,3�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==3&&Fruit[esi+4]!=0&&Fruit[esi+8]==3);n,3,3�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==3&&Fruit[esi+4]==3&&Fruit[esi+8]!=0);n,3,3�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif Fruit[esi]>3||(Fruit[esi]!=0&&Fruit[esi+4]==0&&Fruit[esi+8]==3)||(Fruit[esi]!=0&&Fruit[esi+4]==3&&Fruit[esi+8]==0);n,0,3�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,3
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif Fruit[esi+4]>3||(Fruit[esi]==3&&Fruit[esi+4]!=0&&Fruit[esi+8]==0)||(Fruit[esi]==0&&Fruit[esi+4]!=0&&Fruit[esi+8]==3);n,0,3�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,3
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif Fruit[esi+8]>3||(Fruit[esi]==3&&Fruit[esi+4]==0&&Fruit[esi+8]!=0)||(Fruit[esi]==0&&Fruit[esi+4]==3&&Fruit[esi+8]!=0);n,0,3�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,3
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==4&&Fruit[esi+8]==4);n,4,4�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==4&&Fruit[esi+4]!=0&&Fruit[esi+8]==4);n,4,4�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==4&&Fruit[esi+4]==4&&Fruit[esi+8]!=0);n,4,4�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif Fruit[esi]>4||(Fruit[esi]!=0&&Fruit[esi+4]==0&&Fruit[esi+8]==4)||(Fruit[esi]!=0&&Fruit[esi+4]==4&&Fruit[esi+8]==0);n,0,4�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,4
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif Fruit[esi+4]>4||(Fruit[esi]==4&&Fruit[esi+4]!=0&&Fruit[esi+8]==0)||(Fruit[esi]==0&&Fruit[esi+4]!=0&&Fruit[esi+8]==4);n,0,4�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,4
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif Fruit[esi+8]>4||(Fruit[esi]==4&&Fruit[esi+4]==0&&Fruit[esi+8]!=0)||(Fruit[esi]==0&&Fruit[esi+4]==4&&Fruit[esi+8]!=0);n,0,4�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,4
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==4&&Fruit[esi+8]==5)||(Fruit[esi]!=0&&Fruit[esi+4]==5&&Fruit[esi+8]==4);n,4,5�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==4&&Fruit[esi+4]!=0&&Fruit[esi+8]==5)||(Fruit[esi]==5&&Fruit[esi+4]!=0&&Fruit[esi+8]==4);n,4,5�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==4&&Fruit[esi+4]==5&&Fruit[esi+8]!=0)||(Fruit[esi]==5&&Fruit[esi+4]==4&&Fruit[esi+8]!=0);n,4,5�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif Fruit[esi]>5||(Fruit[esi]!=0&&Fruit[esi+4]==1&&Fruit[esi+8]==4)||(Fruit[esi]!=0&&Fruit[esi+4]==4&&Fruit[esi+8]==1);n,1,4�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,5
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif Fruit[esi+4]>5||(Fruit[esi]==4&&Fruit[esi+4]!=0&&Fruit[esi+8]==1)||(Fruit[esi]==1&&Fruit[esi+4]!=0&&Fruit[esi+8]==4);n,1,4�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,5
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif Fruit[esi+8]>5||(Fruit[esi]==4&&Fruit[esi+4]==1&&Fruit[esi+8]!=0)||(Fruit[esi]==1&&Fruit[esi+4]==4&&Fruit[esi+8]!=0);n,1,4�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,5
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif Fruit[esi]>4||(Fruit[esi]!=0&&Fruit[esi+4]==1&&Fruit[esi+8]==5)||(Fruit[esi]!=0&&Fruit[esi+4]==5&&Fruit[esi+8]==1);n,1,5�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		sub eax,4
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif Fruit[esi+4]>4||(Fruit[esi]==5&&Fruit[esi+4]!=0&&Fruit[esi+8]==1)||(Fruit[esi]==1&&Fruit[esi+4]!=0&&Fruit[esi+8]==5);n,1,5�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		sub eax,4
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif Fruit[esi+8]>4||(Fruit[esi]==5&&Fruit[esi+4]==1&&Fruit[esi+8]!=0)||(Fruit[esi]==1&&Fruit[esi+4]==5&&Fruit[esi+8]!=0);n,1,5�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		sub eax,4
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==5&&Fruit[esi+8]==5);n,5,5�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		mov eax,Fruit[esi]
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==5&&Fruit[esi+4]!=0&&Fruit[esi+8]==5);n,5,5�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+4]
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif (Fruit[esi]==5&&Fruit[esi+4]==5&&Fruit[esi+8]!=0);n,5,5�̳�������
		mov edx,OFFSET Orange
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi+8]
		call writeint
		sub Fruit[esi+8],eax
		call crlf
	.elseif (Fruit[esi]!=0&&Fruit[esi+4]==0&&Fruit[esi+8]!=0)||(Fruit[esi]!=0&&Fruit[esi+4]!=0&&Fruit[esi+8]==0);0,n,n�̳�������
		mov edx,OFFSET Banana
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi],eax
		call crlf
	.elseif (Fruit[esi]==0&&Fruit[esi+4]!=0&&Fruit[esi+8]!=0);0,n,n�̳�������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,1
		call writeint
		sub Fruit[esi+4],eax
		call crlf
	.elseif						;n,n,n�� ��������
		mov edx,OFFSET Apple
		call writestring
		call crlf
		mov edx,OFFSET str7
		call writestring
		mov eax,Fruit[esi]
		call RandomRange
		add eax,1
		call writeint
		sub Fruit[esi],eax
		call crlf
	.endif
	ret
Com_game ENDP

END main