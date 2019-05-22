section .bss
space: 
	.size resb 4096
	.end resb 1

section .text
global _ft_itoa_base
extern _ft_strdup

_ft_itoa_base:
	push r11						; preserving rsi
	lea r11, [rel space.end]		; area to store msg, uses end and writes back
	sub r11, 1
	push rdx
	push rbx
	mov rbx, 0						; setting to 1 for checking neg
	mov eax, edi
	cmp eax, 0
	jnl converting
	
negative:
	mov rbx, 1						; set neg
	neg eax							; reverting neg

converting:
	mov edx, 0						; set edx with value
	mov ecx, esi					; base
	div ecx							; dividing by 10
	add edx, 48						; turning remainder into ascii
	cmp edx, 57
	jle copybyte
	add edx, 7						; moving out of symbol to char

copybyte:
	mov byte [r11], dl				; moving the value into memory

movepointer:
	cmp eax, 0						; making sure that value is not 0
	je checkifnegative
	sub r11, 1						; move pointer up by 1
	jmp converting

checkifnegative:
	cmp esi, 10						; only affects base 10
	jne exiting
	cmp rbx, 1
	jne exiting
	sub r11, 1
	mov byte [r11], 45				; adding neg

exiting:
	mov rdi, r11					; moving pointer to rdi for strdup
	call _ft_strdup					; strdup it and return it
	pop rbx
	pop rdx
	pop r11							; put back r11
	ret

; rdi 1st <--- integer being passed in
; rsi 2nd <--- lea pointer to buffer to write stuff in
; rdx 3rd <--- width for div
; rcx 4th
; rax return val
