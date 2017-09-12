	.def _MpyEntierNonSigneOp32bitsRes64bits
	.def _MpyEntierSigneOp32bitsRes64bits
	.def _MpyFractionnaireOp32bitsRes64bits_Q724_Q1516
	.def _MpyFlottant64bits


; div.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;   unsigned long long MpyEntierNonSigneOp32bitsRes64bits(unsigned int* TabIntNoS)
;
; DESCRIPTION :
;    Multiplication de deux entiers non signes, avec un resultat sur 64 bits.
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit non signes a multiplier
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la multiplication sur 64-bit en valeur entiere non signee

_MpyEntierNonSigneOp32bitsRes64bits
	.asmfunc

	LDW *A4[1], B4
	LDW *A4, A4
	NOP 4
	MPYU	A4, B4, A10		; LSHW0 * LSHW1
	MPYHLU 	A4, B4, A11 	; MSHW0 * LSHW1
	MPYLHU	A4, B4, A12		; MSHW1 * LSHW0
	MPYHU	A4, B4, A13 	; MSHW1 * MSHW0
	MV A10, A7
	CLR A7, 16, 31, A7		;met les 16 derniers bits dans A7, A7 = 16 lower bits du LSW
	MV A10, B10
	SHR B10, 16, B10		;shift 16 bits vers la droite pour avoir les 16 higher bits de A10
	MV A11, B11
	CLR B11, 16, 31, B11	;clear 16 higher bits de A11
	MV A12, B12
	CLR B12, 16, 31, B12	;clear higher bits de A12
	ADD B10, B11, B10		;Additionne les 16 higher bits de A10 avec 16 lower bits de A11 et A12
	ADD B10, B12, B10
	SHL B10, 16, B10		;shift le resultat de l'addition vers la gauche
	ADD B10, A7, A4			;unifie les 2 parties du LSW de sortie

	MV A13, A7
	CLR A7, 0,15, A7		; prends les 16 upper bits de A13 pour MSW higherbits
	MV A13, B10
	SHL B10, 16, B10		;shift 16 bits vers la gauche pour avoir les 16 lower bits de A13
	MV A11, B11
	CLR B11, 0,15, B11		;clear 16 lower bits de A11
	MV A12, B12
	CLR B12, 0, 15, B12		;clear 16 lower bits de A12
	ADD B10, B11, B10		;Additionne les 16 lower bits de A13 avec 16 higher bits de A11 et A12
	ADD B10, B12, B10
	SHRU B10, 16, B10		;shift le resultat de l'addition vers la droite
	ADD B10, A7, A5			;unifie les 2 parties du MSW de sortie
	NOP 5
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
;   long long MpyEntierSigneOp32bitsRes64bits(int* TabIntS);
;
; DESCRIPTION :
;    Multiplication de deux entiers signes, avec un resultat sur 64 bits.
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit signes a multiplier
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la multiplication sur 64-bit en valeur entiere signee

_MpyEntierSigneOp32bitsRes64bits
	.asmfunc

	; Load the two operands
	LDW *A4++, A6
	NOP 4
	LDW *A4, A8
	NOP 4

	MPYID A6, A8, A5:A4 ;Multipy two 32bits into one 64bits
	NOP 9

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
;   long long MpyFractionnaireOp32bitsRes64bits_Q724_Q1516(int* TabIntS)
;
; DESCRIPTION :
;    Multiplication de deux fractionnaires (Q7.24 et Q15.16) signes, avec un resultat sur 64 bits.
;
; ENTRÉES :
;    tableau: Tableau des fractionnaires en représentation entiere sur 32-bit signes a multiplier (Dans l'ordre : Q7.24 et Q15.16)
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la multiplication sur 64-bit en valeur entiere signee de format Q22.41

_MpyFractionnaireOp32bitsRes64bits_Q724_Q1516
	.asmfunc
	; Load the two operands
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4

	MPYID A6, A8, A5:A4 ;Multipy two 32bits into one 64bits
	NOP 9

	;Shift left by 1
	EXTU A4, 0, 31, A6 ;Extract the MSB of A4, so it is not lost when the shift occurs
	SHL A5, 1, A5
	SHL A4, 1, A4
	ADD A5, A6, A5 ;We add A4's MSB as A5's LSB

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
;   double MpyFlottant64bits(double* TabDouble)
;
; DESCRIPTION :
;    Multiplication de deux flottants à double précision
;
; ENTRÉES :
;    tableau: Tableau des flottants à double precision a multiplier
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la multiplication sur 64-bit en flottant double precision

_MpyFlottant64bits
	.asmfunc

	LDDW *A4, A7:A6
	LDDW *A4[1], A9:A8
	NOP 4

	MPYDP A7:A6, A9:A8, A5:A4 ;Multipy two 64bits
	NOP 9

	.endasmfunc
