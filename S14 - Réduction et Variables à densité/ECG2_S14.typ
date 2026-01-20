#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Réduction / Variables à densité",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 14",
  school: "Lycée Champollion",
  show_correction: false,
  show_info_text: true,
  additional_comments: [
#linebreak()

/*
L'algèbre linéaire constitue un des trois grands blocs du programme d'ECG, avec l'analyse et les probabilités. Dans le cadre de la prépa, elle peut paraître abstraite et remplie de calculs à rallonge, notations, théorèmes et concepts abscons.

Cependant, cette théorie à émergée de l'idée simple d'étuder les systèmes linéaires sous l'angle de la *géométrie*, ce qui a débouché sur l'axiomatisation des espaces vectoriels comme concept général fondateur. Il ne faut donc jamais perdre de vue notre amie géométrie, car son omniprésence sera le phare de notre voyage dans une nuit abstraite.

  A cet effet, je recommande ardamment l'excellente série de vidéos #link("https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab")[Essence of Linear Algebra] de la chaîne 3blue1brown (en anglais sous titré français). Je suis persuadé que quelques heures de méditation sur cette présentation de l'algèbre linéaire au cours de l'année vous sera infiniment plus utile qu'un enchaînement machinal d'exercices. En effet, leur réalité évidente sous-jacente vous resterait pour toujours invisible avec des yeux calculatoires.
*/
  _Algebra is the offer made by the devil to the mathematician. The devil says: "I will give you this powerful machine, it will answer any question you like. All you need to do is give me your soul: give up geometry and you will have this marvelous machine._ -- Michael Atiyah
])

#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let Sp = $op("Sp")$

#exercice(title: "Matrice aléatoire", n_stars:2)[
 Soit $X$ une variable aléatoire qui suit une loi normale $cal(N)(0, 4)$. On pose $M = mat(2X, 1; -4, X)$. Déterminer la probabilité que $M$ admette deux valeurs propres distinctes.
]


#correction[
  Un réel $lambda$ est valeur propre de $M$ si et seulement si $det(M - lambda I_2) = 0$, soit si et seulement si
$ (2X - lambda)(X - lambda) + 4 = 0 <==> lambda^2 - 3X lambda + 2X^2 + 4 = 0. $

Cette équation possède deux racines distinctes si et seulement si son discriminant est strictement positif, c'est-à-dire si et seulement si $X^2 - 16 > 0$.
C'est le cas si et seulement si $X > 4$ ou $X < -4$.
Autrement dit, l'événement « $M$ possède deux valeurs propres distinctes » est l'événement $[X > 4] union [X < -4]$.
Par incompatibilité de $[X > 4]$ et $[X < -4]$, la probabilité cherchée est donc $P(X > 4) + P(X < -4)$.
Mais $X$ suivant une loi $cal(N)(0, 4)$, $X / 2$ suit une loi normale centrée réduite, de sorte que
$ P(X > 4) = P(X / 2 > 2) = 1 - P(X / 2 <= 2) = 1 - Phi(2). $

De même, $P(X < -4) = Phi(-2) = 1 - Phi(2)$.
Et donc la probabilité que $M$ possède deux valeurs propres distinctes est $2 - 2 Phi(2) approx 0.045$.
]

#exercice(title: "Racines carrées", n_stars: 2)[
  Soit $u$ l'endomorphisme de $RR^3$ dont la matrice dans la base canonique est la matrice :
$ M = mat(
  0, -1, 1;
  -4, 3, 1;
  -4, 2, 2
) . $
Le but de l'exercice est de déterminer les endomorphismes $v$ de $RR^3$ vérifiant $v^2 = u$.

+ 
  + Déterminer le rang de $M$ et calculer $M vec(1, 1, 2)$. En déduire les éléments propres de $u$.
  + Montrer que $u$ est diagonalisable et déterminer une base $cal(B)$ de $RR^3$ dans laquelle la matrice de $u$ est diagonale.

+ Soit $v$ un endomorphisme de $RR^3$ vérifiant $v^2 = u$.
  + Montrer que $v compose u = u compose v$. En déduire que les sous-espaces propres de $u$ sont stables par $v$.
  + Montrer que la matrice $N$ de $v$ dans la base $cal(B)$ est diagonale. \
    En déduire les quatre seules matrices possibles pour $N$.

+ Montrer qu'il existe exactement quatre endomorphismes $v$ de $RR^3$ vérifiant $v^2 = u$ et déterminer leurs matrices dans la base canonique de $RR^3$.
]

#correction[

+
  + Observons les colonnes de la matrice $M$. On remarque que $C_1 + C_2 + C_3 = 0$, donc les colonnes sont liées. Comme $C_1$ et $C_3$ ne sont pas colinéaires, le rang de $M$ est exactement 2.
    Puisque la matrice n'est pas inversible, 0 est valeur propre avec un sous espace propre de dimension 1. Le vecteur $e'_1 = (1, 1, 1)$ vérifie $M e'_1 = 0$ (car $C_1+C_2+C_3=0$), il forme donc une base de $E_0$.

    Calculons l'image du vecteur proposé :
    $ M vec(1, 1, 2) = mat(0, -1, 1; -4, 3, 1; -4, 2, 2) vec(1, 1, 2) = vec(-1 + 2, -4 + 3 + 2, -4 + 2 + 4) = vec(1, 1, 2). $
    On en déduit que $e'_2 = (1, 1, 2)$ est vecteur propre associé à la valeur propre $1$.

    La trace de la matrice est la somme des valeurs propres. On a $"Tr"(M) = 5$.
    Soit $lambda_3$ la troisième valeur propre. On a $0 + 1 + lambda_3 = 5$, donc $lambda_3 = 4$.  \ Finalement, $"Sp"(u) = {0,1,4}.$
  + L'endomorphisme $u$ admet trois valeurs propres distinctes en dimension 3, il est donc diagonalisable.
    Cherchons un vecteur propre pour $lambda_3 = 4$.
  $ cases(-4x - y + z = 0, -4x - y + z = 0, -4x + 2y - 2z = 0) arrow.l.r.double cases(z = 4x + y, -2x + y - z = 0). $
    En remplaçant $z$ dans la seconde équation : $-2x + y - (4x + y) = -6x = 0$, donc $x=0$. Il vient $z=y$.
    Le vecteur $e'_3 = (0, 1, 1)$ est un vecteur propre associé à 4.
    La famille $cal(B) = (e'_1, e'_2, e'_3) = ((1, 1, 1), (1, 1, 2), (0, 1, 1))$ constitue une base de vecteurs propres.
    Dans cette base, la matrice de $u$ est $D = "diag"(0, 1, 4)$.

+
  + On a $v^2 = u$. Comme $v$ commute avec $v^2$ (toute puissance d'un endomorphisme commute avec lui-même), on a $v compose u = v compose v^2 = v^3 = v^2 compose v = u compose v$.
    Comme $u$ et $v$ commutent, les sous-espaces propres de $u$ sont stables par $v$ (à remontrer).

  + Les valeurs propres de $u$ étant simples, les sous-espaces propres associés sont des droites vectorielles engendrées par les vecteurs de la base $cal(B)$.
    Pour chaque $k in {1, 2, 3}$, la droite $RR e'_k$ est stable par $v$, donc $v(e'_k)$ est colinéaire à $e'_k$.
    Il existe donc des scalaires $delta_1, delta_2, delta_3$ tels que $v(e'_k) = delta_k e'_k$.
    La matrice $N$ de $v$ dans la base $cal(B)$ est donc la matrice diagonale $"diag"(delta_1, delta_2, delta_3)$.

    La relation $v^2 = u$ se traduit matriciellement dans la base $cal(B)$ par $N^2 = D$.
    On a donc $delta_1^2 = 0$, $delta_2^2 = 1$, $delta_3^2 = 4$.
    D'où $delta_1 = 0$, $delta_2 in {-1, 1}$ et $delta_3 in {-2, 2}$.
    Il y a $1 times 2 times 2 = 4$ matrices possibles pour $N$ :
    $ "diag"(0, 1, 2), "diag"(0, 1, -2), "diag"(0, -1, 2), "diag"(0, -1, -2). $

+ Soit $P$ la matrice de passage de la base canonique à la base $cal(B)$.
  $ P = mat(1, 1, 0; 1, 1, 1; 1, 2, 1). $
  Inversons ce système pour trouver $P^(-1)$. Soit $X = P Y$ avec $X=(x, y, z)$ et $Y=(a, b, c)$.
  $ cases(x = a + b, y = a + b + c, z = a + 2b + c) arrow.l.r.double cases(c = y - x, b = (z - a - c) = z - a - (y - x) dots "plus rapide :" (3)-(2) => b = z - y, a = x - b = x - z + y). $
  On obtient $P^(-1) = mat(1, 1, -1; 0, -1, 1; -1, 1, 0)$.

  Les matrices solutions dans la base canonique sont données par $V = P N P^(-1)$.
  Considérons la forme générale $N = "diag"(0, epsilon_1, 2 epsilon_2)$ avec $epsilon_i in {-1, 1}$.
  $ P N = mat(0, epsilon_1, 0; 0, epsilon_1, 2 epsilon_2; 0, 2 epsilon_1, 2 epsilon_2). $
  $ V &= mat(0, epsilon_1, 0; 0, epsilon_1, 2 epsilon_2; 0, 2 epsilon_1, 2 epsilon_2) mat(1, 1, -1; 0, -1, 1; -1, 1, 0) \
  &= mat(0, -epsilon_1, epsilon_1; -2 epsilon_2, -epsilon_1 + 2 epsilon_2, epsilon_1; -2 epsilon_2, -2 epsilon_1 + 2 epsilon_2, 2 epsilon_1). $

  En substituant les quatre couples $(epsilon_1, epsilon_2)$ possibles, on obtient exactement quatre endomorphismes solutions dont les matrices sont :
  - Pour $(1, 1)$ : $mat(0, -1, 1; -2, 1, 1; -2, 0, 2)$

  - Pour $(1, -1)$ : $mat(0, -1, 1; 2, -3, 1; 2, -4, 2)$

  - Pour $(-1, 1)$ : $mat(0, 1, -1; -2, 3, -1; -2, 4, -2)$

  - Pour $(-1, -1)$ : $mat(0, 1, -1; 2, -1, -1; 2, 0, -2)$
]

/* #pagebreak() */

#exercice(title: "Nilpotence", n_stars:2)[
  Soit $ n >= 2$ et $A$ une matrice nilpotente d'indice $p>1$ de $cal(M)_n (RR)$, c'est à dire que $A^p = 0$ et $A^(p-1) eq.not 0$.
+ Montrer que $p<=n$.


+
 + Montrer que $0$ est valeur propre de $A$.
 + En déduire par deux méthodes que $Sp(A) = {0}.$

+ $A$ est elle diagonalisable ?
]

#correction[
+ Soit $X$ un vecteur tel que $A^(p-1) X != 0$. Un tel vecteur existe car $A^(p-1) != 0$.
  Considérons la famille $cal(F) = (X, A X, A^2 X, dots, A^(p-1) X)$.
  Soient $lambda_0, dots, lambda_(p-1)$ des scalaires tels que $ sum_(k=0)^(p-1) lambda_k A^k X = 0. $
  Appliquons $A^(p-1)$ à cette égalité. Pour tout $k >= 1$, $A^(p-1) A^k X = A^(p+k-1) X = 0$ car $p+k-1 >= p$ et $A^p = 0$.
  Il ne reste donc que $lambda_0 A^(p-1) X = 0$. Comme $A^(p-1) X != 0$, on a $lambda_0 = 0$.
  On réitère le processus en appliquant $A^(p-2)$, ce qui donne $lambda_1 = 0$, et ainsi de suite jusqu'à $lambda_(p-1) = 0$.
  La famille $cal(F)$ est donc libre de cardinal $p$, donc $p<= n$.

  *Remarque*: Cette question est très classique et à savoir refaire rapidement.

+ 
  + Si $0$ n'est pas valeur propre de $A$ alors $A$ est inversible, donc $A^p$ l'est également. Or, \ $A^p = 0$ n'est évidemment pas inversible. Contradiction.
  + *Méthode 1 : Recherche directe* \
   Soit $lambda in Sp(A)$. Il existe un vecteur propre $x != 0$ tel que $A x = lambda x$.
   Par récurrence immédiate, pour tout $k in NN$, $A^k x = lambda^k x$.
   Pour $k=p$, on a $A^p x = 0$, donc $lambda^p x = 0$.
   Comme $x != 0$, on en déduit $lambda^p = 0$, donc $lambda = 0$.
   Ainsi, $"Sp"(A) subset {0}$. Par double inclusion, $Sp(A) = 0$.

  + *Méthode 2 : Polynôme annulateur* \
    Le polynôme $X^p$ annule $A$, et $0$ est sa seule racine. D'après le cours, $Sp(A) subset {0}.$ Par double inclusion, $Sp(A) = 0$.



+ Aucune matrice nilpotente non nulle n'est diagonalisable. En effet,supposons $A$ diagonalisable.
  Comme $Sp(A) = {0}$, $A$ est semblable à la matrice diagonale nulle, donc il existe $P in G L_n (RR)$ tel que $A = P 0_n P^(-1) = 0$.  Or, par hypothèse, l'indice de nilpotence est $p > 1$, donc $A != 0$. Absurde.


]

/* #pagebreak() */

#exercice(title: "Pas à pas", n_stars:3)[
Soit $n in NN^*$. Déterminer toutes les matrices A de $cal(M)_2 (RR)$ telles que $ A^n = mat( 1, 1 ; 0 , 1). $
]

#correction[

La matrice $A$ commute avec $A^n$, donc $A A^n = A^n A$.
$ A A^n &= mat(a, b; c, d) mat(1, 1; 0, 1) = mat(a, a+b; c, c+d) \
A^n A &= mat(1, 1; 0, 1) mat(a, b; c, d) = mat(a+c, b+d; c, d) $

L'égalité implique le système suivant :
$ cases(a = a + c, a + b = b + d, c = c, c + d = d) arrow.l.r.double cases(c = 0, a = d) $
La matrice $A$ est donc triangulaire supérieure avec des coefficients diagonaux égaux. Elle s'écrit sous la forme $A = mat(a, b; 0, a)$.

On peut décomposer $A$ comme somme d'une homothétie et d'une matrice nilpotente :
$ A = a I_2 + B quad "avec" B = mat(0, b; 0, 0). $
Remarquons que $B^2 = mat(0, 0; 0, 0)$, donc $B^k = 0$ pour tout $k >= 2$.
Comme $a I_2$ et $B$ commutent, on peut appliquer la formule du binôme de Newton :
$ A^n = (a I_2 + B)^n = sum_(k=0)^n binom(n, k) (a I_2)^(n-k) B^k = binom(n, 0) a^n I_2 + binom(n, 1) a^(n-1) B. $
On obtient donc :
$ A^n = a^n mat(1, 0; 0, 1) + n a^(n-1) mat(0, b; 0, 0) = mat(a^n, n a^(n-1) b; 0, a^n). $

* Autre méthode* : Avec un raisonnement géométrique, on peut directement conjecturer cette forme des puissances de A, et confirmer cela par récurrence.

Par identification avec la matrice donnée $mat(1, 1; 0, 1)$, on obtient le système :
$ cases(a^n = 1, n a^(n-1) b = 1) $

La parité de $n$ implique plus ou moins de solutions.

 *Si $n$ est impair :* \
    L'équation $a^n = 1$ admet une unique solution réelle $a = 1$.
    Le système devient $1 dot b dot n = 1$, d'où $b = 1/n$.
    On obtient une unique solution :
    $ A_1 = mat(1, 1/n; 0, 1). $

 *Si $n$ est pair :* \
    L'équation $a^n = 1$ admet deux solutions réelles : $a = 1$ et $a = -1$. \
  #sym.bullet Pour $a = 1$, on retrouve la matrice $A_1 = mat(1, 1/n; 0, 1)$. \
  #sym.bullet  Pour $a = -1$, l'équation devient $n (-1)^(n-1) b = 1$. Comme $n$ est pair, $n-1$ est impair, donc $-n b = 1$, soit $b = -1/n$. Cela donne la matrice $A_2 = mat(-1, -1/n; 0, -1) = -A_1$.

]

