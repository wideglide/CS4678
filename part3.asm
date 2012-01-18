;--------------------------------------------
; Name:
; Class: CS4678
; Assignment 2
; File: part3.asm
; Last modified: 17 Jan 2012
;--------------------------------------------
;
;nasm -f elf part3.asm
;nasm -f elf start.asm
;gcc -o main main.c start.o part3.o -nostdlib

USE32
section	.data

section	.text

global l_strlen
global l_strcmp
global l_gets
global l_write
global l_exit

;--------------------------------------------
;  int l_strlen(char *str);
;	return the length of the null terminated string, str. 
;	The null character should not be counted.
;--------------------------------------------
l_strlen:
	push 	ebp			; save callers frame pointer
	mov 	ebp, esp		; setup internal frame pointer

	push 	edi			; save edi
	cld				; clear DF, count up
	mov 	ecx, -1		; init counter
	xor 	eax, eax		; set eax to zero
	mov 	edi, [ebp + 8]	; string (arg1 - *str) 
	repnz 	scasb			; scan for eax (null)
	inc	ecx			; get the length (don't count null)
	not 	ecx			; now ecx is the count
	mov 	eax, ecx
	pop 	edi			;restore edi
	
	mov	esp, ebp		; restore esp
	pop	ebp			; restore caller's fp
	ret

;--------------------------------------------
;  int l_strcmp(char *str1, char *str2);
;	return 0 if str1 and str2 are equal, return 1 if they are not. 
;	Note that this is not the same definition as the C standard 
;	library function strcmp.
;--------------------------------------------
l_strcmp:
	push 	ebp			; save callers frame pointer
	mov 	ebp, esp		; setup internal frame pointer

	push 	esi			; save esi, edi
	push 	edi
	cld				; clear DF, count up
	mov 	ecx, -1		; init counter for length
	xor 	eax, eax		; clear eax
	mov 	edi, [ebp + 8]	; set string1 (arg1)
	repnz 	scasb			; get scan for (null)
	inc	ecx			; set the length
	not 	ecx			; ecx has count for compare
	mov 	edi, [ebp + 8]	; set string1 (arg1)
	mov 	esi, [ebp + 12]	; set string2 (arg2)
	repe 	cmpsb			; compare the strings
	xor 	eax, eax		; set eax to zero
	test 	ecx, ecx		; see if ecx is zero
	jz .done
	inc 	eax			; return one if not equal

.done:
	pop 	edi
	pop 	esi		; restore esi, edi

	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret


;--------------------------------------------
;  int l_gets(int fd, char *buf, int len);
;	read at most len bytes from file fd, placing them into buffer buf. 
;	Terminate early if a new line character ('\n', 0x0A) characters is 
;	read. If a new line character is encountered, it should be stored 
;	into the output buffer and counted in the total number of bytes read.
;	Return the total number of bytes read.
;--------------------------------------------
l_gets:
	push 	ebp			; save callers frame pointer
	mov 	ebp, esp		; setup internal frame pointer

	push 	ebx			; save ebx, edi, esi
	push 	edi
	push	esi

	xor	esi, esi		; zero esi for counter
	mov	edi, [ebp + 16]	; real length
	mov	edx, 1			; read one byte ( in loop )
	mov	ecx, [ebp + 12]	; arg2 - char *buf
	mov	ebx, [ebp + 8]	; arg1 - int fd
.stdin:
	test	ebx, ebx		; check for STDIN
	jnz	.loop
	xor	edi, edi		; zero edi
	mov	edx, [ebp + 16]	; arg3 - int len
	mov	eax, 3			; syscall 3 = read
	int	0x80
	jmp	.done
.loop:
	mov	eax, 3		; syscall 3 = read
	int	0x80		; call read(ebx, ecx, edx)
	inc	esi		; read one byte
	mov	eax, esi	; return total read in eax
	dec	edi
	jz	.done
	xor	eax, eax	; clear eax
	mov	al, [ecx]
	xor	al, 0x0A	; check for '\n'
	jz	.done
	inc	ecx
	jmp	.loop
.done:
	pop	esi
	pop	edi		;restor ebx, edi, esi
	pop	ebx
	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret

;--------------------------------------------
;  int l_write(int fd, char *buf, int len);
;	write len bytes from buffer buf to file fd. 
;	Return the number of bytes actually written.
;--------------------------------------------
l_write:
	push 	ebp			; save callers frame pointer
	mov 	ebp, esp		; setup internal frame pointer

	push	ebx			;save ebx

	mov	edx, [ebp + 16]	; arg3 - int len
	mov	ecx, [ebp + 12]	; arg2 - char *buf
	mov	ebx, [ebp + 8]	; arg1 - int fd
	mov	eax, 4			; syscall 4 = write
	int	0x80			; call write(ebx, ecx, edx)

	pop	ebx			; restor ebx

	mov	esp, ebp		; restore esp
	pop	ebp			; restore caller's fp
	ret

;--------------------------------------------
;  int l_exit(int rc);
;	terminate the calling program with exit code rc.
;--------------------------------------------
l_exit:
	mov	ebx, [esp + 4]	; arg1 - int rc
	mov	eax, 1
	int	0x80
