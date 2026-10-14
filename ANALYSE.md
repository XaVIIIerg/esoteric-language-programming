# Analyse du code 

J'ai demandé aux LLM de raffiner leurs réponses jusqu'à ce que le code s'execute

# LLM1 - Sonnet 5.5

## Analyse sémantique

Le code passe tous les tests et calcule la même chose que le mien. Ce qui est visible car le code effectue de simples boucles for en testant si pour chaque nombre inférieur k à n il existe un nombre i qui le divise (autre que 1), il arrête son itération lorsque ixi >k, ce qui est logique aussi car si ixi était supérieur à k alors, si on nomme d un nombre supérieur à i qui diviserait k, on aurait dxm = k, avec m<i, impliquant que m aurait déjà été testé, on saurait donc d'ores et déjà que k n'est pas premier.

Les choses qui rendent la tâche difficile dans le langage peuvent être vus par les raisons pour lesquelles les LLM ont fait des codes qui ne compilaient pas : - certaines "structures" de code comme les boucles while sont différentes des structures habituelles, en effet les boucles while de LOLCODE ne peuvent pas s'utiliser sans incrémenter/décrémenter une variable, les variables temporaires des boucles ne peuvent pas avoir été initialisées avant, celles d'avant sont écrasées pendant la boucle. Le LLM a d'ailleurs créé des compteurs factices pour gérer mieux l'incrémentation des vrais indices.

## Analyse syntaxique 

- Taille (ne compte pas les commentaires) : - taille de p en instructions : 94 ; taille de p1 en instructions : 34 ; taille p en tokens : 500 ; taille p1 en tokens : 157

- Distance de Levenstein : le nombre de modifications minimal pour passer d'un script à l'autre, par instructions : 84 ; par tokens : 424, c'estj'ai choisi cette méthode de distance qui est plus intéressante que de calculer la différence de ligne 

- Ce qui différentie les deux approches est à mon sens la définition d'une structure pile dans mon code ainsi que l'utilisation du crible d'eratosthene pour optimiser la recherche en gardant les valeurs dans une pile. Bien que le code de Claude soit optimisé aussi en s'arretant lorsque dxd>=n. 

- Comparaison : taille : le code de Claude est bien plus petit étant donné qu'il n'a pas créé de nouvelle structure, en instructions on est à 94 contre 34, soit presque un ratio x3, ce qui est énorme. Complexité : le code de Claude a aussi une meilleure complexité étant donné qu'il ne dépile et ne rempile pas la pile des nombres premiers à chaque entier (qui dans mon code est rempilée sur une autre pile avant d'être remise sur la pile principale). Mémoire : le code de Claude demande aussi moins de mémoire en ne gardant pas les valeurs dans une pile et en ayant moins de variables.

- Je préfère l'approche de Claude qui est plus simple, celle-ci est mieux optimisée surtout lorsque l'on remarque que les tests de mon code se font dans le sens de dépilement de la pile des nombres premiers, donc on ne part pas des plus petits qui ont plus de chance de sortir. 
NP : On pourrait cependant construire une troisième manière qui utilise le crible d'eratostene et la condition dxd>=n pourrait être mieux optimisé en terme de temps pour un grand n en entrée (en gérant mieux les piles aussi pour ne pas avoir à la dépiler plusieurs fois), mais cela se ferait au détriment de la mémoire. 

# LLM2 - GPT 6

## Analyse sémantique

- Le programme de Chatgpt ne calcule pas la même chose que le mien, en effet, celui-ci rate 4 des 6 tests qui lui sont donnés, en rendant "None !" lorsque le programme était sensé rendre des nombres premiers. Ceci est visible lorsque l'on regarde le programme qui tente d'initialiser une variable dans la boucle for à plus de 0, ce qui est impossible. On se doute donc bien que le programme ne fait pas ce qu'il prevoyait de faire


## Analyse syntaxique
- Taille (ne compte pas les commentaires) : - taille de p en instructions : 94 ; taille de p1 en instructions : 41 ; taille p en tokens : 500 ; taille p1 en tokens : 167

- Distance de Levenstein, le nombre de modifications minimal  pour passer d'un script à l'autre : par instructions : 82 ; par tokens : 413

- Ce qui différentie les deux approches est à mon sens la définition d'une structure pile dans mon code ainsi que l'utilisation du crible d'eratosthene pour optimiser la recherche en gardant les valeurs dans une pile. De plus, le code de Chatgpt est erroné et ne passe pas la plupart des tests. Dû selon moi aux raisons listées dans la partie suivante.

- Le programme rend "None !" peu importe l'entrée, c'est selon moi du au fait qu'il initialise une variable. Ce qui rend l'établissement du programme dans ce langage est le fait que le nom de certains tests sont contre intuitifs, comme bigger Of i an n qui n'est pas un test sur i>n rendant un booléen mais un test rendant le plus grand int entre i et n. Ainsi que le fait qu'on ne puisse pas initialiser les boucles for à n'importe quel valeur de base, si c'est fait avant alors la variable est écrasée par une nouvelle interne à la boucle, ce qui est contre-intuitif et ne ressemble pas à la plupart des langages. 

- Comparaison : taille : le code de Chatgpt est bien plus petit étant donné qu'il n'a pas créé de nouvelle structure, en instructions on est à 94 contre 41, soit environ un ratio x2, et un ratio presque x3 sur les tokens, ce qui est énorme. Complexité : le code de ChatGPT a en revanche une plus grande quantité de tests étant donné qu'il est sensé tester pour chaque entier s'il est divisible par tous les entiers plus petits que lui. Mémoire : le code de ChatGPT a une moins grande complexité en mémoire car il ne garde pas les nombres premiers en mémoire dans une pile .

- Je préfère mon approche ici, car elle fonctionne. Bien que celle de ChatGPT serait plus simple si elle fonctionnait.

 
# Conclusion
distance entre p1 et p2 : par instruction : 30 ; par tokens : 92; On voit donc bien que les deux codes faits pas LLM se ressemblent car ils obéissent à la même logique (habituelle, même si p2 ne teste pas dxd>=n donc n'est pas optimisé) pour répondre au problème.

Ce qui s'éloigne dans mon programme de ce qu'un LLM fait normalement est l'utilisation d'une méthode plus gourmande en mémoire (crible d'Eratostene + pile)que la méthode connue et habituelle, ainsi que la création d'une structure de données pour l'exercice.

Cet exercice m'a appris beaucoup sur le fait que l'on ne peut pas faire l'algorithme que l'on veut avec n'importe quel dsl, et encore moins facilement. En effet, j'avais commencé l'exercice en souhaitant faire le test du palindrome avant de me rendre compte que les fonctions LOLCODE que j'utilisais ne faisaient pas vraiment ce que je faisais (il était en réalité difficile de convertir une lettre en héxadécimal, ce que je comptais faire pour tenter une approche sûrement différente que les LLMs à la réponse). Au final, j'ai même du changer de problème car la difficulté était trop grande.