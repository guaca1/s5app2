	.def _DivIncrementation
	.def _DivSubc
	.def _DivFlottant32bits

; div.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    unsigned int DivIncrementation(unsigned int* TabIntNoS);
;
; DESCRIPTION :
;    Division de deux entiers non signes par incrementation. Un arrondissement est effectue si le resultat est une fraction
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit non signes a diviser
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la division sur 32-bit en valeur entiere non signee

_DivIncrementation:
	.asmfunc

	; Load the data
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4
	MV A8, A1
	[!A1] ZERO A4
	[!A1] B ENDDIV1
	NOP 5

	CMPGT A8, A6, A1 ;If the denominator is greater than the numerator, we can skip to the remain calculation part
	[A1] ZERO A4
	[A1] MV A6, A0
	[A1] B CHECKREMAIN2
	NOP 5

	; Shift the denominator to the left so its MSB is aligned with the numerator's MSB
	LMBD 1, A6, A7
	LMBD 1, A8, A9
	SUB A9, A7, A9
	SHL A8, A9, A10
	ADD A9, 1, A9
	MV A9, B1

	ZERO A4

LOOPDIV1:
	SUB B1, 1, B1
	CMPLTU A6, A10, A2
	SHL A4, 1, A4
	[!A2] SUBU A6, A10, A7:A6
	[!A2] OR A4, 1, A4
	SHRU A10, 1, A10
	[B1] B LOOPDIV1
	NOP 5

	; Verify if the remain is bigger than half the denominator
CHECKREMAIN1:
	SHL A6, 1, A0
	CMPGTU A0, A8, A2
	[A2] ADD A4, 1, A4

ENDDIV1:
	B B3
	NOP 5
	.endasmfunc


; div.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    unsigned int DivSubc(unsigned int* TabIntNoS);
;
; DESCRIPTION :
;    Division de deux entiers non signes avec la fonction SUBC. Un arrondissement est effectue si le resultat est une fraction
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit non signes a diviser
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la division sur 32-bit en valeur entiere non signee

_DivSubc:
	.asmfunc

	; Load the two operands
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4

	; if the denominator is 0, return 0
	MV A8, A1
	[!A1] ZERO A4
	[!A1] B ENDDIV2
	NOP 5

	CMPGT A8, A6, A1 ;If the denominator is greater than the numerator, we can skip to the remain calculation part
	[A1] ZERO A4
	[A1] MV A6, A0
	[A1] B CHECKREMAIN2
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
	[B1] SUBC A6, A10, A6
	[B1] SUB B1, 1, B1
	[B1] B LOOPDIV2
	NOP 5


	SHL A9, 5, A10	; The right part corresponds to the result
	SET A10, 0, 4, A10 ; 5bit value of 31, so that all the left most bits will be cleared
	CLR A6, A10, A4 ; Clear bits between 31 and A9's value, so that only the result of the division remains

	SHRU A6, A9, A0 ; The left part corresponds to the remaining value
CHECKREMAIN2:
	SHL A0, 1, A0; Multiply it by 2
	CMPGTU A0, A8, A2 ; if the left part x2 is greater that the denominator, then we add 1 to the result
	[A2] ADD A4, 1, A4

ENDDIV2:
	B B3
	NOP 5
	.endasmfunc


; div.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    float DivFlottant32bits(float* TabFloat);
;
; DESCRIPTION :
;    Division de deux flottants 32 bits. Une multiplication de la reciproque est utilisee.
;
; ENTRÉES :
;    tableau: Tableau des flottants 32-bit a diviser
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la division sur 32-bit en valeur flottante

_DivFlottant32bits:
	.asmfunc

	; Load the two operands
	LDW *A4++, A6
	NOP 4
	LDW *A4, A8
	NOP 4

	RCPSP A8, A8 ;Calculate the inverse of the denominator (1/den)
	NOP 1
	MPYSP A8, A6, A4 ;Mulitply the inverse with the numerator (num/den = num * 1/den)
	NOP 3

	B B3
	NOP 5
	.endasmfunc
