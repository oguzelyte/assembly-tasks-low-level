; ----- EXAMPLE 5 ------- CHARACTER INPUT OUTPUT --------------------------

; --------------------------------------------------------------
;  Input key presses from the keyboard until Enter is pressed.
; --------------------------------------------------------------
	CLO		; Close unwanted windows.
        MOV     BL,30   ; Move value 30 to BL.
        MOV     CL,C0   ; Move value C0 to CL.
Rep:
	IN	00	; Wait for key press - Store it in AL.
        MOV     [BL],AL ; Copy AL to the address BL points to.
        INC     BL      ; Increment BL.
	CMP	AL,0D	; Was it the Enter key? (ASCII 0D)
	JNZ	Rep	; No - jump back.  Yes - end.

        MOV     BL,30   ; Move the initial value (30) back to BL.
Copy:
        MOV     DL,[BL] ; Move to DL the address BL points to.
        MOV     [CL],DL ; Copy DL to address CL points to.
        INC     BL      ; Increment BL.
        INC     CL      ; Increment CL.
        CMP     DL,0D   ; Was it the Enter key? (ASCII 0D)
        JNZ     Copy    ; No - jump back to "Copy".  Yes - end.

END
; --------------------------------------------------------------
