section .bss
space: 
	.size resb 16
	.end resb 1

section .text
global _ft_itoa
extern _ft_strdup

_ft_itoa:
	push rsi						; preserving rsi
	lea rsi, [rel space.end]		; area to store msg, uses end and writes back
	sub rsi, 1
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
	mov ecx, 10
	div ecx							; dividing by 10
	add edx, 48						; turning remainder into ascii
	mov byte [rsi], dl				; moving the value into memory

movepointer:
	cmp eax, 0						; making sure that value is not 0
	je checkifnegative
	sub rsi, 1						; move pointer up by 1
	jmp converting

checkifnegative:
	cmp rbx, 1
	jne exiting
	sub rsi, 1
	mov byte [rsi], 45				; adding neg

exiting:
	mov rdi, rsi					; moving pointer to rdi for strdup
	call _ft_strdup					; strdup it and return it
	pop rbx
	pop rdx
	pop rsi							; put back rsi
	ret

; rdi 1st <--- integer being passed in
; rsi 2nd <--- lea pointer to buffer to write stuff in
; rdx 3rd <--- width for div
; rcx 4th
; rax return val
