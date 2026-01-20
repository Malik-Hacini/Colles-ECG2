#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Algèbre bilinéaire / Vecteurs aléatoires.",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 17",
  school: "Lycée Champollion",
  show_correction: false,
  show_info_text: true,
  additional_comments: [
#linebreak()

/*

L'algèbre linéaire constitue un des trois grands blocs du programme d'ECG, avec l'analyse et les probabilités. Dans le cadre de la prépa, elle peut paraître abstraite et remplie de calculs à rallonge, notations, théorèmes et concepts abscons.

Cependant, cette théorie à émergée de l'idée simple d'étuder les systèmes linéaires sous l'angle de la *géométrie*, ce qui a débouché sur l'axiomatisation des espaces vectoriels comme concept général fondateur. Il ne faut donc jamais perdre de vue notre amie géométrie, car son omniprésence sera le phare de notre voyage dans une nuit abstraite.

  A cet effet, je recommande ardamment l'excellente série de vidéos #link("https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab")[Essence of Linear Algebra] de la chaîne 3blue1brown (en anglais sous titré français).  Le chapitre 9 (Produit scalaire et Dualité) explique en particulier la notion fondamentale de l'introduction à l'algèbre bilinéaire au programme d'ECG.

  Je suis persuadé que quelques heures de méditation sur cette présentation de l'algèbre linéaire au cours de l'année vous sera infiniment plus utile qu'un enchaînement machinal d'exercices. En effet, leur réalité évidente sous-jacente vous resterait pour toujours invisible avec des yeux calculatoires.
*/

  _Algebra is the offer made by the devil to the mathematician. The devil says: "I will give you this powerful machine, it will answer any question you like. All you need to do is give me your soul: give up geometry and you will have this marvelous machine._ -- Michael Atiyah
])

#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let Sp = $op("Sp")$
#let dotp(..args) = math.angle.l + args.pos().join(math.comma) + math.angle.r

#exercice(title: "Produits scalaires, normes et angles", n_stars: 1)[
Soient $E$ un $RR$-espace vectoriel muni d'un produit scalaire  $dotp(dot, dot  )$ et $X$, $Y$ deux vecteurs non nuls de $E$. On définit l'angle orienté $theta in [0, pi]$ entre $X$ et $Y$ par $theta = arccos(dotp(X   , Y) / (norm(X)norm(Y)))$.

  + + Justifier que $theta$ est bien défini, puis que $dotp(X   , Y) = norm(X)norm(Y)cos(theta)  $.
  + On définit le projeté orthogonal de $X$ parallèlement à $Y$ par $ p_Y (X) = norm(X)cos(theta) Y =dotp(X  , Y)e_Y , quad "avec" e_Y = Y / norm(Y). $ Vérifier la cohérence géométrique de cette définition pour $E=RR^2$. 
  + 
   + Montrer que $norm(X+Y)^2 = norm(X)^2 + norm(Y)^2 + 2 norm(X)norm(Y)cos(theta)  $. 
   + En déduire le théorème de Pythagore.

]

#correction[
  + D'après l'inégalité de Cauchy-Shwarz,  $abs( dotp(X  , Y)) <= norm(X)norm(Y) <=> abs( dotp(X  , Y)) /( norm(X)norm(Y) ) <= 1. $ La quantité en question appartient donc bien au domaine de définition de la fonction $arccos$.
  + Méditer la figure suivante, disponible #link("desmos.com/calculator/rhvqwxqwjs")[ici] en version interactive:
    #figure(
    image("figures/produitscalaire.png", width: 80%),
    caption: [Produit scalaire et projection orthogonale],
    ) <fig-produit> 
  + 
   + Il suffit de développer $dotp(X+Y  , X+Y)$ en utilisant la bilinéarité et la symétrie du  produit scalaire.
   + $X perp Y <=> dotp(X  , Y) = 0 <=> theta = pi/2 <=> norm(X+Y)^2 = norm(X)^2 + norm(Y)^2.$     

]

#exercice(title: "Perturbation d'une famille orthonormée", n_stars:2)[
Soient $E$ un $RR$-espace vectoriel muni d'un produit scalaire  $dotp(dot, dot  )$, $(e_1, dots, e_n)$ une famille orthonormée de $E$ et $x_1, dots, x_n in E$ des vecteurs pour lesquels $norm(x_1)^2 + dots + norm(x_n)^2 < 1$. \ Montrer que la famille $(e_1 + x_1, dots, e_n + x_n)$ est libre. 
]

#correction[
Soient $lambda_1, dots, lambda_n in RR$ tels que :
$ sum_(i=1)^n lambda_i (e_i + x_i) = 0 <=>
 sum_(i=1)^n lambda_i e_i = - sum_(i=1)^n lambda_i x_i. $

En prenant la norme, on obtient :$ norm(sum_(i=1)^n lambda_i e_i) = norm(sum_(i=1)^n lambda_i x_i). $
La famille $(e_i)_(1 <= i <= n)$ étant orthonormale, le théorème de Pythagore assure que :
$ norm(sum_(i=1)^n lambda_i e_i) = sqrt(sum_(i=1)^n lambda_i^2). $

Pour le membre de droite, appliquons successivement l'inégalité triangulaire et l'inégalité de Cauchy-Schwarz:
$ norm(sum_(i=1)^n lambda_i x_i) <= sum_(i=1)^n |lambda_i| norm(x_i) <= ( sqrt(sum_(i=1)^n lambda_i^2) ) ( sqrt(sum_(i=1)^n norm(x_i)^2) ). $

En notant $S = sqrt(sum_(i=1)^n lambda_i^2)$, on réecrit l'inégalité:
$ S <= S dot sqrt(sum_(i=1)^n norm(x_i)^2) <=>
S ( 1 - sqrt(sum_(i=1)^n norm(x_i)^2) ) <= 0. $

Par hypothèse, $sum_(i=1)^n norm(x_i)^2 < 1$, donc $1 - sqrt(sum_(i=1)^n norm(x_i)^2) > 0$. La seule solution possible est donc $S = 0$.
Par conséquent, pour tout $i in {1, dots, n}$, $lambda_i = 0$.

La famille $(e_1 + x_1, dots, e_n + x_n)$ est donc libre.
]

#exercice(title: "Un choix judicieux", n_stars: 2)[
  Considérons le $RR$-espace vectoriel $RR_n [X]$ et l'application $Phi$ suivante :
  $ Phi : RR_n [X]^2 &-> RR \
        (P, Q) &|-> sum_(i=0)^n P(i)Q(i) $ 
+ Montrer que $(RR_n [X], Phi)$ est un espace vectoriel euclidien.

+ Orthonormaliser la famille libre ${1, X}$ pour ce produit scalaire.

+ Soit $k in ⟦0, n⟧$. Déterminer l'orthogonal de $H_k (X) = display(product_(i=0 \ i eq.not k)^n (X - i))$.

+ En déduire une BON de $(RR_n [X], Phi)$.
]

#correction[
  + 
   #sym.bullet #h(0.5em) $Phi$ est à valeurs dans le corps de base de $RR[X]$. \
   #sym.bullet #h(0.5em) Soient $(P, Q) in RR_n [X]^2$ fixés quelconques. En utilisant la commutativité de la multiplication dans $RR$,
   $ Phi(Q, P) = sum_(i=0)^n Q(i)P(i) = sum_(i=0)^n P(i)Q(i) = Phi(P, Q) $
   donc $Phi$ est symétrique. \
   #sym.bullet #h(0.5em) Soient $(P_1, P_2, alpha_1, alpha_2, Q) in RR_n [X]^2 times RR^2 times RR_n [X]$ fixés quelconques.
   $ Phi(alpha_1 P_1 + alpha_2 P_2, Q) & = sum_(i=0)^n (alpha_1 P_1(i) + alpha_2 P_2(i)) Q(i) \ & = alpha_1 sum_(i=0)^n P_1(i)Q(i) + alpha_2 sum_(i=0)^n P_2(i)Q(i) \ & = alpha_1 Phi(P_1, Q) + alpha_2 Phi(P_2, Q) $
   donc $Phi$ est linéaire en sa première variable d'où la bilinéarité puis qu'elle est symétrique. \
   #sym.bullet #h(0.5em) Soit $P in RR_n [X]$ fixé quelconque.
   $ Phi(P, P) = sum_(i=0)^n P(i)^2 >= 0 $
   donc $Phi$ est positive. \
   #sym.bullet #h(0.5em) Soit $P in RR_n [X]$ fixé quelconque tel que $Phi(P, P) = 0$. alors $sum_(i=0)^n P(i)^2 = 0$ donc $forall i in ⟦0, n⟧, Phi(i) = 0$ donc $P$ admet au moins $(n + 1)$ racines distinctes ${0, 1, dots, n}$, or $P$ est de degré inférieur ou égal à $n$ donc $P$ est le polynôme nul. Par conséquent, $Phi$ est définie.

   Ainsi, $Phi$ est un produit scalaire, or $RR_n [X]$ est un espace de dimension finie donc $(RR_n [X], Phi)$ est un espace vectoriel euclidien.

+ $E_0 (X) = 1 / norm(1) = 1 / sqrt(n + 1)$.
  $ E_1 (X) = (X - angle.l X | E_0 angle.r E_0) / norm(X - angle.l X | E_0 angle.r E_0). $
  Or $angle.l X | 1 angle.r = display(sum_(i=0)^n i = (n(n + 1)) / 2)$ d'où $X - angle.l X | E_0 angle.r E_0 = X - n / 2$.

  $ norm(X - n / 2)^2 &= sum_(i=0)^n (i - n / 2)^2 \
  &= sum_(i=0)^n i^2 - n sum_(i=0)^n i + ((n + 1) n^2) / 4 \
  &= (n(n + 1)(2 n + 1)) / 6 - ((n + 1) n^2) / 2 + ((n + 1) n^2) / 4 \
  &= (n(n + 1)(n + 2)) / 12 $

  d'où $E_1 (X) = (2 sqrt(3)) / sqrt(n(n + 1)(n + 2)) (X - n / 2)$. 
  
  * Remarque * : Si l'on pousse l'orthonormalisation plus loin, on se retrouve à devoir calculer les sommes $sum_(i=0)^(n) i^k$ avec $k>2$, qui ne sont pas immédiatement connues. Il est donc extrêmement fastidieux d'obtenir une BON de $RR_n [X]$ en partant de la base canonique. Dans cette optique, il est plus judicieux de réfléchir directement sur l'expression du produit scalaire $Phi$ pour construire une BON. 
+ Soit $P in RR_n [X]$ fixé quelconque.
  $ P in H_k (X)^perp &<=> angle.l P | H_k angle.r = 0 \
  & <=>sum_(i=0)^n P(i) H_k (i) = 0 \
  & <=> P(k)n!/k (-1)^n = 0 quad "car" H(k) = n!/k (-1)^n \
  & <=> P(k) = 0 $
  Ainsi, $H_k (X)^perp$ est l'hyperplan vectoriel ${P in RR_n [X] | P(0) = k}$, c'est-à-dire le noyau de la forme linéaire "évaluation en $X = k$".

+ Tout polynôme qui s'annule en $i$ appartient à $H_i (X)^(perp)$, et $H_i$ s'annule pour tout $j eq.not i$ donc les $H_k$ sont orthogonaux deux à deux. La famille ${H_k}_(k in bracket.double 0 , n bracket.double.r)$de cardinal $dim(RR_n [X]) = n +1 $ est donc orthogonale maximale.

  Il suffit alors de la normaliser. Or, par les propriétés précédentes des $H_k$, il est immédiat de voir que $norm(H_k) = H_k (k) = product_(i=0)^(n) (k - i)  $. Alors, on définit la famille ${L_k}_(k in bracket.double 0, n bracket.double.r)$ par
  $ L_k (X) = (H_k (X)) / norm(H_k (X)) = (display(product_(i=0 \ i eq.not k )^(n) (X- i) ))/ display(product_(i=0 \ i eq.not k)^(n) (k - i) ) $
   La famille précédente est une BON de $(RR_n [X], Phi)$.

  *Remarque* : Les $L_k$ sont les polynômes d'interpolation de Lagrange associés aux points ${0,1,dots,n}$. La méthode précédente se généralise aisément à tout produit scalaire de la forme $sum_(i=0)^(n) P(a_i)Q(a_i)$ en considérant les polynômes de Lagrange associés aux points deux à deux dinstincts ${a_0, a_1, ... a_n}$.
]
#exercice(title: "Mauvais tireur", n_stars:1)[
Théo fait du tir à l'arc sur une cible circulaire de rayon 1. On suppose que Théo est suffisamment maladroit pour que le point d'impact $M$ de coordonnées $(X, Y)$ soit uniformément distribué sur la cible. On note $D = \{ (x, y) in RR^2; x^2 + y^2 <= 1 \}$.

+ Quelle est la densité du couple $(X, Y)$ ?
+ Déterminer les lois marginales de $X$ et de $Y$.
+ Les variables aléatoires $X$ et $Y$ sont-elles indépendantes ?
]


#correction[
+ D'après l'énoncé, on a
  $ p_((X, Y)) (x, y) = 1/pi bb(1)_D (x, y) $
  la constante $1/pi$ permettant de normaliser cette densité (son intégrale vaut 1).

+ On applique la formule du cours :
  $ p_X (x) = integral_RR p_((X, Y)) (x, y) dif y = 2/pi sqrt(1 - x^2) bb(1)_([-1, 1]) (x). $
  Par symétrie du rôle joué par $X$ et $Y$, on a aussi
  $ p_Y (y) = integral_RR p_((X, Y)) (x, y) dif x = 2/pi sqrt(1 - y^2) bb(1)_([-1, 1]) (y). $

+ Soit $I = J = [3/4, 1]$. Il est clair que $P(X in I) > 0$ et que $P(Y in J) > 0$. D'autre part, puisque $(3/4)^2 + (3/4)^2 > 1$, on a aussi
  $ P(X in I, Y in J) = 0. $
  Ainsi,
  $ P(X in I, Y in J) != P(X in I) P(Y in J) $
  et donc les variables aléatoires $X$ et $Y$ ne sont pas indépendantes.
]


#exercice(title: "Mauvaise file", n_stars : 2)[

Trois personnes entrent simultanément dans une poste ne comportant que deux guichets. On note $X_i$ le temps passé par la i-ème personne au guichet. Les variables $X_i$ sont supposées mutuellement indépendantes et suivant toutes trois la loi uniforme sur $[0,1]$.

+ Déterminer la fonction de répartition de la variable correspondant au temps que doit attendre la troisième personne pour qu'un guichet se libère, notée $Y$.
+ En déduire que $Y$ admet une densité, et déterminer l'une de ses densités.
+ Déterminer une densité de la variable aléatoire correspondant au temps total que la troisième personne passe dans le bureau de poste, notée $Z$.
+ En déduire $E(Z)$ et $V(Z)$.

]

#correction[
+ Pour tout $x in RR$, on a $[Y > x] = [X_1 > x] inter.big [X_2 > x]$.
  Et donc, par indépendance de $X_1$ et $X_2$, il vient
  $ F_Y (x) = P(Y <= x) = 1 - P(Y > x) = 1 - P([X_1 > x] inter.big [X_2 > x]) $
  $ = 1 - P(X_1 > 1) P(X_2 > x) = 1 - (1 - F_(X_1) (x))(1 - F_(X_2) (x)) = cases(
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


#exercice(title: "Minimum", n_stars:2)[
Un sac contient $N$ boules numérotées de 1 à $N$. On effectue dans ce sac $n$ tirages uniformes d'une boule avec remise et on note $Z_n$ le plus petit numéro obtenu. Déterminer la loi de $Z_n$.
]

#correction[
Commençons par remarquer que $Z_n (Omega) = ⟦ 1, N ⟧$.
Notons $X_i$ le numéro de la boule obtenue lors du $i$-ème tirage, de sorte que $X_i arrow.r.hook cal(U)(⟦ 1, N ⟧)$.
De plus, les tirages ayant lieu avec remise, $X_1, dots, X_n$ sont mutuellement indépendantes.
On a alors $Z_n = min(X_1, dots, X_n)$.

Pour tout $k in ⟦ 1, N ⟧$, on a donc $[Z_n >= k] = display(inter.big_(i=1)^n [X_i >= k])$, et par indépendance des $X_i$,
$ P(Z_n >= k) = product_(i=1)^n P(X_i >= k) = P(X_1 >= k)^n. $

Or $P(X_1 >= k) = sum_(ell=k)^N P(X_1 = ell) = sum_(ell=k)^N 1/N = (N - k + 1) / N$.

Ainsi, il vient $P(Z_n >= k) = ((N - k + 1) / N)^n$.

Enfin, puisque $Z_n$ est à valeurs entières, on a $[Z_n >= k] = [Z_n = k] union [Z_n >= k + 1]$, de sorte que
$ P(Z_n >= k) = P(Z_n = k) + P(Z_n >= k + 1) <=> P(Z_n = k) = P(Z_n >= k) - P(Z_n >= k + 1). $

Et donc, pour tout $k in ⟦ 1, N ⟧$,
$ P(Z_n = k) = ((N - k + 1) / N)^n - ((N - k) / N)^n. $

Notons que pour $k = N$, on obtient $P(Z_n = N) = 1/N^n$, ce qui était prévisible, puisque le seul moyen que la plus petite des boules porte le numéro $N$ est d'avoir tiré $n$ fois la boule $N$.
]

#exercice(title: "Marche aléatoire", n_stars:2)[
Soit $p in ]0, 1[$. On considère une suite $(X_n)_(n in NN^*)$ de variables aléatoires mutuellement indépendantes, de même loi, et telles que $P(X_1 = -1) = 1 - p$ et $P(X_1 = 1) = p$. On pose $S_n = sum_(k=1)^n X_k$.

+ Déterminer deux réels $a$ et $b$ tels que $Y_n = a X_n + b$ suive une loi de Bernoulli de paramètre $p$.
+ En utilisant la question précédente, déterminer la loi de $S_n$ et calculer son espérance.
+ *Application* : un ivrogne sort du bar, et chaque seconde avance d'un mètre vers la droite avec probabilité $p$, ou d'un mètre vers la gauche avec probabilité $1 - p$. \
  En moyenne, où se trouve-t-il après 10 secondes ?]

#correction[
  + $Y_n = 1/2 (X_n + 1)$ ne prend que les valeurs 0 et 1, avec $P(Y_n = 1) = P(X_n = 1) = p$, donc suit une loi de Bernoulli $cal(B)(p)$.

+ On a
  $ S_n = sum_(k=1)^n X_k = sum_(k=1)^n (2 Y_k - 1) = 2 sum_(k=1)^n Y_k - n $
  et $sum_(k=1)^n Y_k$ suit une loi binomiale $cal(B)(n, p)$ car les $Y_i$ sont indépendantes.
  De plus, $S_n$ prend ses valeurs dans $⟦ -n, n ⟧$, et donc pour tout $k in ⟦ -n, n ⟧$,
  $ P(S_n = k) = P(2 sum_(k=1)^n Y_k = k + n) = P(sum_(k=1)^n Y_k = (k + n) / 2) = cases(
    0 & "si" k + n "est impair",
    binom(n, (k + n) / 2) p^((k + n) / 2) (1 - p)^((2 - k - n) / 2) & "si" k + n "est pair"
  ) $
  On a alors, par linéarité de l'espérance,
  $ E(S_n) = sum_(i=1)^n E(X_i) = sum_(i=1)^n ((-1)(1 - p) + p) = n(2p - 1). $

 + Si on note $X_i$ la variable aléatoire qui vaut 1 si l'ivrogne se déplace vers la gauche et -1 s'il se déplace d'un mètre sur la droite, alors $S_n$ désigne sa position à l'instant $n$.
    En particulier, on a
    $ E(S_10) = 2 times 10 times p - 10 = 20p - 10. $
    _Remarquons que si $p = 0.5$, alors en moyenne il est revenu à son point de départ, que si $p > 0.5$, alors il se sera en moyenne déplacé vers la gauche, et que si $p < 0.5$, alors il se sera en moyenne déplacé vers la droite._
]


