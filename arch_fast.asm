.model	small
.8086
.stack 100h
.data
l	db	'length = $'
w	db	'width = $'
h	db	'height = $'
.code
	extrn	GetDec : NEAR, PutDec : NEAR
fast	proc

		mov	ax, @data
		mov ds, ax

		mov dx, offset l
		mov	ah, 9h
		int	21h
		call	GetDec
		mov ax, dx

		mov dx, offset w
		mov ah, 9h
		int 21h
		call	GetDec
		mov ax, cx

		mov dx, offset h
		mov ah, 9h
		int 21h
		call	GetDec
		
		mov	bx, dx
		mul bx

		push dx
		push ax

		mov	bx, cx
		pop ax

		mul bx

		pop cx

		push dx
		push ax

		mov ax, cx

		mul bx

		push dx
		push ax

		pop ax
		pop bx
		pop cx

		add bx, cx

		pop dx

		adc dx, 0

		mov cx, bx
		mov bx, ax

		mov ax, dx
		call PutDec

		mov	ax, cx
		call PutDec

		mov ax, bx
		call PutDec

		mov ah, 4ch
		int 21h

fast	endp
		end	fast
