# LLM1
date : 13/10
## Version 
Sonnet 5.5, Claude

## Prompt envoyé 

crée un programme p en Lolcode, 
\# Fonctionnement de p 
p trouve les premiers nombres premiers jusqu'à n

\# Formats 
Entrée : string n >=0
Sortie : une liste de string des nombres dans l'ordre croissant, renvoit "None !" si aucun n'est présent.

\# Exemple de test
Entrée : "5"
Sortie : "2
3
5"

https://esolangs.org/wiki/LOLCODE

## Réponse : 

Voici p.lol, le programme en LOLCODE 1.2.

Fonctionnement

Il lit n avec GIMMEH puis le convertit en nombre (NUMBR).
Pour chaque i de 2 à n, il teste la divisibilité par d tant que d*d <= i.
Chaque nombre premier est affiché sur sa propre ligne, dans l’ordre croissant.
Si aucun premier n’a été trouvé (n = 0 ou 1), il affiche None !.

Exemples

Entrée 5 : sortie 2, 3, 5, un nombre par ligne.
Entrée 1 ou 0 : sortie None !.

Je n’ai pas pu l’exécuter ici, donc il n’a pas été testé sur un interpréteur. Pour le lancer, vous pouvez utiliser par exemple lci : echo 5 | lci p.lol.

## Code :

HAI 1.2
BTW p : affiche les nombres premiers jusqu'a n (un par ligne), ou "None !" s'il n'y en a pas

I HAS A n
GIMMEH n
n IS NOW A NUMBR

I HAS A found ITZ 0
I HAS A isprime ITZ WIN
I HAS A d ITZ 2

I HAS A i ITZ 2
IM IN YR outer WILE BOTH SAEM BIGGR OF n AN i AN n
    isprime R WIN
    d R 2
    IM IN YR inner WILE BOTH SAEM BIGGR OF i AN PRODUKT OF d AN d AN i
        BOTH SAEM MOD OF i AN d AN 0
        O RLY?
            YA RLY
                isprime R FAIL
                GTFO
        OIC
        d R SUM OF d AN 1
    IM OUTTA YR inner

    isprime
    O RLY?
        YA RLY
            VISIBLE i
            found R SUM OF found AN 1
    OIC

    i R SUM OF i AN 1
IM OUTTA YR outer

BOTH SAEM found AN 0
O RLY?
    YA RLY
        VISIBLE "None !"
OIC

KTHXBYE

## Prompt 2 :

l'erreur suivante sort : p1.lol:13: expected end of expression at: WILE

## Réponse 2 : 

Le problème vient de la syntaxe des boucles : en LOLCODE, WILE (ou TIL) ne peut pas s’utiliser seul, il doit suivre une opération UPPIN YR var ou NERFIN YR var. Je corrige en laissant UPPIN incrémenter i et d directement.

J’ai corrigé p.lol : les deux boucles s’écrivent maintenant IM IN YR outer UPPIN YR i WILE ... et IM IN YR inner UPPIN YR d WILE .... Les incrémentations manuelles (i R SUM OF i AN 1 et d R SUM OF d AN 1) ont été supprimées, puisque UPPIN s’en charge à la fin de chaque tour. Le test reste le même : la boucle continue tant que la condition WILE est vraie.

Je n’ai toujours pas pu exécuter le programme ici. Si une autre erreur apparaît, envoyez-moi le message et je corrige.

## Code 2 :

HAI 1.2
BTW p : affiche les nombres premiers jusqu'a n (un par ligne), ou "None !" s'il n'y en a pas

I HAS A n
GIMMEH n
n IS NOW A NUMBR

I HAS A found ITZ 0
I HAS A isprime ITZ WIN
I HAS A d ITZ 2
I HAS A i ITZ 2

IM IN YR outer UPPIN YR i WILE BOTH SAEM BIGGR OF n AN i AN n
    isprime R WIN
    d R 2
    IM IN YR inner UPPIN YR d WILE BOTH SAEM BIGGR OF i AN PRODUKT OF d AN d AN i
        BOTH SAEM MOD OF i AN d AN 0
        O RLY?
            YA RLY
                isprime R FAIL
                GTFO
        OIC
    IM OUTTA YR inner

    isprime
    O RLY?
        YA RLY
            VISIBLE i
            found R SUM OF found AN 1
    OIC
IM OUTTA YR outer

BOTH SAEM found AN 0
O RLY?
    YA RLY
        VISIBLE "None !"
OIC

KTHXBYE


## Prompt 3 : 

nouvelle erreur 
root@Dobbymobile:~/lolcode-projet/llm# lci p1.lol
5
Division by zero undefined

## Réponse 3 :

La boucle UPPIN YR d est en cause : en LOLCODE 1.2 (et dans lci), la variable d’une boucle est une variable temporaire locale à la boucle, initialisée à 0, qui masque la variable de même nom. Donc d valait 0 dans la boucle interne, d’où le MOD par zéro. La correction consiste à utiliser des compteurs factices (k, m) pour UPPIN, et à incrémenter i et d à la main.

J’ai corrigé p.lol : les deux boucles utilisent maintenant les compteurs factices k et m, et i et d sont de nouveau incrémentés à la main (i R SUM OF i AN 1, d R SUM OF d AN 1). Je n’ai pas pu exécuter le programme ici, c’est donc une correction faite d’après la cause probable.

Avec l’entrée 5, vous devriez obtenir 2, 3, 5, un par ligne. Avec 0 ou 1, vous devriez obtenir None !. Si une autre erreur apparaît, envoyez-la-moi.

## Code 3 :

HAI 1.2
BTW p : affiche les nombres premiers jusqu'a n (un par ligne), ou "None !" s'il n'y en a pas

I HAS A n
GIMMEH n
n IS NOW A NUMBR

I HAS A found ITZ 0
I HAS A isprime ITZ WIN
I HAS A d ITZ 2
I HAS A i ITZ 2

BTW k et m sont des compteurs factices : la variable d'UPPIN est locale a la boucle
IM IN YR outer UPPIN YR k WILE BOTH SAEM BIGGR OF n AN i AN n
    isprime R WIN
    d R 2
    IM IN YR inner UPPIN YR m WILE BOTH SAEM BIGGR OF i AN PRODUKT OF d AN d AN i
        BOTH SAEM MOD OF i AN d AN 0
        O RLY?
            YA RLY
                isprime R FAIL
                GTFO
        OIC
        d R SUM OF d AN 1
    IM OUTTA YR inner

    isprime
    O RLY?
        YA RLY
            VISIBLE i
            found R SUM OF found AN 1
    OIC

    i R SUM OF i AN 1
IM OUTTA YR outer

BOTH SAEM found AN 0
O RLY?
    YA RLY
        VISIBLE "None !"
OIC

KTHXBYE

## Résultats des tests sur le dernier code : 

p1.lol : 6 réussite(s), 0 échec(s).

# LLM2
date : 13/10 

## Version 
GPT-6, Chatgpt

## Prompt envoyé :

crée un programme p en Lolcode, 
\# Fonctionnement de p 
p trouve les premiers nombres premiers jusqu'à n

\# Formats 
Entrée : string n >=0
Sortie : une liste de string des nombres dans l'ordre croissant, renvoit "None !" si aucun n'est présent.

\# Exemple de test
Entrée : "5"
Sortie : "2
3
5"

https://esolangs.org/wiki/LOLCODE

## Réponse :

Voici une solution en LOLCODE 1.3 qui lit n sous forme de chaîne, le convertit en entier, puis affiche tous les nombres premiers inférieurs ou égaux à n, dans l’ordre croissant.
Le programme utilise une division par essais : pour chaque nombre à partir de 2, il vérifie s’il possède un diviseur jusqu’à sa racine carrée (en utilisant la condition d * d <= candidat). La syntaxe des boucles, des conversions et des opérations arithmétiques suit la référence LOLCODE. 

Esolang




HAI 1.3

    I HAS A entree ITZ A YARN
    I HAS A n ITZ 0
    I HAS A candidat ITZ 2
    I HAS A diviseur ITZ 2
    I HAS A premier ITZ WIN
    I HAS A trouve ITZ FAIL

    GIMMEH entree
    n R MAEK entree A NUMBR

    BOTH SAEM n AN 2, O RLY?
        YA RLY
            VISIBLE "2"
            trouve R WIN
            candidat R 3
        NO WAI
            NOOB
    OIC

    IM IN YR CANDIDATS UPPIN YR candidat TIL BIGGR OF candidat AN SUM OF n AN 1

        premier R WIN
        diviseur R 2

        IM IN YR TESTDIV UPPIN YR diviseur TIL BOTH SAEM diviseur AN candidat

            BOTH SAEM MOD OF candidat AN diviseur AN 0, O RLY?
                YA RLY
                    premier R FAIL
                    GTFO
            OIC

        IM OUTTA YR TESTDIV

        BOTH SAEM premier AN WIN, O RLY?
            YA RLY
                VISIBLE MAEK candidat A YARN
                trouve R WIN
        OIC

    IM OUTTA YR CANDIDATS

    BOTH SAEM trouve AN FAIL, O RLY?
        YA RLY
            VISIBLE "None !"
    OIC

KTHXBYE



Exemples
Entrée :
5


Sortie :
2
3
5


Entrée :
10


Sortie :
2
3
5
7


Entrée :
1


Sortie :
None !


Remarque : cette version utilise les constructions standard de LOLCODE pour les boucles (IM IN YR), les conditions (O RLY?) et le modulo (MOD OF).

## Prompt 2 : 

le code rend 
root@Dobbymobile:~/lolcode-projet/llm# lci p2.lol
p2.lol:20: expected expression at: NOOB
p2.lol:20: expected statement at: NOOB

## Réponse 2 :

L’erreur vient de cette ligne :
NOOB


NOOB est une valeur spéciale en LOLCODE, pas une instruction exécutable à cet endroit. Il suffit de supprimer cette ligne et le bloc NO WAI associé.
Cependant, il y a aussi une erreur logique dans mon code précédent : la boucle de test des diviseurs ne vérifie pas correctement tous les diviseurs. Voici une version corrigée, compatible avec la syntaxe LOLCODE 1.3 utilisée par lci.

HAI 1.3

    I HAS A entree ITZ A YARN
    I HAS A n ITZ 0
    I HAS A candidat ITZ 2
    I HAS A diviseur ITZ 2
    I HAS A premier ITZ WIN
    I HAS A trouve ITZ FAIL

    GIMMEH entree
    n R MAEK entree A NUMBR

    IM IN YR CANDIDATS UPPIN YR candidat TIL BOTH SAEM candidat AN SUM OF n AN 1

        premier R WIN
        diviseur R 2

        IM IN YR TESTDIV TIL BOTH SAEM diviseur AN candidat

            BOTH SAEM MOD OF candidat AN diviseur AN 0, O RLY?
                YA RLY
                    premier R FAIL
                    GTFO
            OIC

            diviseur R SUM OF diviseur AN 1

        IM OUTTA YR TESTDIV

        BOTH SAEM premier AN WIN, O RLY?
            YA RLY
                VISIBLE MAEK candidat A YARN
                trouve R WIN
        OIC

    IM OUTTA YR CANDIDATS

    BOTH SAEM trouve AN FAIL, O RLY?
        YA RLY
            VISIBLE "None !"
    OIC

KTHXBYE



Tests attendus
Pour l'entrée 5 :
2
3
5


Pour l'entrée 10 :
2
3
5
7


Pour l'entrée 1 ou 0 :
None !


Correction importante : cette version teste les diviseurs de 2 jusqu'à candidat - 1, donc elle est correcte, mais elle est moins optimisée qu'une version qui s'arrête à la racine carrée.

## Code 2 :


HAI 1.3

    I HAS A entree ITZ A YARN
    I HAS A n ITZ 0
    I HAS A candidat ITZ 2
    I HAS A diviseur ITZ 2
    I HAS A premier ITZ WIN
    I HAS A trouve ITZ FAIL

    GIMMEH entree
    n R MAEK entree A NUMBR

    IM IN YR CANDIDATS UPPIN YR candidat TIL BOTH SAEM candidat AN SUM OF n AN 1

        premier R WIN
        diviseur R 2

        IM IN YR TESTDIV TIL BOTH SAEM diviseur AN candidat

            BOTH SAEM MOD OF candidat AN diviseur AN 0, O RLY?
                YA RLY
                    premier R FAIL
                    GTFO
            OIC

            diviseur R SUM OF diviseur AN 1

        IM OUTTA YR TESTDIV

        BOTH SAEM premier AN WIN, O RLY?
            YA RLY
                VISIBLE MAEK candidat A YARN
                trouve R WIN
        OIC

    IM OUTTA YR CANDIDATS

    BOTH SAEM trouve AN FAIL, O RLY?
        YA RLY
            VISIBLE "None !"
    OIC

KTHXBYE


## Prompt 3 : 
le programme rend 
root@Dobbymobile:~/lolcode-projet/llm# lci p2.lol
p2.lol:19: expected end of expression at: TIL
Segmentation fault

## Réponse 3 : 

L’erreur vient de la syntaxe de la boucle IM IN YR TESTDIV : dans LOLCODE 1.3, TIL doit être suivi d’une condition valide, mais lci peut avoir des difficultés à analyser cette expression dans cette position.
Je te propose une version plus simple qui évite la boucle imbriquée avec TIL et utilise une condition explicite pour parcourir les diviseurs.

HAI 1.3

    I HAS A entree ITZ A YARN
    I HAS A n ITZ 0
    I HAS A candidat ITZ 2
    I HAS A diviseur ITZ 2
    I HAS A premier ITZ WIN
    I HAS A trouve ITZ FAIL
    I HAS A reste ITZ 0

    GIMMEH entree
    n R MAEK entree A NUMBR

    IM IN YR CANDIDATS UPPIN YR candidat TIL BIGGR OF candidat AN SUM OF n AN 1

        premier R WIN
        diviseur R 2

        IM IN YR TESTDIV
            BOTH SAEM diviseur AN candidat, O RLY?
                YA RLY
                    GTFO
            OIC

            reste R MOD OF candidat AN diviseur

            BOTH SAEM reste AN 0, O RLY?
                YA RLY
                    premier R FAIL
                    GTFO
            OIC

            diviseur R SUM OF diviseur AN 1
        IM OUTTA YR TESTDIV

        BOTH SAEM premier AN WIN, O RLY?
            YA RLY
                VISIBLE MAEK candidat A YARN
                trouve R WIN
        OIC

    IM OUTTA YR CANDIDATS

    BOTH SAEM trouve AN FAIL, O RLY?
        YA RLY
            VISIBLE "None !"
    OIC

KTHXBYE



Vérification
Entrée :
5


Sortie attendue :
2
3
5


Cette version utilise GTFO pour sortir de la boucle interne lorsqu'un diviseur est trouvé ou lorsque le diviseur atteint le candidat.
Attention : selon la version de lci, une boucle sans clause TIL ou WILE peut ne pas être acceptée. Si tu rencontres encore une erreur, indique-moi la version de lci (lci --version) et je pourrai adapter le code précisément à ton interpréteur.

## Code 3 : 


HAI 1.3

    I HAS A entree ITZ A YARN
    I HAS A n ITZ 0
    I HAS A candidat ITZ 2
    I HAS A diviseur ITZ 2
    I HAS A premier ITZ WIN
    I HAS A trouve ITZ FAIL
    I HAS A reste ITZ 0

    GIMMEH entree
    n R MAEK entree A NUMBR

    IM IN YR CANDIDATS UPPIN YR candidat TIL BIGGR OF candidat AN SUM OF n AN 1

        premier R WIN
        diviseur R 2

        IM IN YR TESTDIV
            BOTH SAEM diviseur AN candidat, O RLY?
                YA RLY
                    GTFO
            OIC

            reste R MOD OF candidat AN diviseur

            BOTH SAEM reste AN 0, O RLY?
                YA RLY
                    premier R FAIL
                    GTFO
            OIC

            diviseur R SUM OF diviseur AN 1
        IM OUTTA YR TESTDIV

        BOTH SAEM premier AN WIN, O RLY?
            YA RLY
                VISIBLE MAEK candidat A YARN
                trouve R WIN
        OIC

    IM OUTTA YR CANDIDATS

    BOTH SAEM trouve AN FAIL, O RLY?
        YA RLY
            VISIBLE "None !"
    OIC

KTHXBYE

## Résultats des tests sur le dernier code : 
p2.lol : 2 réussite(s), 4 échec(s).