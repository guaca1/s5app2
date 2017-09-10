/*
 * main.c
 */

#include <stdio.h>

#include "liste.h"

//Fonction Asm
void TaMEre();



int main(void) {
	int liste[3];
    obtenirType(&liste[0]);
    obtenirFormat(&liste[1]);
    obtenirOperation(&liste[2]);
    int value = convertirListe(&liste[0], &liste[1]);

/*    printf("%d", value);
    printf("%d", liste[0]);
    printf("%d", liste[1]);
    printf("%d", liste[2]);*/

	return 0;
}
