
; ----- EXAMPLE 2 ------- HEXADECIMAL --------------------------

; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.
Start:
			; Turn off all the traffic lights.
	MOV AL,90	; Copy 10010000 into the AL register (the red lights).
	OUT 01		; Send AL to Port One (The traffic lights).
        NOP             ; Short amount of time for both lights to be red.
			
	MOV AL,98	; Copy 10011000 into the AL register.
        OUT 01          ; Send AL to Port One (The traffic lights).

        MOV AL,84       ; Copy 10000100 into the AL register.
        OUT 01		; Send AL to Port One (The traffic lights).

        MOV AL,88       ; Copy 10001000 into the AL register.
        OUT 01		; Send AL to Port One (The traffic lights).
        
        MOV AL,90	; Copy 10010000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
        NOP             ; Short amount of time for both lights to be red.

        MOV AL,D0       ; Copy 11010000 into the AL register. 
        OUT 01		; Send AL to Port One (The traffic lights).

        MOV AL,30       ; Copy 00110000 into the AL register.
        OUT 01		; Send AL to Port One (The traffic lights).

        MOV AL,50       ; Copy 01010000 into the AL register.
        OUT 01		; Send AL to Port One (The traffic lights).

	JMP Start	; Jump back to the start.
	END		; Program ends.
	
; ===== Program Ends ==========================================