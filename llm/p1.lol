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
