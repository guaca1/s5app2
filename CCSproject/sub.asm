	.def _SubEntierNonSigne32bits
	.def _SubEntierSigne32bits
	.def _SubFlottant64bits

_SubEntierNonSigne32bits:
	.asmfunc

	;Load the data from memory
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4

	CMPLTU A6, A8, A1
	[!A1] SUBU A6, A8, A5:A4 ;If operand1 > operand2, make the substraction
	[A1]  MVK 0, A4 ;else, saturate it to 0

	 B B3
	 NOP 5
	 .endasmfunc


_SubEntierSigne32bits:
	.asmfunc

	;Mask that is meant to set the CSR SAT bit to 0
	MVKL 0x0000FDFF, B7
	MVKL 0x0000FDFF, B7

	;Load the data from memory
	LDW *A4, A6
	LDW *A4[1], A8
	NOP 4

	SSUB A6, A8, A4
	MVC CSR, B5 ;Save the CSR's state
	AND B5, B7, B5 ;Apply a mask to set the SAT bit to 0
	MVC B5, CSR


	 B B3
	 NOP 5
	 .endasmfunc

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
