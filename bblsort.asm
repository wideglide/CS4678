;--------------------------------------------
; Name:
; Class: CS4678
; Assignment 1
; File: bblsort.asm
; Last modified: 17 Jan 2012
;--------------------------------------------
;
;nasm -f elf bblsort.asm
;ld -o sort bblort.o

USE32
section	.data

global	passes

array:		dd	9,5,8,3,0,2,1,7,6,4
passes:		dd	0


section	.text
			; we must export the entry point to the ELF linker or
global	_start		; loader. They conventionally recognize _start as their
			; entry point. Use ld -e foo to override the default.

_start:
	mov	edx, 9

outerloop:
	mov	ecx, 0
	mov	edi, 0			; $edi test if swaps are made
innerloop:
	mov	eax, [array + ecx *4]
	mov 	ebx, [array +4 + ecx * 4]
	cmp	eax, ebx
	jge	next
	inc	edi			; swapping, so increment $edi
	mov	[array + ecx *4], ebx
	mov	[array + 4 + ecx * 4], eax
next:
	inc	ecx
	cmp	ecx, edx
	jl	innerloop
endinner:
	inc	DWORD [passes]
	test	edi, edi		; if $edi is zero we're done
	jz	done
	dec	edx
	jnz	outerloop
done:
	mov	ebx, [passes]		; first syscall argument: exit code
	mov	eax, 1			; system call number (sys_exit)
	int	0x80			; call kernel
