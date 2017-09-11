/*
 * operande.c
 *
 *  Created on: Sep 11, 2017
 *      Author: Guacamole
 */


#include "operande.h"
#include "protoAss.h"

void choisirOperandesIntNoS(unsigned int* TabIntNoS)
{
    printf("quels sont les valeurs à traiter");
    scanf("%u", &TabIntNoS[0]);
    scanf("%u", &TabIntNoS[1]);

}
void choisirOperandesIntS(int* TabIntS)
{
    printf("quels sont les valeurs à traiter");
    scanf("%d", &TabIntS[0]);
    scanf("%d", &TabIntS[1]);
}

void choisirOperandesFloat(float* TabFloat)
{
    printf("quelles sont les valeurs à traiter");
    scanf("%f", &TabFloat[0]);
    scanf("%f", &TabFloat[1]);
}

