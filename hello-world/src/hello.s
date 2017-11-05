section .text
	global	_start

_start:
	mov	edx,	len	; strlen(msg)
	mov	ecx,	msg	; &msg
	mov	ebx,	1	; stdout
	mov	eax,	4	; write()
	int	0x80
    
	mov	ebx,	0	; return value
	mov	eax,	1	; exit()
	int	0x80

section .data
	msg	db	"Hello World!", 0xA	; line feed
	len	equ	$ - msg
