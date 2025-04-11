section .data

section .bss
	buf resb 1

section .text
	global _start

_start:

	mov eax, 3	;sys call
	mov ebx, 0	;stdin
	mov ecx, buf	;mem
	mov edx, 1	;length
	int 0x80	;interrupt 0x80

	mov al, Byte[buf]
	inc al
	mov byte[buf], al

	mov eax, 4	;sys call
	mov ebx, 1	;stdout
	mov ecx, buf	;mem
	mov edx, 1	;length
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
