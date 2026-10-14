HAI 1.4
OBTW 
Ce programme prend en entrée un nombre n et tous les nombres premiers contenus entre 0 et n en s'appuyant sur le crible d'ératosthene
TLDR


OBTW
Programme à traduire 
give me value
int i =2

pile stack 
pile stack2
if 1 or less : return "None"
else : 
     
    for i in range value+1 : 
        bool boo =0
        if i ==2 :
            add 2;
        else : 
            int j=0
            fixer len stack
            for j in length(stack):
                v = stack pop 
                if i % v ==0 :
                    boo =1;
                stack2.push(v)
            int k=0
            fixer len stack
            for k in length(stack2)
                v = stack2 pop 
                stack.push(v)
            if boo ==0 :
                stack.push(i)
    l =0
    fixer len stack
    for l in range length(stack):
        append sortie (stack.pop +",")
TLDR

OBTW
 La définition d'une pile contenue dans la classe suivante vient du site web d'esolang 
 Elle définit les fonctions init, gettinLen, popin et pushin pour manipuler la classe pile
TLDR
O HAI IM pile
    HOW IZ I init 
	    ME HAS A length ITZ 0
	    ME HAS A max ITZ -1
    IF U SAY SO
	
	HOW IZ I pushin YR item
		DIFFRINT ME'Z max AN BIGGR OF ME'Z max AN ME'Z length, O RLY?
			YA RLY, ME HAS A SRS ME'Z length ITZ item, ME'Z max R SUM OF ME'Z max AN 1
			NO WAI, ME'Z SRS ME'Z length R item
		OIC
		ME'Z length R SUM OF ME'Z length AN 1
	IF U SAY SO
	
	HOW IZ I popin
		DIFFRINT ME'Z length AN 0, O RLY?
		YA RLY
			ME'Z length R DIFF OF ME'Z length AN 1
			I HAS A item ITZ ME'Z SRS ME'Z length
			ME'Z SRS ME'Z length R NOOB
			FOUND YR item
		OIC
	IF U SAY SO
	
	HOW IZ I gettinLen
		FOUND YR ME'Z length
	IF U SAY SO
KTHX

BTW prendre la valeur depuis le flux in
I HAS A value
GIMMEH value 
BTW la convertir en int
value R MAEK value A NUMBR

BTW initialisation des variables
I HAS A i ITZ 0
I HAS A max ITZ 0
I HAS A boo ITZ 0
I HAS A v ITZ 0
I HAS A stack ITZ LIEK A pile
I HAS A stack2 ITZ LIEK A pile
stack IZ init MKAY
stack2 IZ init MKAY

BTW check si la valeur et 1 ou 0 auquel cas on rend "None !"
BOTH SAEM value AN 1, O RLY?
    YA RLY
        VISIBLE "None !"
    NO WAI
        BOTH SAEM value AN 0, O RLY?
            YA RLY 
                VISIBLE "None !"
            NO WAI 
                
                BTW main loop pour tester des valeurs 2 à n compris (on utilise dans la boucle la variable i2 car on ne peut pas commencer la boucle à 2)
                IM IN YR mainloop UPPIN YR i2 TIL BOTH SAEM i2 AN DIFF OF value AN 1
                    i R SUM OF i2 AN 2
                    boo R 0
                    BOTH SAEM i AN 2, O RLY?

                        YA RLY
                        BTW si c'est vrai on remplit la pile avec 2
                            stack IZ pushin YR 2 MKAY
                        NO WAI

                            BTW Sinon on parcourt la pile pour voir si la valeur est divisible

                            max R stack IZ gettinLen MKAY
                            IM IN YR stackloop1 UPPIN YR j TIL BOTH SAEM j AN max
                                v R stack IZ popin MKAY

                                BTW check si la variable est divisible 

                                BOTH SAEM 0 AN MOD OF i AN v, O RLY?
                                    YA RLY 
                                        boo R 1
                                    
                                    OIC
                                
                                BTW on remplit une autre stack pour ne pas perdre la valeur

                                stack2 IZ pushin YR v MKAY
                            IM OUTTA YR stackloop1
                            
                            max R stack2 IZ gettinLen MKAY
                            BTW on remplit la pile principale 
                            IM IN YR stackloop2 UPPIN YR k TIL BOTH SAEM k AN max
                                v R stack2 IZ popin MKAY
                                stack IZ pushin YR v MKAY
                            IM OUTTA YR stackloop2
                            BOTH SAEM boo AN 0, O RLY?
                                YA RLY
                                    stack IZ pushin YR i MKAY
                                
                                OIC
                        OIC
                IM OUTTA YR mainloop
                
                BTW on retourne la liste pour avoir les nombres dans le bon sens
                max R stack IZ gettinLen MKAY
                IM IN YR reverseloop UPPIN YR l TIL BOTH SAEM l AN max
                    v R stack IZ popin MKAY
                    stack2 IZ pushin YR v MKAY
                IM OUTTA YR reverseloop
                
                BTW on retourne le résultat 
                max R stack2 IZ gettinLen MKAY
                IM IN YR returnloop UPPIN YR l2 TIL BOTH SAEM l2 AN max
                    VISIBLE stack2 IZ popin MKAY
                IM OUTTA YR returnloop
            OIC    
    OIC

KTHXBYE