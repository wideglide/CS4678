USE32
section	.data

section	.text

global l_strlen
global l_strcmp
global l_gets

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
	mov edi, [ebp + 8]	; set string1 (arg1)
	repnz scasb		; get scan for (null)
	inc ecx		; get the length
	not ecx		; ecx has count for compare
	mov esi, [epb + 12]	; set string2 (arg2)
	repe cmpsb		; compare the strings
	xor eax, eax		; set eax to zero
	test ecx, ecx		; see if ecx is zero
	jz strcmpret
	inc eax		; return one if not equal

strcmpret:
	pop edi
	pop esi		; restore esi, edi

	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret


l_gets:
	push ebp		; save callers frame pointer
	mov ebp, esp		; setup internal frame pointer

	mov	edx, [ebp + 16]	; arg3 - size_t len
	mov	ecx, [ebp + 12]	; arg2 - char *buf
	mov	ebx, [ebp + 8]	; arg1 - int fd (STDIN)
	mov	eax, 3		; 
	int	0x80		; call read(fd, buffer, 200)


	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret




l_write:
	push ebp		; save callers frame pointer
	mov ebp, esp		; setup internal frame pointer

	mov	esp, ebp	; restore esp
	pop	ebp		; restore caller's fp
	ret



l_exit:
