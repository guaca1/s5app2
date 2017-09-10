/*
 * main.c
 */

#include <stdio.h>

#include "liste.h"

//Fonction Asm
void TaMEre();

//Fonction C
void obtenirType(int *liste);
void obtenirFormat(int * liste);

int main(void) {
	int liste[3];
    obtenirType(&liste[0]);
    obtenirFormat(&liste[1]);
    obtenirOperation(&liste[2]);

    printf("%d", liste[0]);
    printf("%d", liste[1]);
    printf("%d", liste[2]);

	return 0;
}
