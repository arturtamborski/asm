section .text
	global	_start

_start:
	mov	edx,	0	; envp
	mov 	ecx, 	0	; argv
	mov	ebx,	msg	; &msg
	mov	eax,	11	; execve()
	int	0x80

section .data
	msg	db	"/bin/sh"
