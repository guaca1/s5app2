	.def _EncrypterDonnees

	.data
clef .word 0xFFFFFFFF
nbTours .word 0x00000003
setAMR .word 0x00800080 ;BK1

	.text

; add.asm
;
; Créateur :   HD - DDF - FLF
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    int EncrypterDonnees(int *TabDonnees)
;
; DESCRIPTION :
;    Encrypte des données avec un XOR, le tout dans un tampon circulaire de manière a réencrypter les données
;
; ENTRÉES :
;
;
;
; ENTRÉES/SORTIES :
;		tableau: Tableau des entiers sur 32-bit signe a additionner
;
; SORTIES :
;

_EncrypterDonnees
	.asmfunc

	;Save the context of the AMR
	MVC AMR, B0
	STW B15++[2], B0

	MVKL nbTours,B1
	MVKH nbTours,B1
	LDW *B1,B2
	NOP 4

	MVKL setAMR,A1 ; setAMR = 0x00800080, ou en binaire: Reserved=000000:BK1=00100:BK0=00000:B7:B4=00000000:A7=10:A6:A4=000000
	MVKH setAMR,A1
	LDW *A1,A2 ; Chargement de setAMR dans A2
	NOP 4

	MVC A2,AMR ; Configure BK1 a 00100 donc 32 bytes et le registre circulaire A7 a BK1

	MVKL clef,A2
	MVKH clef,A2
	LDW *A2,A3
	NOP 4

	MV A4, A7 ;Copie l'addresse contenue ds A4 ds A7(buffer circulaire)

LOOPE: ;Loop servant a encrypter
	LDW *A7,A8 ;Load le tableau de donnees
	NOP 4;
	XOR A8,A3,A8 ;encrypte la valeur de A8
	STW A8,*A7++ ;Place la valeur encrypté dans la memoire
	CMPEQ A7, A4, A1
	[A1] SUB B2,1,B2
	[B2] B LOOPE
	NOP 5

	LDW --B15[2], B0
	NOP 4
	MVC B0, AMR

	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc
