/*
 * fonctionC.c
 *
 *  Created on: Sep 7, 2017
 *      Author: Guacamole
*/

#include <math.h>
#include "liste.h"
#include "operande.h"
#include "protoAss.h"

void obtenirType(int * liste)
{
    //Menu d'utilisateur
	printf("Quel est le type de donnée (entrez le numero) :\r\n");
	printf("1. Entier non signé \r\n");
	printf("2. Entier signé \r\n");
	printf("3. Fractionnaire \r\n");
	printf("4. Flottant \r\n");
	scanf("%d", liste);
	
	//ecrit la selection
	if (*liste == 1)
	{
		printf("Entier non signé \r\n");
	}
	else if (*liste == 2)
	{
		printf("Entier signé \r\n");
	}
	else if (*liste == 3)
	{
		printf("Fractionnaire \r\n");
	}
	else if (*liste == 4)
	{
		printf("Flottant \r\n");
	}
	else
	{
		printf("Mauvaise entrée\r\n");
		obtenirType(liste);
	}
}

void obtenirFormat(int * liste)
{
    //Menu d'utilisateur
	printf("Quel est le format de donnée (entrez le numero) :\r\n");
	printf("1. 16 bits \r\n");
	printf("2. 32 bits \r\n");
	printf("3. 40 bits \r\n");
	printf("4. 64 bits \r\n");
	scanf("%d", liste);
	
	//ecrit la selection
	if (*liste == 1)
	{
		printf("16 bits \r\n");
	}
	else if (*liste == 2)
	{
		printf("32 bits \r\n");
	}
	else if (*liste == 3)
	{
		printf("40 bits \r\n");
	}
	else if (*liste == 4)
	{
		printf("64 bits \r\n");
	}
	else
	{
		printf("Mauvaise entrée\r\n");
		obtenirFormat(liste);
	}
}

void obtenirOperation(int * liste)
{
    //Menu d'utilisateur
	printf("Quel est l'opération désirée (entrez le numero) :\r\n");
	printf("1. + \r\n");
	printf("2. - \r\n");
	printf("3. * \r\n");
	printf("4. %%\r\n");
	printf("5. Encrypter \r\n");
	scanf("%d", liste);
	
	//ecrit la selection
	if (*liste == 1)
	{
		printf("addition \r\n");
	}
	else if (*liste == 2)
	{
		printf("soustraction \r\n");
	}
	else if (*liste == 3)
	{
		printf("multiplication \r\n");
	}
	else if (*liste == 4)
	{
		printf("division \r\n");
	}
	else if (*liste == 5)
	{
		printf("encryption");
	} 
	else
	{
		printf("Mauvaise entrée\r\n");
		obtenirOperation(liste);
	}
}
int convertirListe(int *liste)
{
    return(10 * liste[0] + liste[1]); // retourne les deux entree sous un entier
}

void analyserListe(int* liste, unsigned int *TabIntNoS, int *TabIntS, float *TabFloat, double *TabDouble, int *TabDonnees)
{
    int choix = convertirListe(liste);
    switch(liste[2])    //switch operation demandee
    {
        case 1:
            if(choix == 12) //unsigned entier 32 bits
            {
                choisirOperandesIntNoS(TabIntNoS);
                unsigned int resultat = AddEntierNonSigne32bits(TabIntNoS);
                printf("Resultat : %u\r\n", resultat);
            }
            else if(choix == 22)    //entier 32 bits
            {
                choisirOperandesIntS(TabIntS);
                int resultat = AddEntierSigne32bits(TabIntS);
                printf("Resultat : %d\r\n", resultat);
            }
            else if(choix == 32)    //fractionnaire 32 bits
            {
                choisirOperandes_Q724_Q1516(TabIntS);
                int resultat = AddFractionnaire32bits_Q724_Q1516(TabIntS);
                float resultatFrac = resultat / pow(2, 16);
                printf("Resultat : %f\r\n", resultatFrac);
                //TODO : Faire en sorte qu'il y ait une sélection Q7.24 ou Q15.16 pour avoir la plus grande précision
            }
            else
            {
                printf("erreur\r\n");
            }
            break;
        case 2:
            if(choix == 12) //unsigned entier 32 bits
            {
                choisirOperandesIntNoS(TabIntNoS);
                unsigned int resultat = SubEntierNonSigne32bits(TabIntNoS);
                printf("Resultat : %u\r\n", resultat);
            }
            else if(choix == 22)    //entier 32 bits
            {
                choisirOperandesIntS(TabIntS);
                int resultat = SubEntierSigne32bits(TabIntS);
                printf("Resultat : %d", resultat);
            }
            else if(choix == 44)    //flottant 64 bits
            {
                choisirOperandesDouble(TabDouble);
                double resultat = SubFlottant64bits(TabDouble);
                printf("Resultat : %lf", resultat);
            }
            else
            {
                printf("erreur");
            }
            break;
        case 3:
            if(choix == 12) ////unsigned entier 32 bits
            {
                choisirOperandesIntNoS(TabIntNoS);
                unsigned long long resultat = MpyEntierNonSigneOp32bitsRes64bits(TabIntNoS);
                printf("Resultat : %llu", resultat);
            }
            else if(choix == 22)    //entier 32 bits
            {
                choisirOperandesIntS(TabIntS);
                int resultat = MpyEntierSigneOp32bitsRes64bits(TabIntS);
                printf("Resultat : %d\r\n", resultat);
            }
            else if(choix == 32)    //fractionnaire 32 bits
            {
                choisirOperandes_Q724_Q1516(TabIntS);
                long long resultat = MpyFractionnaireOp32bitsRes64bits_Q724_Q1516(TabIntS);
                double resultatFrac = resultat / pow(2, 41);
                printf("Resultat : %lf\r\n", resultatFrac);
            }
            else if(choix == 44)    //flottant 64 bits
            {
                choisirOperandesDouble(TabDouble);
                double resultat = MpyFlottant64bits(TabDouble);
                printf("Resultat : %lf\r\n", resultat);
            }
            else
            {
                printf("erreur\r\n");
            }
            break;
        case 4:
            if(choix == 12) //unsigned entier 32 bits
            {
                choisirOperandesIntNoS(TabIntNoS);
                unsigned int resultatInc = DivIncrementation(TabIntNoS);
                unsigned int resultatSub = DivSubc(TabIntNoS);
                printf("Resultat (Incrementation) : %u\r\n", resultatInc);
                printf("Resultat (Subc) : %u\r\n", resultatSub);
            }
            else if(choix == 42)    //flottant 32 bits
            {
                choisirOperandesFloat(TabFloat);
                float resultat = DivFlottant32bits(TabFloat);
                printf("Resultat : %f\r\n", resultat);
            }
            else
            {
                printf("erreur\r\n");
            }
            break;

        case 5:
            if(choix == 22) //entier 32 bits
            {
                ChoisirDonnees(TabDonnees);
                EncrypterDonnees(TabDonnees);
                printf("Les données ont été encryptées avec succès. Pour avoir accès à vos données, veuillez déposer 1000$ en BitCoins à l'adresse 0x000234F1A98EDC\r\n");
            }
            else
            {
                printf("erreur\r\n");
            }
            break;
    }
}
