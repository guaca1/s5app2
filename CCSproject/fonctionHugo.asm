; fonctionsHugo.asm
;
; Créateur :   Hugo Daniel
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    int AddEntierNonSigne32bits(int tableau)
;
; DESCRIPTION :
;    La fonction prend des entiers 32-bit non signees en entree et les additionne. Si il y a overflow, la
;	 fonction doit topper a la valeur maximal ou minimal sans aller dans les negatifs.
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit non signe a additionner
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;
;
; RETOUR :
;    Retourne le resultat de l'addition sur 32-bit en valeur entiere non signee

	.def _AddEntierNonSigne32bits
	.def _AddEntierSigne32bits
	.def _AddFractionnaire32bits_Q724_Q1516
	.def _EncrypterDonnees
;	.def _EncrypterDonneesTest

	.data

satH .word 0xFFFFFFFF
satL .word 0x00000000
CSRSATCheck .word 0x00000200
setAMR .word 0x00800080 ;BK1
;setAMR .word 0x00040040 ;BK0
clef .word 0xFFFFFFFF
nbTours .word 0x00000003
nbInit .word 0x00000008

		.text

_AddEntierNonSigne32bits
	.asmfunc


	LDW *A4,A5
	LDW *A4[1],A6
	NOP 4

	ADDU A5,A6,A5:A4


	MVKL satH,A6
	MVKH satH,A6
	LDW *A6,A7
	NOP 4
	MV A5,A1
	[A1] MV A7,A4
	ZERO A5


	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc

_AddEntierSigne32bits
	.asmfunc

	LDW *A4,A5
	LDW *A4[1],A6
	NOP 4

	MVKL 0x0000FDFF, B7
	MVKH 0x0000FDFF, B7

	SADD A5, A6, A4
	MVC CSR, B5
	AND B5, B7, B5
	MVC B5, CSR


	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc


_AddFractionnaire32bits_Q724_Q1516
	.asmfunc



	LDW *A4,A5
	LDW *A4[1],A6
	NOP 4

	SHR A5,8,A7 ;decale vers la droite pour convertir le Q7.24 en Q15.16

	SADD A7,A6,A4

	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc

_EncrypterDonnees
	.asmfunc

	MVKL nbTours,B1
	MVKH nbTours,B1
	LDW *B1,B2
	NOP 4
	MVKL setAMR,A1
	MVKH setAMR,A1
	LDW *A1,A2
	NOP 4

	MVC A2,AMR ;Set BK1 a 00111 donc 256 bytes donc 8 valeurs de 32 bytes et le registre circulaire A7 a BK1

	MVKL clef,A2
	MVKH clef,A2
	LDW *A2,A3
	NOP 4

	MV A4, A7 ;Copie l'addresse contenue ds A4 ds A7(buffer circulaire)

LOOPE: ;Loupe servant a encryptre
	LDW *A7,A8 ;Load le tableau de donnees
	NOP 4;
	XOR A8,A3,A8 ;encrypte la valeur de A5 et l'enregistre dans A6 pour charger toutes les valeurs a la fin
	STW A8,*A7++ ;Place la valeur encrypté dans la memoire
	CMPEQ A7, A4, A1
	[A1] SUB B2,1,B2
	[B2] B LOOPE
	NOP 5

	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc

;_EncrypterDonneesTest
;	.asmfunc
;
;	MVKL nbTours,B1
;	MVKH nbTours,B1
;	LDW *B1,B2
;	NOP 4
;	MVKL nbInit,B4
;	MVKH nbInit,B4
;	LDW *B4,B1
;	NOP 4
;	MVKL setAMR,A1
;	MVKH setAMR,A1
;	LDW *A1,A2
;	NOP 4
;
;	MVC A2,AMR ;Set BK1 a 00111 donc 256 bytes donc 8 valeurs de 32 bytes et le registre circulaire A7 a BK1
;
;	MVKL clef,A2
;	MVKH clef,A2
;	LDW *A2,A3
;	NOP 4
;
;
;	MV A4, A10 ;Copie l'addresse contenue ds A4 ds A7(buffer circulaire)
;
;LOOPE1: ;Loupe servant a encryptre
;	MV A4, A7 ;Copie l'addresse contenue ds A4 ds A7(buffer circulaire)
;	LDW *A4++,A9
;	NOP 4
;	LDW *A7++,A8 ;Load le tableau de donnees
;	NOP 4
;	XOR A8,A3,A8 ;encrypte la valeur de A5 et l'enregistre dans A6 pour charger toutes les valeurs a la fin
;	STW A8,*A4
;	SUB B1,1,B1
;	[B1] B LOOPE1
;	NOP 5
;
;	SUB B2,1,B2;init = 1 tour
;
;	MV A10, A7 ;Copie l'addresse contenue ds A4 ds A7(buffer circulaire)
;
;LOOPE: ;Loupe servant a encryptre
;	LDW *A7++,A8 ;Load le tableau de donnees
;	NOP 4
;	XOR A8,A3,A8 ;encrypte la valeur de A5 et l'enregistre dans A6 pour charger toutes les valeurs a la fin
;	STW A8,*A4
;	CMPEQ A7, A10, A1
;	[A1] SUB B2,1,B2
;	[B2] B LOOPE
;	NOP 5
;
;	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
;   NOP 5
;	.endasmfunc
