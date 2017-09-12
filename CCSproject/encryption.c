 /*fonctionsHugo.asm

 Créateur :   Hugo Daniel
 Date :     11 septembre 2017
 Revision :

 PROTOTYPE DE FONCTION :
    int EncrypterDonneesC(int *TabDonnees)

 DESCRIPTION :
    La fonction prend un tableau de 8 données de 32 bits en entrée et les entrypte dans un tampon
    circulaire a l'aide d'un XOR et d'une clef. Le nombre de fois que les données seront encrypté
    est déterminé a l'aide de la variable nbTours.

 ENTRÉES :
    tableau: Tableau de 8 entiers sur 32-bit


 ENTRÉES/SORTIES :


 SORTIES :


 RETOUR :

*/

int EncrypterDonneesC(int *TabDonnees)
{
    int nbDonnees = 0; // Compteur pour le nombre de données dans le tableau
    int nbTours = 3; // Nombre de fois que les données seront encrypté
    unsigned int clef = 0xFFFFFFFF;

    while(nbTours != 0)
    {
        while(nbDonnees != 8)
        {
            TabDonnees[nbDonnees] = TabDonnees[nbDonnees]^clef; //Encrypte la donnée avec la clef et un XOR et la remplace dans la mémoire
            nbDonnees++; // Incrémente jusqu'a 8
        };
        nbDonnees = 0;
        nbTours--; // Décrémente le nombre de tours jusqu'a 0
    };
    return 0;
}


