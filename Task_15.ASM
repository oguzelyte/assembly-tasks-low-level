; ----- EXAMPLE 7 ------- Passing Parameters -------------------

; ----- Use Registers to pass parameters into a procedure ------

	MOV	AL,5    ; Move parameter 5 to AL register.
        JMP 	Start	; Jump to "Start" to keep multiplying the result by 2.

	DB	0	; Reserve a byte of RAM at address [05]
Start:
	CALL	20	; Call a procedure at address 20.

; ----- Use RAM locations to pass parameters into a procedure --

	MOV	[05],AL	; Store 3 into address [02]
        CMP     AL,0    ; Check if AL is 0.
        JZ      End     ; If AL is set to 0, jump to "End" to end the program
	JNZ	Start	; Otherwise go back to "Start" and do it again.

; ----- A procedure to double a parameter -------------------------

;	Parameters passed into procedure using registers AL and BL
;	Result returned in AL
;	This method is simple but is no good if there are a 
;	lot of parameters to be passed.

	ORG	20	; Code starts at address [30]

	MUL	AL,2	; Do the multiplication. Result goes into AL.

	RET		; Return from the procedure
End:
; --------------------------------------------------------------
	END
