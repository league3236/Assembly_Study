INCLUDE Irvine32.inc

.data
arrayA BYTE 10,20,30,40,50,60
arrayB WORD 11,22,33,44,55,66
arrayC DWORD 1,2,3,4,5,6

.code
main proc
 mov eax,0
 mov edx,OFFSET arrayA
 mov ecx,LENGTHOF arrayA-1
 A:
	add al,[edx]
	add edx,TYPE arrayA
 loop A

 call WriteInt
 call crlf
 
 mov eax,0
 mov edx,OFFSET arrayB
 mov ecx,LENGTHOF arrayB
 B:
	add ax,[edx]
	add edx,TYPE arrayB
 loop B
 call WriteInt
 call crlf

  mov eax,0
 mov edx,OFFSET arrayC
 mov ecx,LENGTHOF arrayC
 LC:
	add eax,[edx]
	add edx,TYPE arrayC
 loop LC
 call WriteInt
 call crlf

exit
main ENDP
END main