     1                                  section .data
     2                                  
     3                                  section .bss
     4 00000000 ??                      	buf resb 1
     5                                  
     6                                  section .text
     7                                  	global _start
     8                                  
     9                                  _start:
    10                                  
    11 00000000 B803000000              	mov eax, 3	;sys call
    12 00000005 BB00000000              	mov ebx, 0	;stdin
    13 0000000A B9[00000000]            	mov ecx, buf	;mem
    14 0000000F BA01000000              	mov edx, 1	;length
    15 00000014 CD80                    	int 0x80	;interrupt 0x80
    16                                  
    17 00000016 A0[00000000]            	mov al, Byte[buf]
    18 0000001B FEC0                    	inc al
    19 0000001D A2[00000000]            	mov byte[buf], al
    20                                  
    21 00000022 B804000000              	mov eax, 4	;sys call
    22 00000027 BB01000000              	mov ebx, 1	;stdout
    23 0000002C B9[00000000]            	mov ecx, buf	;mem
    24 00000031 BA01000000              	mov edx, 1	;length
    25 00000036 CD80                    	int 0x80
    26                                  
    27 00000038 B801000000              	mov eax, 1
    28 0000003D BB00000000              	mov ebx, 0
    29 00000042 CD80                    	int 0x80
