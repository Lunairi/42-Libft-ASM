section .text
global _ft_strlen

_ft_strlen: 
	move rax, 0 	; value scasb will find, null is 0
	push rcx 		; pop just incase
	mov rcx, -1 	; set to -1, doesnt matter if signed/unsigned
	repne scasb 	; to scan string until it finds AL (rax)
	mov rax, -2 	; set rax to -2 as smallest string would be -2
	sub rax, rcx 	; take diff and store into return
	pop rcx 		; pop value on stack back into rcx
	ret

; rdi 1st 
; rsi 2nd
; rdx 3rd
; rcx 4th
; rax return val