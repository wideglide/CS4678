;start.asm
USE32
extern main

global _start

section .text

_start:
	lea 	eax, [esp + 4]
	mov 	ebx, [esp]
	push 	eax
	push 	ebx
	call 	main
	add 	esp, 8
	mov 	ebx, eax
	mov 	eax, 1
	int 	0x80
