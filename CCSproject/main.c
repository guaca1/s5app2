/*
 * main.c
 */

#include <stdio.h>

#include "liste.h"
#include "operande.h"
static int TabDonneesGlobal[8];
#pragma DATA_ALIGN(TabDonneesGlobal, 32)



int main(void) {
    while(1)
    {
        // Initiaslisation des tableaux
        int liste[3];
        unsigned int TabIntNoS[2];
        int TabIntS[2];
        float TabFloat[2];
        double TabDouble[2];

        //Obtenir les donnees d'operation
        obtenirType(&liste[0]);
        obtenirFormat(&liste[1]);
        obtenirOperation(&liste[2]);

        //Fait le travail demande
        analyserListe(liste, TabIntNoS, TabIntS, TabFloat, TabDouble, TabDonneesGlobal);
        printf("\n");
    }
	return 0;
}
