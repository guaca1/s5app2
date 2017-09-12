	.def _SubEntierNonSigne32bits
	.def _SubEntierSigne32bits
	.def _SubFlottant64bits


; sub.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    int SubEntierNonSigne32bits(unsigned int* TabIntNoS)
;
; DESCRIPTION :
;    La fonction prend des entiers 32-bit non signees en entree et les soustrait.
;	 La soustraction ne s'effectue pas si le résultat est <= 0, mais retourne simplement 0
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit non signe a soustraire
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la soustraction sur 32-bit en valeur entiere non signee

_SubEntierNonSigne32bits:
	.asmfunc

	;Load the data from memory
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4

	CMPLTU A6, A8, A1
	[!A1] SUBU A6, A8, A5:A4 ;If operand1 > operand2, make the substraction
	[A1]  ZERO A4 ;else, saturate it to 0
	[A1]  ZERO A5

	 B B3
	 NOP 5
	 .endasmfunc

; sub.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    int SubEntierSigne32bits(int* TabIntS)
;
; DESCRIPTION :
;    La fonction prend des entiers 32-bit signes en entree et les soustrait. Il y a saturation, mais elle n'est pas gérée (i.e aucun code d'erreur)
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit signe a soustraire
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la soustraction sur 32-bit en valeur entiere signee

_SubEntierSigne32bits:
	.asmfunc


	;Load the data from memory
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4

	SSUB A6, A8, A4

	MVKL 0xFFFFFDFF, B7;Mask that is meant to set the CSR SAT bit to 0
	MVKH 0xFFFFFDFF, B7
	MVC CSR, B5 ;Save the CSR's state
	AND B5, B7, B5 ;Apply a mask to set the SAT bit to 0
	MVC B5, CSR


	 B B3
	 NOP 5
	 .endasmfunc

; sub.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    double SubFlottant64bits(double* TabDouble)
;
; DESCRIPTION :
;    La fonction prend deux flottants à double précision et les soustrait
;
; ENTRÉES :
;    tableau: Tableau des flottants à double précision à additionner
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de la soustraction en flottants à double précision

_SubFlottant64bits:
	.asmfunc

	;Load the data from memory
	LDDW *A4, A7:A6
	LDDW *A4[1], A9:A8
	NOP 4

	SUBDP A7:A6, A9:A8, A5:A4
	NOP 6

	 B B3
	 NOP 5
	 .endasmfunc
