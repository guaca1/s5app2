	.def _MpyEntierNonSigneOp32bitsRes64bits
	.def _MpyEntierSigneOp32bitsRes64bits
	.def _MpyfractionnaireOp32bitsRes64bits_Q724_Q1516
	.def _MpyFlottant64bits



	.data


_MpyEntierNonSigneOp32bitsRes64bits
	.asmfunc


	MPYU	A4, B4, A10		; LSHW0 * LSHW1
	MPYHLU 	A4, B4, A11 	; MSHW0 * LSHW1
	MPYLHU	A4, B4, A12		; MSHW1 * LSHW0
	MPYHU	A4, B4, A13 	; MSHW1 * MSHW0
	MV A10, A7
	CLR A7, 16, 31, A7
	MV A10, B10
	SHR B10, 16, B10
	MV A11, B11
	CLR B11, 16, 31, B11
	MV A12, B12
	CLR B12, 16, 31, B12
	ADD B10, B11, B10
	ADD B10, B12, B10
	SHL B10, 16, B10
	ADD B10, A7, A4

	MV A13, A7
	CLR A7, 0,15, A7
	MV A13, B10
	SHL B10, 16, B10
	MV A11, B11
	CLR B11, 0,15, B11
	MV A12, B12
	CLR B12, 0, 15, B12
	ADD B10, B11, B10
	ADD B10, B12, B10
	SHRU B10, 16, B10
	ADD B10, A7, A5
	NOP 5
	B B3
	NOP 5
	 .endasmfunc

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

_MpyfractionnaireOp32bitsRes64bits_Q724_Q1516
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

_MpyFlottant64bits
	.asmfunc

	.endasmfunc
