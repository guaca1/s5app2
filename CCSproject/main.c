/*
 * main.c
 */

#include <stdio.h>

#include "liste.h"
#include "operande.h"

//Fonction Asm
void TaMEre();



int main(void) {
    while(1)
    {
        int liste[3];
        unsigned int TabIntNoS[2];
        int TabIntS[2];
        float TabFloat[2];
        double TabDouble[2];
        int TabDonnees[8];
        obtenirType(&liste[0]);
        obtenirFormat(&liste[1]);
        obtenirOperation(&liste[2]);
        analyserListe(liste, TabIntNoS, TabIntS, TabFloat, TabDouble, TabDonnees);
        printf("\n");
    }
	return 0;
}
