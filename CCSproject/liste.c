/*
 * fonctionC.c
 *
 *  Created on: Sep 7, 2017
 *      Author: Guacamole
*/

#include "liste.h"

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
		obtenirFormat(liste);
	}
}
