USE32
section	.data

section	.text

global l_strlen
global l_strcmp
global l_gets
global l_write
global l_exit

l_strlen:
	push ebp		; save callers frame pointer
	mov ebp, esp		; setup internal frame pointer

	push edi		; save edi
	cld			; clear DF, count up
	mov ecx, -1		; init counter
	xor eax, eax		; set eax to zero
	mov edi, [ebp + 8]	; string (arg1) 
	repnz scasb		; scan for eax (null)
	inc ecx		; get the length
	not ecx		; now ecx is the count
	mov eax, ecx
	pop edi		;restore edi
	
	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret

l_strcmp:
	push ebp		; save callers frame pointer
	mov ebp, esp		; setup internal frame pointer

	push esi		; save esi, edi
	push edi
	cld			; clear DF, count up
	mov ecx, -1		; set the length for length
	xor eax, eax		; 
	mov edi, [ebp + 8]	; set string1 (arg1)
	repnz scasb		; get scan for (null)
	inc ecx		; get the length
	not ecx		; ecx has count for compare
	mov esi, [ebp + 12]	; set string2 (arg2)
	repe cmpsb		; compare the strings
	xor eax, eax		; set eax to zero
	test ecx, ecx		; see if ecx is zero
	jz .done
	inc eax		; return one if not equal

.done:
	pop edi
	pop esi		; restore esi, edi

	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret


l_gets:
	push ebp		; save callers frame pointer
	mov ebp, esp		; setup internal frame pointer

	push ebx		; save ebx, edi
	push edi

	mov	edi, [ebp + 16]	; real length
	mov	edx, 1			; read one byte
	mov	ecx, [ebp + 12]	; arg2 - char *buf
	mov	ebx, [ebp + 8]	; arg1 - int fd
.stdin:
	test	ebx, ebx		; check for STDIN
	jnz	.loop
	xor	edi, edi		; zero edi
	mov	edx, [ebp + 16]	; arg3 - int len
	mov	eax, 3
	int	0x80
	jmp	.done
.loop:
	mov	eax, 3		; syscall 3 = read
	int	0x80		; call read(ebx, ecx, edx)
	dec	edi
	jz	.done
	xor	eax, eax	; clear eax
	mov	al, [ecx]
	jz	.done
	inc	ecx
	jmp	.loop

.done:
	pop	edi		;restor ebx, edi
	pop	ebx
	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret




l_write:
	push ebp		; save callers frame pointer
	mov ebp, esp		; setup internal frame pointer

	push	ebx		;save ebx

	mov	edx, [ebp + 16]	; arg3 - int len
	mov	ecx, [ebp + 12]	; arg2 - char *buf
	mov	ebx, [ebp + 8]	; arg1 - int fd
	mov	eax, 4			; syscall 4 = write
	int	0x80			; call write(ebx, ecx, edx)

	pop	ebx		; restor ebx

	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret



l_exit:
	mov	ebx, [esp + 4]
	pop	ecx
	mov	eax, 1
	int	0x80
