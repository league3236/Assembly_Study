INCLUDE Irvine32.inc

.data
buffer BYTE 32 DUP(0),0

.code
main PROC
	mov ecx,32
	mov esi,OFFSET buffer
	mov eax,14
	
	call WriteBin
	call crlf
L1:
	shl eax,1
	mov BYTE PTR [esi],'0'
	jnc L2
	mov BYTE PTR [esi],'1'
L2:
	call WriteBin
	call crlf
	inc esi
loop L1	 


exit

main ENDP
END main