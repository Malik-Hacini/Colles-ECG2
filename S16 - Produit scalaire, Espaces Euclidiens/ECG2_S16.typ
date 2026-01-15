#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Produit scalaire, Espaces Euclidiens",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 16",
  school: "Lycée Champollion",
  show_correction: true,
  show_info_text: true,
  additional_comments: [
#linebreak()


L'algèbre linéaire constitue un des trois grands blocs du programme d'ECG, avec l'analyse et les probabilités. Dans le cadre de la prépa, elle peut paraître abstraite et remplie de calculs à rallonge, notations, théorèmes et concepts abscons.

Cependant, cette théorie à émergée de l'idée simple d'étuder les systèmes linéaires sous l'angle de la *géométrie*, ce qui a débouché sur l'axiomatisation des espaces vectoriels comme concept général fondateur. Il ne faut donc jamais perdre de vue notre amie géométrie, car son omniprésence sera le phare de notre voyage dans une nuit abstraite.

  A cet effet, je recommande ardamment l'excellente série de vidéos #link("https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab")[Essence of Linear Algebra] de la chaîne 3blue1brown (en anglais sous titré français).  Le chapitre 9 (Produit scalaire et Dualité) explique en particulier la notion fondamentale de l'introduction à l'algèbre bilinéaire au programme d'ECG.

  Je suis persuadé que quelques heures de méditation sur cette présentation de l'algèbre linéaire au cours de l'année vous sera infiniment plus utile qu'un enchaînement machinal d'exercices. En effet, leur réalité évidente sous-jacente vous resterait pour toujours invisible avec des yeux calculatoires.


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
#pagebreak()

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
#exercice(title: "Familles presque orthorgonales (ESCP)", n_stars:3)[
Soit $mu >= 1$, et soit $E$ un espace euclidien de produit scalaire $angle.l dot, dot angle.r$.
Une famille $(u_1,dots, u_n)$ de vecteurs de $E$ est dite $mu$-presque orthogonale si :

  #sym.bullet pour tout $i in ⟦1, n⟧, norm(u_i) = 1$

  #sym.bullet pour tout $(x_1, dots, x_n) in RR^n, 1/mu sum_(i=1)^n x_i^2 <= norm( sum_(i=1)^n x_i u_i )^2 <= mu sum_(i=1)^n x_i^2$.

+ Montrer qu'une famille $mu$-presque orthogonale est libre.

+ Soit $(u_1, dots, u_n)$ une famille de vecteurs de $E$. Montrer que $(u_1, dots, u_n)$ est 1-presque orthogonale si et seulement si elle est orthonormée.

+ Soit $f$ un endomorphisme de $E$.
  #set enum(numbering: "a)")
  + Montrer qu'il existe un réel $k$ tel que $forall x in E, norm(f(x)) <= k norm(x)$.
  + Montrer que si $f$ est un automorphisme de $E$, alors il existe un réel $lambda >= 1$ tel que $forall x in E, 1/lambda norm(x) <= norm(f(x)) <= lambda norm(x)$.

+ Soit $n in NN^*$ et soit $(u_1, dots, u_n)$ une famille libre de vecteurs unitaires de $E$.
  Montrer l'existence d'un réel $mu >= 1$ tel que $(u_1, dots, u_n)$ soit $mu$-presque orthogonale.
]

#correction[

+ Soit $(u_1, dots, u_n)$ une famille $mu$-presque orthogonale, et soient $x_1, dots, x_n$ des réels tels que $sum_(i=1)^n x_i u_i = 0_E$. Alors, on a
  $ 0 <= 1/mu sum_(i=1)^n x_i^2 <= norm( sum_(i=1)^n x_i u_i )^2 = norm(0_E)^2 = 0. $
  On en déduit que $sum_(i=1)^n x_i^2 = 0$, et donc pour tout $i in ⟦1, n⟧, x_i = 0$.
  Ainsi, la famille $(u_1, dots, u_n)$ est libre.

+ Soit $(u_1, dots, u_n)$ une famille orthonormée. Alors, pour tout $(x_1, dots, x_n) in RR^n$, on a
  $ norm( sum_(i=1)^n x_i u_i )^2 = sum_(i=1)^n x_i^2. $
  Et donc $(u_1, dots, u_n)$ est 1-presque orthogonale.

  Inversement, supposons que $(u_1, dots, u_n)$ est 1-presque orthogonale. Alors par définition, les $u_i$ sont tous unitaires.
  Soient alors $(i, j) in ⟦1, n⟧^2$, avec $i != j$. On a alors
  $ norm(u_i + u_j)^2 = norm(u_i)^2 + norm(u_j)^2 + 2 angle.l u_i, u_j angle.r = 2(1 + angle.l u_i, u_j angle.r). $
  Mais $u_i + u_j$ n'est autre que la combinaison linéaire $sum_(k=1)^n x_k u_k$ où les $x_k$ sont tous nuls, sauf $x_i$ et $x_j$ qui valent tous les deux 1.
  Et donc on a $sum_(k=1)^n x_k^2 = 2$.
  Or, la famille étant 1-presque orthogonale, il vient
  $ 1/1 sum_(k=1)^n x_k^2 <= norm(u_i + u_j)^2 <= sum_(k=1)^n x_k^2 arrow.l.r.double 2 <= 2(1 + angle.l u_i, u_j angle.r) <= 2. $
  Et donc $2(1 + angle.l u_i, u_j angle.r) = 2 arrow.l.r.double angle.l u_i, u_j angle.r = 0$.
  Ceci prouve donc que $(u_1, dots, u_n)$ est orthogonale, et donc orthonormée.

+ 
  + Considérons une base orthonormée $(e_1, dots, e_n)$ de $E$. Alors pour tout $x in E$, il existe des réels $x_1, dots, x_n$ tels que $x = sum_(i=1)^n x_i e_i$, et donc $norm(x)^2 = sum_(i=1)^n x_i^2$.
    D'autre part, on a $f(x) = sum_(i=1)^n x_i f(e_i)$.
    Et donc
    $ norm(f(x))^2 = norm( sum_(i=1)^n x_i f(e_i) )^2 <= ( sum_(i=1)^n |x_i| dot norm(f(e_i)) )^2. $
    Appliquons alors l'inégalité de Cauchy-Schwarz dans $RR^n$ :
    $ ( sum_(i=1)^n |x_i| dot norm(f(e_i)) )^2 <= ( sum_(i=1)^n |x_i|^2 ) ( sum_(i=1)^n norm(f(e_i))^2 ). $
    Et donc $norm(f(x))^2 <= norm(x)^2 times ( sum_(i=1)^n norm(f(e_i))^2 )$.
    Ainsi, en posant $k = sqrt(sum_(i=1)^n norm(f(e_i))^2)$, qui est bien une constante indépendante de $x$, on a
    $ norm(f(x)) <= k norm(x). $

  + Si $f$ est un automorphisme, alors le résultat de la question précédente s'applique en particulier à $f^(-1)$ : il existe $k in RR$ tel que pour tout $x in E, norm(f^(-1)(x)) <= k norm(x)$.
    En particulier, si l'on applique ceci à $f(x)$ au lieu de $x$, il vient
    $ norm(f^(-1)(f(x))) <= k norm(f(x)) arrow.l.r.double norm(x) <= k norm(f(x)). $
    Notons que l'expression de $k$ trouvée à la question précédente prouve qu'on peut supposer $k$ strictement positif, puisque, $f^(-1)$ étant un automorphisme, les $f^(-1)(e_i)$ sont non nuls, et donc $sqrt(sum_(i=1)^n norm(f^(-1)(e_i))^2) > 0$.
    On a donc $1/k norm(x) <= norm(f(x))$.
    D'autre part, il existe une constante $M$ telle que $forall x in E, norm(f(x)) <= M norm(x)$.
    Notons alors $lambda = max(M, k)$, de sorte que $M <= lambda$ et $1/lambda <= 1/k$.
    On a alors bien, pour tout $x in E$,
    $ 1/lambda norm(x) <= norm(f(x)) <= lambda norm(x). $

+ Soit $(u_1, dots, u_n)$ une famille libre de vecteurs unitaires, et soit $F = "Vect"(u_1, dots, u_n)$.
  Soit alors $(e_1, dots, e_n)$ une base orthonormée de $F$, et soit $f$ l'unique endomorphisme de $F$ tel que $f(e_i) = u_i$.
  Alors $f$ est un automorphisme puisque l'image de la base $(e_1, dots, e_n)$ est une famille libre de $F$, et donc une base de $F$.
  Par la question 3.b, il existe donc une constante $lambda >= 1$ telle que
  $ forall x in F, 1/lambda norm(x) <= norm(f(x)) <= lambda norm(x). $
  En particulier, pour $(x_1, dots, x_n) in RR^n$, soit $x = sum_(i=1)^n x_i e_i$.
  Alors $norm(x)^2 = sum_(i=1)^n x_i^2$ et $norm(f(x))^2 = norm( sum_(i=1)^n x_i u_i )^2$.
  Et donc
  $ 1/lambda^2 norm(x)^2 <= norm(f(x))^2 <= lambda^2 norm(x)^2 arrow.l.r.double 1/lambda^2 sum_(i=1)^n x_i^2 <= norm( sum_(i=1)^n x_i u_i )^2 <= lambda^2 sum_(i=1)^n x_i^2. $
]
