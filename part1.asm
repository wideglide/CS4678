;nasm -f elf part1.asm
;ld -o part1 part1.o
USE32
section	.data

global buffer
section	.bss
buffer:	resb	200

section	.text

global	_start

_start:

prompt:
	mov	edx, 200	; arg3 - size_t len
	mov	ecx, buffer	; arg2 - char *buf
	mov	ebx, 0		; arg1 - int fd (STDIN)
	mov	eax, 3		; syscall 3 = read
	int	0x80		; call read(STDIN, buffer, 200)

	mov	edi, 0		; edi counts string length
convert:
	mov	dl, [ecx]
	inc	ecx
	inc	edi
	cmp	dl, 0x0A	; '\n' newline char
	jz	print
	cmp	dl, 96		; char one less than a
	jl	convert
	cmp	dl, 122	; 'z' char
	jg	convert
	sub	dl, 32
	mov	[ecx-1], dl
	jmp	convert

print:
	mov	edx, edi	; arg3 - size_t len
	mov	ecx, buffer	; arg2 - char  *buf
	mov	ebx, 1		; arg1 - int fd (STDOUT)
	mov	eax, 4		; syscall 4 = write
	int	0x80		; call write(STDOUT, buffer, 200)
done:
	mov	ebx, 0
	mov	eax, 1		; sys_exit
	int	0x80



