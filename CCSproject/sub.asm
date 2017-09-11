	.def _SubEntierNonSigne32bits
	.def _SubEntierSigne32bits
	.def _SubFlottant64bits

_SubEntierNonSigne32bits:
	.asmfunc

	LDW *A4++, A6
	NOP 4
	LDW *A4, A8
	NOP 4

	CMPLTU A6, A8, A1
	[!A1] SUBU A6, A8, A5:A4
	[A1]  MVK 0, A4

	 B B3
	 NOP 5
	 .endasmfunc


_SubEntierSigne32bits:
	.asmfunc

	MVKL 0x0000FDFF, B7
	MVKL 0x0000FDFF, B7

	LDW *A4++, A6
	NOP 4
	LDW *A4, A8
	NOP 4

	SSUB A6, A8, A4
	MVC CSR, B5
	AND B5, B7, B5
	MVC B5, CSR


	 B B3
	 NOP 5
	 .endasmfunc

_SubFlottant64bits:
	.asmfunc

	LDDW *A4++, A7:A6
	NOP 4
	LDDW *A4, A9:A8
	NOP 4

	SUBDP A7:A6, A9:A8, A5:A4
	NOP 6

	 B B3
	 NOP 5
	 .endasmfunc
