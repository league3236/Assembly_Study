TITLE Loopin

Include Irvine32.inc

.data
count DWORD ?
outer BYTE "Outer Loop: ",0
inner BYTE "Inner Loop: ",0
ocnt DWORD ?

.code
main PROC
	mov eax,0
	mov ecx,100
L1:	mov edx,OFFSET outer
	call WriteString
	inc eax
	call WriteInt
	call Crlf
	mov ocnt,eax
	mov eax,0
	mov count,ecx
	mov ecx,20
L2:	mov edx,OFFSET inner
	call WriteString
	inc eax
	call WriteInt
	call Crlf
	loop L2
	mov ecx,count
	mov eax,ocnt
	loop L1
exit
main ENDP
END main
