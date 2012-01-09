;nasm -f elf part2.asm
;gcc -o part2 part2.o

USE32

section	.data

newline	db	0x0a

section	.bss

section	.text

extern printf
extern exit

global	main

main:
	mov esi, [esp + 8]
	mov edx, [esp + 4]
print:
	push DWORD [esi]
	call printf
	pop eax
	push newline
	call printf
	pop eax
	dec DWORD [esp + 4]
	jz done
	add esi, 4
	jmp print
done:
	push 0
	call exit 
