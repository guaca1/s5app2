	.def _DivIncrementation
	.def _DivSubc
	.def _DivFlottant32bits


_DivIncrementation:
; TODO : Faire en sorte qu'une valeur avec un MSB de 1 fonctionne (E.g 0xFFFFFFFF)
	.asmfunc

	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4
	CMPEQ A8, 0, A1
	[A1] MVKL 0, A4
	[A1] MVKH 0, A4
	[A1] B ENDDIV1
	NOP 5

	; Shift the denominator to the left so its MSB is aligned with the numerator's MSB
	LMBD 1, A6, A7
	LMBD 1, A8, A9
	SUB A9, A7, A9
	SHL A8, A9, A10
	ADD A9, 1, A9
	MV A9, B1

	MVKL 0, A4
	MVKH 0, A4

LOOPDIV1:
	SUB B1, 1, B1
	CMPLTU A6, A10, A2
	SHL A4, 1, A4
	[!A2] SUBU A6, A10, A7:A6
	[!A2] OR A4, 1, A4
	SHRU A10, 1, A10
	[B1] B LOOPDIV1
	NOP 5

	SHL A6, 1, A0
	CMPGTU A0, A8, A2
	[A2] ADD A4, 1, A4

ENDDIV1:
	B B3
	NOP 5
	.endasmfunc

_DivSubc:
; TODO : Faire en sorte qu'une valeur avec un MSB de 1 fonctionne (E.g 0xFFFFFFFF)
	.asmfunc

	; Load the two operands
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4

	; if the denominator is 0, return 0
	CMPEQ A8, 0, A1
	[A1] MVKL 0, A4
	[A1] MVKH 0, A4
	[A1] B ENDDIV2
	NOP 5

	; Shift the denominator to the left so its MSB is aligned with the numerator's MSB
	LMBD 1, A6, A7
	LMBD 1, A8, A9
	SUB A9, A7, A9
	SHL A8, A9, A10
	ADD A9, 1, A9
	MV A9, B1

; Substract and shift until the division is over (B1 == 0)
LOOPDIV2:
	SUBC A6, A10, A6
	SUB B1, 1, B1
	[B1] B LOOPDIV2
	NOP 5


	SHL A9, 5, A10	; The right part corresponds to the result
	SET A10, 0, 4, A10 ; 5bit value of 31, so that all the left most bits will be cleared
	CLR A6, A10, A4 ; Clear bits between 31 and A9's value, so that only the result of the division remains

	SHRU A6, A9, A0 ; The left part corresponds to the remaining value
	SHL A0, 1, A0; Multiply it by 2
	CMPGTU A0, A8, A2 ; if the left part x2 is greater that the denominator, then we add 1 to the result
	[A2] ADD A4, 1, A4

ENDDIV2:
	B B3
	NOP 5
	.endasmfunc



_DivFlottant32bits:
	.asmfunc

	; Load the two operands
	LDW *A4++, A6
	NOP 4
	LDW *A4, A8
	NOP 4

	RCPSP A8, A8
	NOP 1
	MPYSP A8, A6, A4
	NOP 3

	B B3
	NOP 5
	.endasmfunc
