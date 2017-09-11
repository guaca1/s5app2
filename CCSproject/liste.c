/*
 * fonctionC.c
 *
 *  Created on: Sep 7, 2017
 *      Author: Guacamole
*/

#include "liste.h"
#include "operande.h"
#include "protoAss.h"

void obtenirType(int * liste)
{
	printf("Quel est le type de donnée (entrez le numero) :\r\n");
	printf("1. Entier non signé \r\n");
	printf("2. Entier signé \r\n");
	printf("3. Fractionnaire \r\n");
	printf("4. Flottant \r\n");
	scanf("%d", liste);
	
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
	printf("Quel est le format de donnée (entrez le numero) :\r\n");
	printf("1. 16 bits \r\n");
	printf("2. 32 bits \r\n");
	printf("3. 40 bits \r\n");
	printf("4. 64 bits \r\n");
	scanf("%d", liste);
	
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
	printf("Quel est l'opération désirée (entrez le numero) :\r\n");
	printf("1. + \r\n");
	printf("2. - \r\n");
	printf("3. * \r\n");
	printf("4. %%\r\n");
	printf("5. Encrypter \r\n");
	scanf("%d", liste);
	
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
    return(10 * liste[0] + liste[1]);
}

void analyserListe(int* liste, unsigned int *TabIntNoS, int *TabIntS, float *TabFloat)
{
    int choix = convertirListe(liste);
    switch(liste[2])
    {
        case 1:
            if(choix == 12)
            {
                choisirOperandesIntNoS(TabIntNoS);
                unsigned int resultat = AddEntierNonSigne32bits(TabIntNoS);
                printf("Resultat : %u", resultat);
            }
            else if(choix == 22)
            {
                choisirOperandesIntS(TabIntS);
                AddEntierSigne32bits(TabIntS);
            }
            else if(choix == 32)
            {
                //choisirOperandeXXX(ZZZ *tabXXX)
                //addFractionnaire32bits_Q7.24_Q15.16(ZZZ *TabXXX)
            }
            else
            {
                printf("erreur");
            }
            break;
        case 2:
            if(choix == 12)
            {
                choisirOperandesIntNoS(TabIntNoS);
                //subEntierNonSigne32bits(ZZZ *TabXXX)
            }
            else if(choix == 22)
            {
                choisirOperandesIntS(TabIntS);
                //subEntierSigne32bits(ZZZ *TabXXX)
            }
            else if(choix == 44)
            {
                choisirOperandesFloat(TabFloat);
                //subFlottant64bits(ZZZ *TabXXX)
            }
            else
            {
                printf("erreur");
            }
            break;
        case 3:
            if(choix == 12)
            {
                choisirOperandesIntNoS(TabIntNoS);
                //MpyEntierNonSigneOp32bitsRes64bits(ZZZ *TabXXX)
            }
            else if(choix == 22)
            {
                choisirOperandesIntS(TabIntS);
                //MpyEntierSigneOp32bitsRes64bits(ZZZ *TabXXX)
            }
            else if(choix == 32)
            {
                //choisirOperandeXXX(ZZZ *tabXXX)
                //MpyFractionnaireOp32bitsRes64bits_Q7.24_Q15.16(ZZZ *TabXXX)
            }
            else if(choix == 44)
            {
                choisirOperandesFloat(TabFloat);
                //MpyFlottant64bits(ZZZ *TabXXX)
            }
            else
            {
                printf("erreur");
            }
            break;
      //  case 4:

        case 5:
            if(choix == 22)
            {
                choisirOperandesIntS(TabIntS);
                //EncrypterDonnees(int * TabDonnees)
            }
            else
            {
                printf("erreur");
            }
            break;
}
}
