# Fonctionnement du programme p 

p prend en entrée une valeur entière n >=0 et rend tous les nombres premiers compris dans l'intervalle [0,n]

Pour ce faire, celui-ci s'appuie sur le crible d'ératosthène qui permet de diminuer la complexité de l'algorithme : à la place de tester pour chaque nombre s'il est divisible par tous les nombres entiers qui lui sont inférieurs, on vérifie uniquement avec les nombres premiers qui lui sont inférieurs. En effet, si n n'est divisible par aucun nombre premier qui lui est inférieur, alors il n'est divisible par aucun nombre qui lui est inférieur. 

Le programme s'appuie sur la définition de la structure pile qui était fournie dans le markdown du langage sur github https://github.com/justinmeza/lci à laquelle une fonction init a été ajoutée pour pouvoir initialiser deux piles sans problèmes de valeur

Il s'organise de la manière suivante : Il teste d'abord si n est égal à 0 ou 1, auquel cas il renvoie le string "None !". 
si n>1, alors il boucle (indice i) sur tous les nombres inférieurs à n, si ce nombre est 2 il le rajoute à la pile des nombres premiers, si i>2 il dépile la pile des nombres premiers pour vérifier qu'il n'est divisible par aucun, et l'ajoute à cette pile si c'est le cas (L'existence de la deuxième pile stack2 sert uniquement à stocker les valeurs pendant la boucle for avant de les rempiler dans stack, pour ne pas les perdre). 

Une fois les nombres premiers trouvés et stockés dans la pile, on les empile dans une deuxième pile pour les mettre dans l'ordre croissant puis on les affiche dans le flux out du programme. 