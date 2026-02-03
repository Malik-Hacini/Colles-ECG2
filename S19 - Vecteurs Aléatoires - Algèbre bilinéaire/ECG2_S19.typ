#import "@local/mh_colle:1.0.0": *
#import "@preview/codly:1.3.0": *
#show: codly-init
#import "@preview/codly-languages:0.1.10": *
#codly(languages: codly-languages, 
  number-format: none, 
  zebra-fill: luma(240),
)

#show: project.with(
  authors:"M. Hacini",

  title: align(center)[Vecteurs aléatoires et \ Endomorphismes symétriques],
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 19",
  school: "Lycée Champollion",
  show_correction: false,
  show_info_text: true,
  additional_comments: [
#linebreak()
/* L'algèbre linéaire constitue un des trois grands blocs du programme d'ECG, avec l'analyse et les probabilités. Dans le cadre de la prépa, elle peut paraître abstraite et remplie de calculs à rallonge, notations, théorèmes et concepts abscons.

Cependant, cette théorie à émergée de l'idée simple d'étuder les systèmes linéaires sous l'angle de la *géométrie*, ce qui a débouché sur l'axiomatisation des espaces vectoriels comme concept général fondateur. Il ne faut donc jamais perdre de vue notre amie géométrie, car son omniprésence sera le phare de notre voyage dans une nuit abstraite.

  A cet effet, je recommande ardamment l'excellente série de vidéos #link("https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab")[Essence of Linear Algebra] de la chaîne 3blue1brown (en anglais sous titré français).  Le chapitre 9 (Produit scalaire et Dualité) explique en particulier la notion fondamentale de l'introduction à l'algèbre bilinéaire au programme d'ECG.

  Je suis persuadé que quelques heures de méditation sur cette présentation de l'algèbre linéaire au cours de l'année vous sera infiniment plus utile qu'un enchaînement machinal d'exercices. En effet, leur réalité évidente sous-jacente vous resterait pour toujours invisible avec des yeux calculatoires.
*/

 _Il faut donc que l’élève se mette en état, d’une part, de pouvoir écrire en
analyse tous les mouvements qu’il peut concevoir dans l’espace, et, de
l’autre, de se représenter perpétuellement dans l’espace le spectacle
mouvant dont chacune des opérations analytiques est l’écriture._ 

  Gaspard Monge - _Cours de Géométrie descriptive_ (1746 - 1818)])
#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let Sp = $op("Sp")$
#let dotp(..args) = math.angle.l + args.pos().join(math.comma) + math.angle.r

#let ts(arg) = $attach(arg, tl: t)$

#exercice(title: "Racines carrées, chapitre 1")[
Soit $A in cal(M)_n (RR)$ une matrice symétrique dont toutes les valeurs propres sont positives.
Montrer qu'il existe une matrice $B in cal(M)_n (RR)$, symétrique, à valeurs propres positives, telle que $B^2 = A$.
]
#correction[
Puisque $A$ est symétrique, elle est semblable à une matrice $D$ diagonale. Plus précisément : il existe une matrice $P$ orthogonale et une matrice $D$ diagonale telles que $A = P^(-1) D P = ts(P) D P$.

Notons que si $D = op("Diag")(lambda_1, ..., lambda_n)$, alors les $lambda_i$ sont les valeurs propres de $A$, et donc par hypothèse sont positifs.

Soit alors $C = op("Diag")(sqrt(lambda_1), ..., sqrt(lambda_n))$. Il est évident que $C^2 = D$.
Posons alors $B = ts(P) C P = P^(-1) C P$, de sorte que
$ B^2 = ts(P) C underbrace(P ts(P), =I_n) C P = ts(P) C^2 P = ts(P) D P = A. $

De plus, $ts(B) =  attach((ts(P) C P)  , tl: t) = ts(P) ts(C) P = ts(P) C P = B$, donc $B$ est symétrique.
Enfin, puisque $B$ est semblable à $C$, $op("Spec")(B) = op("Spec")(C)$. Or les valeurs propres de $C$ sont les $sqrt(lambda_i) >= 0$, et donc toutes les valeurs propres de $B$ sont positives.
]

#exercice(title: "Projecteurs orthogonaux qui commutent", n_stars: 2)[
Soit $n in NN$ tel que $n >= 3$. $RR^n$ est muni de son produit scalaire canonique. Soient $p, q$ deux projecteurs de $RR^n$ orthogonaux. On suppose que $p compose q$ est un projecteur orthogonal.


+ Montrer que $p compose q = q compose p$.
+ + Montrer que les valeurs propres possibles de $p + q$ sont ${0, 1, 2}$, i.e $Sp(p+q) subset {0,1,2}$.
  + Donner un exemple où ces trois nombres sont effectivement valeurs propres de $p + q$.


]

#correction[
+ Notons $A$ et $B$ les matrices respectives de $p$ et $q$ dans la base canonique.
  Puisque $p$ et $q$ sont des projecteurs orthogonaux, ce sont des endomorphismes symétriques, et la base canonique étant orthonormée, $A$ et $B$ sont symétriques.
  De même, $A B$, qui est la matrice de $p compose q$ est symétrique.
  Et donc $ts((A B)) = A B <=> ts(B) ts(A) = A B <=> B A = A B$.
  On en déduit que $A$ et $B$ commutent, et donc que $p$ et $q$ commutent également.

+ On a
  $ (p + q - 2 id) compose (p + q - id) compose (p + q) &= ((p + q)^2 - 3(p + q) + 2 id) compose (p + q) \
  &= ((p + q)^3 - 3(p + q)^2 + 2(p + q)) \
  &= (p^3 + 3p^2 compose q + 3p compose q^2 + q^3) - 3(p^2 + 2p compose q + q^2) + 2p + 2q \
  &= p + q + 6p compose q - 3p - 6p compose q - 3q + 2p + 2q = 0. $
  Et donc $P = (X - 2)(X - 1)X$ est un polynôme annulateur de $p + q$.
  Puisque les valeurs propres de $p + q$ sont parmi les racines de $P$, on en déduit que les valeurs propres possibles de $p + q$ sont $0, 1$ et $2$.

  Soient $p$ et $q$ les endomorphismes de $RR^3$ dont les matrices respectives dans la base canonique sont
  $ A = mat(1, 0, 0; 0, 1, 0; 0, 0, 0) " et " B = mat(0, 0, 0; 0, 1, 0; 0, 0, 0). $
  Alors il est évident que $p$ et $q$ sont des projecteurs car ils sont diagonalisables et ne possèdent que $0$ et $1$ comme valeurs propres, et sont symétriques car leurs matrices dans la base canonique sont symétriques.
  Ainsi, $p$ et $q$ sont des projecteurs orthogonaux.
  De plus, on a $A B = mat(0, 0, 0; 0, 1, 0; 0, 0, 0)$, et donc par le même raisonnement, $p compose q$ est encore un projecteur orthogonal.
  Enfin, on a $A + B = mat(1, 0, 0; 0, 2, 0; 0, 0, 0)$, qui possède $0, 1$ et $2$ comme valeurs propres, et donc $op("Spec")(p + q) = {0, 1, 2}$.
]
#exercice(title: "Racines carrées, chapitre 2", n_stars: 2)[
Soit $E$ un espace euclidien. Un endomorphisme symétrique $f in cal(L)(E)$ est dit défini positif si pour tout $x in E \\ {0}$, $angle.l f(x), x angle.r > 0$.

+ Soit $f in cal(L)(E)$ tel qu'il existe $g in cal(L)(E)$, symétrique tel que $g^2 = f$. Montrer que $f$ est symétrique et que $forall x in E, angle.l f(x), x angle.r >= 0$.
+ Montrer qu'un endomorphisme symétrique est défini positif si et seulement si $"Spec"(f) subset RR_+^*$.
+ En déduire que si $f$ est symétrique défini positif, alors $f$ est inversible et $f^(-1)$ est encore symétrique défini positif.
+ Soit $f$ un endomorphisme symétrique défini positif de $E$. Montrer qu'il existe $g in cal(L)(E)$, symétrique, défini positif, tel que $g^2 = f$. _Indication : on pourra s'intéresser à la matrice de $f$ dans une base orthonormée de $E$ formée de vecteurs propres de $f$._
]

#correction[


+ Supposons donc qu'il existe $g$ symétrique tel que $f = g^2$. Alors, pour tous $x, y in E$, on a
  $ angle.l f(x), y angle.r = angle.l g^2(x), y angle.r = angle.l g(x), g(y) angle.r = angle.l x, g^2(y) angle.r = angle.l x, f(y) angle.r. $
  Et donc $f$ est symétrique.
  D'autre part, pour $x in E, x != 0$, on a
  $ angle.l f(x), x angle.r = angle.l g^2(x), x angle.r = angle.l g(x), g(x) angle.r = ||g(x)||^2. $
  Donc déjà, $angle.l f(x), x angle.r >= 0$, il suffit de voir que ce produit scalaire est non nul. Mais c'est le cas si et seulement si $g(x) = 0_E$. Mais dans ce cas, on aurait alors $angle.l g(x), x angle.r = angle.l 0_E, x angle.r = 0$, contredisant le fait que $g$ est défini positif.

+ Supposons que toutes les valeurs propres de $f$ soient strictement positives, et soit $(e_1, ..., e_n)$ une base orthonormée de $E$ formée de vecteurs propres de $f$, et soit $lambda_i$ la valeur propre associée à $e_i$.
  Alors, tout vecteur non nul $x$ de $E$ s'écrit de manière unique $x = sum_(i=1)^n x_i e_i$, où les $x_i$ ne sont pas tous nuls. Et alors
  $ angle.l f(x), x angle.r = angle.l sum_(i=1)^n x_i e_i, f(sum_(j=1)^n x_j e_j) angle.r = angle.l sum_(i=1)^n x_i e_i, sum_(j=1)^n x_j lambda_j e_j angle.r = sum_(i=1)^n sum_(j=1)^n x_i x_j angle.l e_i, e_j angle.r = sum_(i=1)^n x_i^2 lambda_i. $
  Puisque les $x_i^2 lambda_i$ sont positifs, $angle.l x, f(x) angle.r >= 0$, et n'étant pas tous nuls, $angle.l x, f(x) angle.r > 0$, de sorte que $f$ est défini positif.

  Inversement, si $f$ est défini positif, soit $lambda$ une valeur propre de $f$ et $x$ un vecteur propre associé. Alors
  $ angle.l x, f(x) angle.r = angle.l x, lambda x angle.r = lambda ||x||^2. $
  Mais par hypothèse, $angle.l x, f(x) angle.r > 0$, et $x$ étant non nul, $||x|| > 0$, de sorte que $lambda = angle.l x, f(x) angle.r / ||x||^2 > 0$.
  Donc toutes les valeurs propres de $f$ sont strictement positives.

+ Si $f$ est défini positif, alors par la question précédente, ses valeurs propres sont toutes non nulles, et donc $f$ est inversible.
  Puisque $f$ est diagonalisable, sa matrice $A$ dans une base orthonormée $cal(B)$ est semblable à une matrice diagonale $D = op("Diag")(lambda_1, ..., lambda_n)$ : il existe $P$ orthogonale telle que $A = ^t P D P$.
  Et alors $A^(-1) = ^t P op("Diag")(lambda_1^(-1), ..., lambda_n^(-1)) P$ ne possède que des valeurs propres strictement positives.
  Mais puisque $A^(-1) = op("Mat")_cal(B) (f^(-1))$, les valeurs propres de $f^(-1)$ sont toutes strictement positives.
  Reste à prouver que $f$ est symétrique. Mais $A$ étant symétrique, $A^(-1)$ l'est également, et donc, $f^(-1)$ est symétrique.

+ Puisque $f$ est symétrique, il existe une base orthonormée $cal(B)$ de $E$ formée de vecteurs propres de $f$.
  Et alors la matrice de $f$ dans cette base est diagonale : $A = op("Diag")(lambda_1, ..., lambda_n)$.
  On a alors $A = (op("Diag")(sqrt(lambda_1), ..., sqrt(lambda_n)))^2$.
  Soit donc $g$ l'unique endomorphisme de $E$ dont la matrice dans la base $cal(B)$ est $B = op("Diag")(sqrt(lambda_1), ..., sqrt(lambda_n))$.
  Puisque $cal(B)$ est orthonormée, et que $B$ est une matrice symétrique, $g$ est un endomorphisme symétrique.
  De plus, $B^2 = A$ donc $g^2 = f$.
  Enfin, les valeurs propres de $g$ sont les $sqrt(lambda_i)$, qui sont tous strictement positifs, donc par la question 2, $g$ est défini positif.
  Et donc $g$ satisfait bien aux conditions de l'énoncé.
]
#exercice(title:"Mauvaise file", n_stars : 2)[
Trois personnes entrent simultanément dans une poste ne comportant que deux guichets. On note $X_i$ le temps passé par la i-ème personne au guichet. Les variables $X_i$ sont supposées mutuellement indépendantes et suivant toutes trois la loi uniforme sur $[0,1]$.

+ Déterminer la fonction de répartition de la variable correspondant au temps que doit attendre la troisième personne pour qu'un guichet se libère, notée $Y$.
+ En déduire que $Y$ admet une densité, et déterminer l'une de ses densités.
+ Déterminer une densité de la variable aléatoire correspondant au temps total que la troisième personne passe dans le bureau de poste, notée $Z$.
+ En déduire $E(Z)$ et $V(Z)$.

]

#correction[
+ Pour tout $x in RR$, on a $[Y > x] = [X_1 > x] inter.big [X_2 > x]$.
  Et donc, par indépendance de $X_1$ et $X_2$, il vient
  $ F_Y (x) & = P(Y <= x) \ & = 1 - P(Y > x) = 1 - P([X_1 > x] inter.big [X_2 > x]) 
  \ & = 1 - P(X_1 > 1) P(X_2 > x) \ & = 1 - (1 - F_(X_1) (x))(1 - F_(X_2) (x)) = cases(
    0 & "si" x <= 0,
    1 - (1 - x)^2 & "si" 0 < x < 1,
    1 & "si" x >= 1
  ) $

+ Puisque $F_(X_1)$ et $F_(X_2)$ sont continues sur $RR$ et de classe $cal(C)^1$ sauf éventuellement en un nombre fini de points, il en est de même de $F_Y$.
  Une densité de $Y$ est alors toute fonction coïncidant avec $F'_Y$ là où $F_Y$ est dérivable. Par exemple, on peut prendre
  $ f_Y (x) = cases(
    0 & "si" x <= 0,
    2(1 - x) & "si" 0 < x < 1,
    0 & "si" x >= 1
  ) $

+ Par le lemme des coalitions, $Y = min(X_1, X_2)$ et $X_3$ sont indépendantes.
  Puisque la densité de $X_3$ est bornée, par produit de convolution, une densité de $Y + X_3$ est alors donnée par
  $ h(x) = integral_(-oo)^(+oo) f_Y (t) f_(X_3) (x - t) dif t. $
  Mais on a $f_Y (t) != 0 <=> 0 <= t <= 1$ et $f_(X_3) (x - t) != 0 <=> 0 <= x - t <= 1 <=> x - 1 <= t <= x$.

  Ainsi, pour $x <= 0$, on a $f_Z (x) = 0$.
  De même, pour $x - 1 >= 1 <=> x >= 2$, on a $f_Z (x) = 0$.
  Si $x in [0, 1]$, il vient
  $ f_Z (x) = integral_0^x 2(1 - t) dif t = [ -(1 - t)^2 ]_0^x = 1 - (1 - x)^2 = 2x - x^2. $

  Enfin, pour $1 <= x <= 2$, on a
  $ f_Z (x) = integral_(x-1)^1 2(1 - t) dif t = (2 - x)^2. $

  Une densité de $Z$ est donc
  $ f_Z (x) = cases(
    2x - x^2 & "si" 0 <= x <= 1,
    4 - 4x + x^2 & "si" 1 < x <= 2,
    0 & "sinon"
  ) $

+ Notons que $0 <= Z <= 2$, de sorte que l'existence de l'espérance de $Z$ est garantie. On a alors
  $ E(Z) = integral_(-oo)^(+oo) t f_Z (t) dif t = integral_0^1 t(2t - t^2) dif t + integral_1^2 t(2 - t)^2 dif t = 5/6. $
  De même, le moment d'ordre 2 de $Z$ est donné par
  $ E(Z^2) = integral_(-oo)^(+oo) t^2 f_Z (t) dif t = integral_0^1 t^2 (2t - t^2) dif t + integral_1^2 t^2 (2 - t)^2 dif t = 5/6. $
  Et donc, par la formule de Huygens, la variance de $Z$ vaut
  $ V(Z) = E(Z^2) - E(Z)^2 = 5/6 - 25/36 = 5/36. $
]

/* #pagebreak() */


/* #pagebreak() */

#exercice(title: "Marche aléatoire", n_stars:2)[
Soit $p in ]0, 1[$. On considère une suite $(X_n)_(n in NN^*)$ de variables aléatoires mutuellement indépendantes, de même loi, et telles que $P(X_1 = -1) = 1 - p$ et $P(X_1 = 1) = p$. \ On pose $S_n = display(sum_(k=1)^n X_k)$.

+ Déterminer deux réels $a$ et $b$ tels que $Y_n = a X_n + b$ suive une loi de Bernoulli de paramètre $p$.
+ En utilisant la question précédente, déterminer la loi de $S_n$ et calculer son espérance.
*Application* :
 #set enum(start: 3) 
  + Un ivrogne sort du bar, et chaque seconde avance d'un mètre vers la droite avec probabilité $p$, ou d'un mètre vers la gauche avec probabilité $1 - p$. \
    En moyenne, où se trouve-t-il après 10 secondes ?
  + Proposer un programme `Python` simulant la marche d'un tel ivrogne pendant 1000 secondes, avec $p = 1/2$.
]

#correction[
  + $Y_n = 1/2 (X_n + 1)$ ne prend que les valeurs 0 et 1, avec $P(Y_n = 1) = P(X_n = 1) = p$, donc suit une loi de Bernoulli $cal(B)(p)$.

+ On a
  $ S_n = sum_(k=1)^n X_k = sum_(k=1)^n (2 Y_k - 1) = 2 sum_(k=1)^n Y_k - n $
  et $sum_(k=1)^n Y_k$ suit une loi binomiale $cal(B)(n, p)$ car les $Y_i$ sont indépendantes.
  De plus, $S_n$ prend ses valeurs dans $⟦ -n, n ⟧$, et donc pour tout $k in ⟦ -n, n ⟧$,
  $ P(S_n = k) & = P(2 sum_(k=1)^n Y_k = k + n) \ & = P(sum_(k=1)^n Y_k  = (k + n) / 2) = cases(
    0 & "si" k + n "est impair",
    binom(n, (k + n) / 2) p^((k + n) / 2) (1 - p)^((2 - k - n) / 2) & "si" k + n "est pair"
  ) $
  On a alors, par linéarité de l'espérance,
  $ E(S_n) = sum_(i=1)^n E(X_i) = sum_(i=1)^n ((-1)(1 - p) + p) = n(2p - 1). $

*Application* :
 #set enum(start: 3)
 + Si on note $X_i$ la variable aléatoire qui vaut 1 si l'ivrogne se déplace vers la gauche et -1 s'il se déplace d'un mètre sur la droite, alors $S_n$ désigne sa position à l'instant $n$.
    En particulier, on a
    $ E(S_10) = 2 times 10 times p - 10 = 20p - 10. $
    *Remarque* : Si $p = 0.5$, alors en moyenne il est revenu à son point de départ, que si $p > 0.5$, alors il se sera en moyenne déplacé vers la gauche, et que si $p < 0.5$, alors il se sera en moyenne déplacé vers la droite.
 + ```python
import random

def simulation_ivrogne(n_secondes, p):
    position = 0
    
    for _ in range(n_secondes):
        tirage = random.random()
        if tirage < p:
            position = position + 1
        else:
            position = position - 1
    return position

duree = 1000    
p = 0.5     

resultat = simulation_ivrogne(duree, proba_p)
print(f"Après {duree} secondes, l'ivrogne est à la position : {resultat}")

  ```
]

