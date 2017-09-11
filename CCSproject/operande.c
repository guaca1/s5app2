/*
 * operande.c
 *
 *  Created on: Sep 11, 2017
 *      Author: Guacamole
 */

#include <math.h>
#include "operande.h"
#include "protoAss.h"


void choisirOperandesIntNoS(unsigned int* TabIntNoS)
{
    printf("Quelles sont les valeurs à traiter");
    scanf("%u", &TabIntNoS[0]);
    scanf("%u", &TabIntNoS[1]);

}
void choisirOperandesIntS(int* TabIntS)
{
    printf("Quelles sont les valeurs à traiter");
    scanf("%d", &TabIntS[0]);
    scanf("%d", &TabIntS[1]);
}

void choisirOperandesFloat(float* TabFloat)
{
    printf("Quelles sont les valeurs à traiter");
    scanf("%f", &TabFloat[0]);
    scanf("%f", &TabFloat[1]);
}

void choisirOperandesDouble(double* TabDouble)
{
    printf("Quelles sont les valeurs à traiter");
    scanf("%lf", &TabDouble[0]);
    scanf("%lf", &TabDouble[1]);
}

void choisirOperandes_Q724_Q1516(int* TabIntS)
{
    printf("Quelles sont les valeurs à traiter");
    float Q724, Q1516;
    scanf("%f", &Q724);
    scanf("%f", &Q1516);
    TabIntS[0] = Q724 * pow(2, 24);
    TabIntS[1] = Q1516 * pow(2, 16);
}

void ChoisirDonnees(int *TabDonnees)
{
    printf("Quelles sont les données à traiter");
    int i;
    for (i = 0; i < 8; i++)
    {
        scanf("%d", TabDonnees + i);
    }
}

