TITLE EncryptingString
; Program Description: Encypting a String
; Author : Kwak S.H
; Creation Date : 2016-10-11
; Revisions : X
; Date :
INCLUDE Irvine32.inc
KEY = 154
.data
	ansStr BYTE "Enter the plain text:",0
	ansStr2 BYTE "Cipher text:",0
	ansStr3 BYTE "Decrypted:",0
	iniStr BYTE 20 DUP(?)
.code
main PROC
	mov edx,OFFSET ansStr
	call WriteString
	mov edx,OFFSET iniStr
	mov ecx,SIZEOF iniStr-1
	call ReadString
	mov ecx, eax
	push eax
	mov esi, 0
L1:
	xor iniStr[esi],KEY
	inc esi
	loop L1

	mov edx, OFFSET ansStr2
	call WriteString
	mov edx, OFFSET iniStr
	call WriteString
	pop eax
	mov ecx, eax
	mov esi,0
L2:
	xor iniStr[esi],KEY
	inc esi
	loop L2
	call Crlf
	mov edx, OFFSET ansStr3
	call WriteString
	mov edx, OFFSET iniStr
	call WriteString
	

exit
main ENDP
END main
