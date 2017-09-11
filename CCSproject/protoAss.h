/*
 * protoAss.h
 *
 *  Created on: Sep 11, 2017
 *      Author: danae
 */

#ifndef PROTOASS_H_
#define PROTOASS_H_

unsigned int AddEntierNonSigne32bits(unsigned int* TabIntNoS);
int AddEntierSigne32bits(int* TabIntS);
int AddFractionnaire32bits_Q724_Q1516(int* TabIntS);
int SubEntierNonSigne32bits(unsigned int* TabIntNoS);
int SubEntierSigne32bits(int* TabIntS);
double SubFlottant64bits(double* TabDouble);
unsigned int DivIncrementation(unsigned int* TabIntNoS);
unsigned int DivSubc(unsigned int* TabIntNoS);
float DivFlottant32bits(float* TabFloat);
unsigned long long MpyEntierNonSigneOp32bitsRes64bits(unsigned int* TabIntNoS);
long long MpyEntierSigneOp32bitsRes64bits(int* TabIntS);
long long MpyFractionnaireOp32bitsRes64bits_Q724_Q1516(int* TabIntS);
double MpyFlottant64bits(double* TabDouble);
void EncrypterDonnees(int* Tab);



#endif /* PROTOASS_H_ */
