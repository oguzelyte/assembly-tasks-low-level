; ----- EXAMPLE 9 ------- Text I/O -------------------

; --------------------------------------------------------------
; A program to read in a string of text and store it in RAM.
; The end of text will be labelled with ASCII code zero/null.
; --------------------------------------------------------------
; THE MAIN PROGRAM
	MOV	BL,90	; [90] is the address where the text will
			; be stored. The procedure uses this.

	CALL	10	; The procedure at [10] reads in text and
			; places it starting from the address
			; in BL.

	CALL	2F	; The procedure at [2F] converts uppercase
                        ; letters to lowercase and leaves other 
                        ; characters unchanged.

	CALL	60	; The procedure at [60] displays the text on
                        ; the VDU display until character 00.
        JMP     End     ; Ends the program.
                
; --------------------------------------------------------------
; A PROCEDURE TO READ IN THE TEXT
	ORG	10	; Code starts from address [10]

	PUSH	AL	; Save AL onto the stack
	PUSH	BL	; Save BL onto the stack
	PUSHF		; Save the CPU flags onto the stack

Rep:
	IN	00	; Input from port 00 (keyboard)
	CMP	AL,0D	; Was key press the Enter key?
	JZ	Stop	; If yes then jump to Stop
	MOV	[BL],AL	; Copy keypress to RAM at position [BL]
	INC	BL	; BL points to the next location.
	JMP	Rep	; Jump back to get the next character

Stop:
	MOV	AL,0	; This is the NULL end marker
	MOV	[BL],AL	; Copy NULL character to this position.

	POPF		; Restore flags from the stack
	POP	BL	; Restore BL from the stack
        POP	AL     	; Restore AL from the stack

	RET		; Return from the procedure.
; --------------------------------------------------------------
; A PROCEDURE TO CONVERT UPPERCASE CHARACTERS TO LOWERCASE
        
        ORG	2F	; Code starts from address [2F]  
        PUSH	AL	; Save AL onto the stack
	PUSH	BL	; Save BL onto the stack
	PUSHF		; Save the CPU flags onto the stack     
 
Continue:
        MOV     AL,[BL] ; Save value in address BL to register AL
        CMP     AL,5A   ; Check if character is before 'Z' in hexadecimal
        JS      Possible; If so, it's possibly an uppercase letter
        JMP     Normal  ; If not, it's an arbitrary character
Possible:
        CMP     AL,41   ; Check if character is above 'A' in hexadecimal
        JS      Normal  ; If not, it's an arbitrary character
        JMP     Uppercase ; If it is, it's an uppercase letter
Uppercase:
	OR      AL,20   ; 0010 0000 binary sequence makes the letter lowercase
        MOV     [BL],AL ; Change the value of uppercase letter to the new lowercase one
        JMP     Normal  ; Continue to read values
Normal:
        INC     BL	; Increment the BL register
        CMP     AL,00   ; Check if there are no more values to read in
        JNZ     Continue; If there are, restart the sequence from "Continue"
        
        
        POPF		; Restore flags from the stack
	POP	BL	; Restore BL from the stack
        POP	AL     	; Restore AL from the stack
 	
       	RET	        ; Return to after last call
; --------------------------------------------------------------
; A PROCEDURE TO DISPLAY TEXT ON THE SIMULATED SCREEN

        ORG     60      ; Code starts from address [60]
        PUSH	AL	; Save AL onto the stack
	PUSH	BL	; Save BL onto the stack
	PUSHF		; Save the CPU flags onto the stack     
        MOV     CL,C0   ; Move value C0 to register CL
Display:
        MOV     AL,[BL] ; Save value in address BL to register AL
        MOV     [CL],AL ; Move the value of AL to be displayed on VDU
        INC     CL      ; Increment the CL register
        INC     BL      ; Increment the BL register
        CMP     AL,00   ; Check if there are any more characters to display
        JNZ     Display ; If there are, repeat the "Display" sequence
        
        POPF		; Restore flags from the stack
	POP	BL	; Restore BL from the stack
        POP	AL     	; Restore AL from the stack
        
        RET             ; Return to after last call	
; --------------------------------------------------------------
End:
	END		; End the program.
; --------------------------------------------------------------