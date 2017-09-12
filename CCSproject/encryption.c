 /*fonctionsHugo.asm

 Cr�ateur :   Hugo Daniel
 Date :     11 septembre 2017
 Revision :

 PROTOTYPE DE FONCTION :
    int EncrypterDonneesC(int *TabDonnees)

 DESCRIPTION :
    La fonction prend un tableau de 8 donn�es de 32 bits en entr�e et les entrypte dans un tampon
    circulaire a l'aide d'un XOR et d'une clef. Le nombre de fois que les donn�es seront encrypt�
    est d�termin� a l'aide de la variable nbTours.

 ENTR�ES :
    tableau: Tableau de 8 entiers sur 32-bit


 ENTR�ES/SORTIES :


 SORTIES :


 RETOUR :

*/

int EncrypterDonneesC(int *TabDonnees)
{
    int nbDonnees = 0; // Compteur pour le nombre de donn�es dans le tableau
    int nbTours = 3; // Nombre de fois que les donn�es seront encrypt�
    unsigned int clef = 0xFFFFFFFF;

    while(nbTours != 0)
    {
        while(nbDonnees != 8)
        {
            TabDonnees[nbDonnees] = TabDonnees[nbDonnees]^clef; //Encrypte la donn�e avec la clef et un XOR et la remplace dans la m�moire
            nbDonnees++; // Incr�mente jusqu'a 8
        };
        nbDonnees = 0;
        nbTours--; // D�cr�mente le nombre de tours jusqu'a 0
    };
    return 0;
}


