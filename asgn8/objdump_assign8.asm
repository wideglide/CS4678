
assign8:     file format elf32-i386


08048810 <frame_dummy>:
 8048810:	push   ebp
 8048811:	mov    ebp,esp
 8048813:	lea    esp,[esp-0x18]
 8048817:	mov    eax,ds:0x8049ce8
 804881c:	test   eax,eax
 804881e:	je     8048832 <frame_dummy+0x22>
 8048820:	mov    eax,0x0
 8048825:	test   eax,eax
 8048827:	je     8048832 <frame_dummy+0x22>
 8048829:	mov    DWORD PTR [esp],0x8049ce8
 8048830:	call   eax
 8048832:	leave  
 8048833:	ret    

08048834 <child_handler>:
 8048834:	push   ebp
 8048835:	mov    ebp,esp
 8048837:	sub    esp,0x28
 804883a:	lea    eax,[ebp-0xc]
 804883d:	mov    DWORD PTR [esp],eax
 8048840:	call   804865c <wait@plt>
 8048845:	leave  
 8048846:	ret    

08048847 <handleClient>:
 8048847:	push   ebp
 8048848:	mov    ebp,esp
 804884a:	sub    esp,0x128
 8048850:	mov    DWORD PTR [esp+0x4],0x8048be4	; mode = "r+"
 8048858:	mov    eax,DWORD PTR [ebp+0x8]			; fd = ebp+8
 804885b:	mov    DWORD PTR [esp],eax
 804885e:	call   804868c <fdopen@plt>				; FILE *fdopen(int fd, const char *mode)
 8048863:	mov    DWORD PTR [ebp-0xc],eax			; result into stream
 8048866:	mov    eax,DWORD PTR [ebp-0xc]
 8048869:	mov    DWORD PTR [esp+0x8],eax			; stream = ebp-12
 804886d:	mov    DWORD PTR [esp+0x4],0x100		; size = 256
 8048875:	lea    eax,[ebp-0x110]
 804887b:	mov    DWORD PTR [esp],eax				; format = ebp-272
 804887e:	call   804862c <fgets@plt>				; char *fgets(char *s, int size, FILE *stream)
 8048883:	mov    DWORD PTR [ebp-0x10],eax			; result into s1
 8048886:	cmp    DWORD PTR [ebp-0x10],0x0
 804888a:	je     80488c2 <handleClient+0x7b>
 804888c:	lea    eax,[ebp-0x110]
 8048892:	mov    DWORD PTR [esp+0x4],eax			; format = ebp-272 
 8048896:	mov    eax,DWORD PTR [ebp-0xc]			; stream = ebp-12
 8048899:	mov    DWORD PTR [esp],eax
 804889c:	call   804871c <fprintf@plt>			; int fprintf(FILE *stream, const char *format, ...)
 80488a1:	mov    DWORD PTR [esp+0x8],0x4			; len = 4
 80488a9:	mov    DWORD PTR [esp+0x4],0x8048be7	; s2 = "quit"
 80488b1:	mov    eax,DWORD PTR [ebp-0x10]			; s1 = ebp-16
 80488b4:	mov    DWORD PTR [esp],eax
 80488b7:	call   804874c <strncmp@plt>
 80488bc:	test   eax,eax
 80488be:	jne    8048866 <handleClient+0x1f>
 80488c0:	jmp    80488c3 <handleClient+0x7c>
 80488c2:	nop
 80488c3:	leave  
 80488c4:	ret    

080488c5 <main>:
 80488c5:	push   ebp
 80488c6:	mov    ebp,esp
 80488c8:	and    esp,0xfffffff0
 80488cb:	sub    esp,0x60
 80488ce:	mov    DWORD PTR [esp+0x28],0x1
 80488d6:	mov    DWORD PTR [esp+0x5c],0x0
 80488de:	mov    DWORD PTR [esp+0x58],0x0
 80488e6:	mov    DWORD PTR [esp+0x24],0x10
 80488ee:	mov    DWORD PTR [esp+0x4],0x8048834
 80488f6:	mov    DWORD PTR [esp],0x11
 80488fd:	call   80485fc <signal@plt>
 8048902:	mov    DWORD PTR [esp+0x8],0x10
 804890a:	mov    DWORD PTR [esp+0x4],0x0
 8048912:	lea    eax,[esp+0x3c]
 8048916:	mov    DWORD PTR [esp],eax
 8048919:	call   804863c <memset@plt>
 804891e:	mov    WORD PTR [esp+0x3c],0x2
 8048925:	mov    DWORD PTR [esp],0x115c
 804892c:	call   804866c <htons@plt>
 8048931:	mov    WORD PTR [esp+0x3e],ax
 8048936:	mov    DWORD PTR [esp+0x8],0x0
 804893e:	mov    DWORD PTR [esp+0x4],0x1
 8048946:	mov    DWORD PTR [esp],0x2
 804894d:	call   80486cc <socket@plt>
 8048952:	mov    DWORD PTR [esp+0x54],eax
 8048956:	cmp    DWORD PTR [esp+0x54],0xffffffff
 804895b:	jne    8048975 <main+0xb0>
 804895d:	mov    DWORD PTR [esp],0x8048bec
 8048964:	call   804867c <perror@plt>
 8048969:	mov    DWORD PTR [esp],0x1
 8048970:	call   804876c <exit@plt>
 8048975:	mov    DWORD PTR [esp+0x10],0x4
 804897d:	lea    eax,[esp+0x28]
 8048981:	mov    DWORD PTR [esp+0xc],eax
 8048985:	mov    DWORD PTR [esp+0x8],0x2
 804898d:	mov    DWORD PTR [esp+0x4],0x1
 8048995:	mov    eax,DWORD PTR [esp+0x54]
 8048999:	mov    DWORD PTR [esp],eax
 804899c:	call   804873c <setsockopt@plt>
 80489a1:	lea    eax,[esp+0x3c]
 80489a5:	mov    DWORD PTR [esp+0x8],0x10
 80489ad:	mov    DWORD PTR [esp+0x4],eax
 80489b1:	mov    eax,DWORD PTR [esp+0x54]
 80489b5:	mov    DWORD PTR [esp],eax
 80489b8:	call   80486ec <bind@plt>
 80489bd:	test   eax,eax
 80489bf:	je     80489d9 <main+0x114>
 80489c1:	mov    DWORD PTR [esp],0x8048bf3
 80489c8:	call   804867c <perror@plt>
 80489cd:	mov    DWORD PTR [esp],0x1
 80489d4:	call   804876c <exit@plt>
 80489d9:	mov    DWORD PTR [esp+0x4],0xa
 80489e1:	mov    eax,DWORD PTR [esp+0x54]
 80489e5:	mov    DWORD PTR [esp],eax
 80489e8:	call   804861c <listen@plt>
 80489ed:	test   eax,eax
 80489ef:	je     8048a09 <main+0x144>
 80489f1:	mov    DWORD PTR [esp],0x8048bf8
 80489f8:	call   804867c <perror@plt>
 80489fd:	mov    DWORD PTR [esp],0x1
 8048a04:	call   804876c <exit@plt>
 8048a09:	mov    DWORD PTR [esp],0x8048bff
 8048a10:	call   804875c <getpwnam@plt>
 8048a15:	mov    DWORD PTR [esp+0x50],eax
 8048a19:	cmp    DWORD PTR [esp+0x50],0x0
 8048a1e:	je     8048a7f <main+0x1ba>
 8048a20:	mov    eax,DWORD PTR [esp+0x50]
 8048a24:	mov    eax,DWORD PTR [eax+0x8]
 8048a27:	mov    DWORD PTR [esp+0x5c],eax
 8048a2b:	mov    eax,DWORD PTR [esp+0x50]
 8048a2f:	mov    eax,DWORD PTR [eax+0xc]
 8048a32:	mov    DWORD PTR [esp+0x58],eax
 8048a36:	mov    eax,DWORD PTR [esp+0x50]
 8048a3a:	mov    eax,DWORD PTR [eax+0x14]
 8048a3d:	mov    DWORD PTR [esp],eax
 8048a40:	call   80486dc <chdir@plt>
 8048a45:	mov    eax,DWORD PTR [esp+0x5c]
 8048a49:	mov    DWORD PTR [esp+0x8],eax
 8048a4d:	mov    eax,DWORD PTR [esp+0x5c]
 8048a51:	mov    DWORD PTR [esp+0x4],eax
 8048a55:	mov    eax,DWORD PTR [esp+0x5c]
 8048a59:	mov    DWORD PTR [esp],eax
 8048a5c:	call   804869c <setresuid@plt>
 8048a61:	mov    eax,DWORD PTR [esp+0x58]
 8048a65:	mov    DWORD PTR [esp+0x8],eax
 8048a69:	mov    eax,DWORD PTR [esp+0x58]
 8048a6d:	mov    DWORD PTR [esp+0x4],eax
 8048a71:	mov    eax,DWORD PTR [esp+0x58]
 8048a75:	mov    DWORD PTR [esp],eax
 8048a78:	call   80486ac <setresgid@plt>
 8048a7d:	jmp    8048aa7 <main+0x1e2>
 8048a7f:	mov    eax,ds:0x8049e2c				; STDERR
 8048a84:	mov    edx,eax
 8048a86:	mov    eax,0x8048c08				; ptr = "CAUTION: Unable to drop privs to user cs4678\n"
 8048a8b:	mov    DWORD PTR [esp+0xc],edx		; stream = stderr
 8048a8f:	mov    DWORD PTR [esp+0x8],0x2d		; nmemb = 45
 8048a97:	mov    DWORD PTR [esp+0x4],0x1		; size = 1
 8048a9f:	mov    DWORD PTR [esp],eax			; ptr
 8048aa2:	call   804870c <fwrite@plt>			; size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream)
 8048aa7:	mov    DWORD PTR [esp+0x4],0x0
 8048aaf:	mov    DWORD PTR [esp],0x1
 8048ab6:	call   80485ec <daemon@plt>
 8048abb:	lea    edx,[esp+0x24]
 8048abf:	lea    eax,[esp+0x2c]
 8048ac3:	mov    DWORD PTR [esp+0x8],edx		; addrlen = * esp+36
 8048ac7:	mov    DWORD PTR [esp+0x4],eax		; addr = *esp+44
 8048acb:	mov    eax,DWORD PTR [esp+0x54]		; socket = esp+84
 8048acf:	mov    DWORD PTR [esp],eax
 8048ad2:	call   80486bc <accept@plt>			; int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen)
 8048ad7:	mov    DWORD PTR [esp+0x4c],eax		; store fd 
 8048adb:	call   804872c <fork@plt>
 8048ae0:	test   eax,eax
 8048ae2:	je     8048af2 <main+0x22d>
 8048ae4:	mov    eax,DWORD PTR [esp+0x4c]
 8048ae8:	mov    DWORD PTR [esp],eax
 8048aeb:	call   80486fc <close@plt>
 8048af0:	jmp    8048abb <main+0x1f6>
 8048af2:	mov    eax,DWORD PTR [esp+0x54]
 8048af6:	mov    DWORD PTR [esp],eax
 8048af9:	call   80486fc <close@plt>
 8048afe:	lea    eax,[esp+0x2c]
 8048b02:	mov    DWORD PTR [esp+0x4],eax
 8048b06:	mov    eax,DWORD PTR [esp+0x4c]		; fd = esp+76
 8048b0a:	mov    DWORD PTR [esp],eax
 8048b0d:	call   8048847 <handleClient>
 8048b12:	nop
 8048b13:	leave  
 8048b14:	ret    
 8048b15:	nop
 8048b16:	nop
 8048b17:	nop
 8048b18:	nop
 8048b19:	nop
 8048b1a:	nop
 8048b1b:	nop
 8048b1c:	nop
 8048b1d:	nop
 8048b1e:	nop
 8048b1f:	nop
