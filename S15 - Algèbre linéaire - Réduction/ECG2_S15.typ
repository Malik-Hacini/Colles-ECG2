#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Algèbre linéaire : Réduction",
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

/* #pagebreak() */

#exercice(title: "Spectre obscur", n_stars:3)[

Soit $E$ le $RR$-espace vectoriel des fonctions continues de $[0, +∞[$ vers $RR$ admettant une limite finie en $+infinity$.
Soit $T$ l’endomorphisme de $E$ qui à $f in E$ associe $T(f)$ défini par  
$ ∀x in [0; +∞[, T(f)(x) = f(x + 1). $

Déterminer les valeurs propres de $T$ et les vecteurs propres associés.
]

#correction[

Soient $λ$ un réel et $f$ une fonction élément de $E$.  
Si $T(f) = λ f$ alors  
$ ∀x in [0; +∞[, f(x + 1) = λ f(x). $

En passant cette relation à la limite quand $x → +∞$, on obtient  
$ ℓ = λ ℓ $  
en notant $ℓ$ la limite de $f$ en $+∞$.

*Cas* 1 : $ℓ ≠ 0$. #linebreak()  
Nécessairement $λ = 1$ et  
$ ∀x in [0; +∞[, f(x + 1) = f(x). $  
Puisque $f$ est périodique et admet une limite finie en $+∞$, elle est constante (à reprouver).  
Inversement, toute fonction constante non nulle est vecteur propre associé à la valeur propre $1$.

*Cas* 2 : $ℓ = 0$.  #linebreak()
Si $λ$ est valeur propre alors en introduisant $f$ vecteur propre associé, il existe $x₀ in [0; +∞[$ tel que $f(x₀) ≠ 0$ et la relation $T(f) = λ f$ donne par récurrence  
$ ∀n in ℕ, f(x₀ + n) = λ^n f(x₀). $  
En faisant tendre $n → +∞$, on obtient $|λ| < 1$.

Inversement, supposons $|λ| < 1$. Si $T(f) = λ f$ alors  
$ f(1) = λ f(0) quad  "et" quad ∀n in ℕ, ∀x in [0;1[, f(x + n) = λ^n f(x). $  
La fonction $f$ est donc entièrement déterminée par sa restriction continue sur $[0;1]$ vérifiant $f(1) = λ f(0)$.  

Inversement, si $φ : [0;1] → ℝ$ est une fonction continue sur $[0;1]$ vérifiant $φ(1) = λ φ(0)$, alors la fonction $f$ définie par  
$ ∀n in ℕ, ∀x in [0;1[, f(x + n) = λ^n φ(x) $  
est continue (on vérifie la continuité en $k in ℕ^*$ par continuité à droite et à gauche), tend vers $0$ en $+∞$ et vérifie $T(f) = λ f$.

Puisqu’il est possible de construire une fonction non nulle de la sorte, le scalaire $λ in ]−1; 1[$ est valeur propre et les vecteurs propres associés sont les fonctions non nulles de la forme précédente.
]

