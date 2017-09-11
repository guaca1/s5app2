/*
 * main.c
 */

#include <stdio.h>

#include "liste.h"

//Fonction Asm
void TaMEre();
int SubEntierNonSigne32bits(unsigned int* TabIntNoS);
int SubEntierSigne32(int* TabIntS);
double SubFlottant64bits(double* TabDouble);
unsigned int DivIncrementation(unsigned int* TabIntNoS);
unsigned int DivSubc(unsigned int* TabIntNoS);
float DivFlottant32bits(float* TabFloat);
long long MpyEntierSigneOp32bitsRes64bits(int* TabIntS);
long long MpyfractionnaireOp32bitsRes64bits_Q724_Q1516(int* TabIntS);
void EncrypterDonnees(int* Tab);


void testSub()
{
    unsigned int TabIntNoS[2] = {10000, 5000};
    unsigned int result = SubEntierNonSigne32bits(TabIntNoS);

    int TabIntS[2] = {0x80000000, 1};
    int result2 = SubEntierSigne32(TabIntS);

    double TabDouble[2] = {-500, 1};
    double result3 = SubFlottant64bits(TabDouble);
}

void testDiv()
{
    unsigned int TabIntNoS[2] = {11, 3};
    unsigned int result = DivIncrementation(TabIntNoS);

    float TabFloat[2] = {11, 3};
    float result2 = DivFlottant32bits(TabFloat);
}
void testMpy()
{
    int TabIntS[2] = {-2100000000, 2100000000};
    long long result = MpyfractionnaireOp32bitsRes64bits_Q724_Q1516(TabIntS);

}
int main(void) {
    /*
	int liste[3];
    obtenirType(&liste[0]);
    obtenirFormat(&liste[1]);
    obtenirOperation(&liste[2]);

    printf("%d", liste[0]);
    printf("%d", liste[1]);
    printf("%d", liste[2]);*/
    //testSub();
    testDiv();
    //testMpy();
	return 0;
}

