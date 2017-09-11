	.def _AddEntierNonSigne32bits
	.def _AddEntierSigne32bits
	.def _AddFractionnaire32bits;_Q7.24_Q15.16
	.def _EncrypterDonnees

	.data

satH .word 0xFFFFFFFF
satL .word 0x00000000
CSRSATCheck .word 0x00000200
setAMR .word 0x00800080 ;BK1
;setAMR .word 0x00040040 ;BK0
clef .word 0xFFFFFFFF
nbTours .word 0x00000003

		.text

; fonctionsHugo.asm
;
; Créateur :   Hugo Daniel
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    int AddEntierNonSigne32bits(int *TabDonnees)
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
;	Resultat de l'addition sur 32-bit en valeur entiere non signee

_AddEntierNonSigne32bits
	.asmfunc


	LDW *A4,A5
	LDW *A4[1],A6
	NOP 4

	ADDU A5,A6,A5:A4


	MVKL satH,A7
	MVKH satH,A7
	LDW *A7,A8
	NOP 4
	MV A5,A1
	[A1] MV A8,A4
	ZERO A5


	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc

; fonctionsHugo.asm
;
; Créateur :   Hugo Daniel
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    int AddEntierSigne32bits(int *TabDonnees)
;
; DESCRIPTION :
;    La fonction prend deux entiers signées sur 32 bits et les additionne
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit signe a additionner
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de l'addition sur 32-bit en valeur entiere signée

_AddEntierSigne32bits
	.asmfunc

	LDW *A4,A5
	LDW *A4[1],A5
	NOP 4

	SADD A5,++A5,A4

	MVKL 0x0000FDFF, B7
	MVKL 0x0000FDFF, B7
	MVC CSR, B5 ; Section qui remet le bit de saturation a 0
	NOP
	AND B5, B7, B5
	MVC B5, CSR


 	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc

; fonctionsHugo.asm
;
; Créateur :   Hugo Daniel
; Date :     10 septembre 2017
; Revision :
;
; PROTOTYPE DE FONCTION :
;    int AddFractionnaire32bits(int *TabDonnees)
;
; DESCRIPTION :
;    La fonction prend des entiers 32-bit. Un en format Q7.24 et l'autre en format Q15.16
;    et ajuste le Q7.24 pour le transformer en Q15.16. Ensuite elle les additionne
;
; ENTRÉES :
;    tableau: Tableau des entiers sur 32-bit non signe a additionner
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;	Resultat de l'addition sur 32-bit en valeur entiere signee

_AddFractionnaire32bits;_Q7.24_Q15.16
	.asmfunc

	LDW *A4++,A5
	NOP 4
	LDW *A4,A6
	NOP 4

	EXT A5,0,8,A7; Decale vers la droite pour convertir le Q7.24 en Q15.16 et fait l'extention de signe

	SADD A7,A6,A4

	MVKL 0x0000FDFF, B7
	MVKL 0x0000FDFF, B7
	MVC CSR, B5 ; Section qui remet le bit de saturation a 0
	NOP
	AND B5, B7, B5
	MVC B5, CSR

	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc

; fonctionsHugo.asm
;
; Créateur :   Hugo Daniel
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
;    tableau: Tableau des entiers sur 32-bit signe a additionner
;
;
; ENTRÉES/SORTIES :
;
;
; SORTIES :
;

_EncrypterDonnees
	.asmfunc

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

LOOPE: ;Loupe servant a encryptre
	LDW *A7,A8 ;Load le tableau de donnees
	NOP 4;
	XOR A8,A3,A8 ;encrypte la valeur de A8
	STW A8,*A7++ ;Place la valeur encrypté dans la memoire
	CMPEQ A7, A4, A1
	[A1] SUB B2,1,B2
	[B2] B LOOPE
	NOP 5

	B B3 ; INDISPENSABLE ; B3 contient l'adresse de retour
    NOP 5
	.endasmfunc


