;--------------------------------------------
; Name:
; Class: CS4678
; Assignment 2
; File: part2.asm
; Last modified: 17 Jan 2012
;--------------------------------------------
;
;nasm -f elf part2.asm
;gcc -o part2 part2.o

USE32

section	.data

newline	db	0x0a		; '\n' newline char

section	.text

extern printf
extern exit

global	main

main:
	mov 	esi, [esp + 8]	; argv resides here
	mov 	edx, [esp + 4]	; argc resides here
print:
	push 	DWORD [esi]		; ptr to argv[x]
	call 	printf
	pop 	eax
	push 	newline			; print a '\n'
	call 	printf
	pop 	eax
	dec 	DWORD [esp + 4]	; dec argc
	jz 	done			; argc == 0 means we're done
	add 	esi, 4			; next ptr - argv[x+1]
	jmp 	print
done:
	push 	0
	call 	exit 
