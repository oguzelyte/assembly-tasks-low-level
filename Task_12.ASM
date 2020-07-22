; ----- EXAMPLE 5 ------- CHARACTER INPUT OUTPUT --------------------------

; --------------------------------------------------------------
;  Input key presses from the keyboard until Enter is pressed.
; --------------------------------------------------------------
	CLO		; Close unwanted windows.
        MOV BL,C0       ; Move value C0 to BL.
Rep:
	IN	00	; Wait for key press - Store it in AL.
        MOV [BL],AL     ; Copy AL to the address BL points to.
        INC BL          ; Increment BL.
	CMP	AL,0D	; Was it the Enter key? (ASCII 0D)
	JNZ	Rep	; No - jump back.  Yes - end.

END
; --------------------------------------------------------------
