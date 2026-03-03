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

  title: align(center)[Convergence de variables aléatoires -#linebreak() Projections Orthogonales],
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 21",
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
#let dotp(..args) = math.chevron.l + args.pos().join(math.comma) + math.chevron.r

#let ts(arg) = $attach(arg, tl: t)$

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

  * Remarque * : Nous n’avons pas vraiment utilisé le fait que $p$ et $q$ soient des projecteurs, mais seulement qu’ils soient symétriques. Plus généralement, la composée de deux endomorphismes symétriques est symétrique si et seulement si ces deux endomorphismes commutent.
+ On a #footnote[Puisque p et q commutent,
on peut utiliser le binôme
de Newton pour calculer
$(p + q)^k$. Le calcul est laissé au lecteur.]
  $ (p + q - 2 id) compose (p + q - id) compose (p + q) &= ((p + q)^2 - 3(p + q) + 2 id) compose (p + q) \
  &= ((p + q)^3 - 3(p + q)^2 + 2(p + q)) \
  &=0. $

  Et donc $P = (X - 2)(X - 1)X$ est un polynôme annulateur de $p + q$.
  Puisque les valeurs propres de $p + q$ sont parmi les racines de $P$, on en déduit que les valeurs propres possibles de $p + q$ sont $0, 1$ et $2$.

  Soient $p$ et $q$ les endomorphismes de $RR^3$ dont les matrices respectives dans la base canonique sont
  $ A = mat(1, 0, 0; 0, 1, 0; 0, 0, 0) " et " B = mat(0, 0, 0; 0, 1, 0; 0, 0, 0). $
  Alors il est évident que $p$ et $q$ sont des projecteurs car ils sont diagonalisables et ne possèdent que $0$ et $1$ comme valeurs propres, et sont symétriques car leurs matrices dans la base canonique sont symétriques.
  Ainsi, $p$ et $q$ sont des projecteurs orthogonaux.
  De plus, on a $A B = mat(0, 0, 0; 0, 1, 0; 0, 0, 0)$, et donc par le même raisonnement, $p compose q$ est encore un projecteur orthogonal.
  Enfin, on a $A + B = mat(1, 0, 0; 0, 2, 0; 0, 0, 0)$, qui possède $0, 1$ et $2$ comme valeurs propres, et donc $op("Spec")(p + q) = {0, 1, 2}$.
]

#exercice(title: "Convergence en probabilité via Markov", n_stars: 1)[
Soit $(X_n)$ une suite de variables aléatoires à valeurs positives, ayant toutes une espérance et une variance.
On suppose que
$
lim_(n -> +infinity) E(X_n) = m "et" lim_(n -> +infinity) V(X_n) = 0.
$

En appliquant l'inégalité de Markov à $(X_n - m)^2$, montrer que $X_n$ converge en probabilité vers $m$.
]

#correction[
Notons que $(X_n - m)^2$ est positive, et admet une espérance car
$
(X_n - m)^2 = X_n^2 - 2m X_n + m^2
$
et que $X_n$ admet un moment d'ordre 2.

En particulier,
$
E((X_n - m)^2) = E(X_n^2) - 2m E(X_n) + m^2 = V(X_n) + E(X_n)^2 - 2m E(X_n) + m^2.
$

Donc, pour tout $epsilon > 0$, d'après l'inégalité de Markov,
$
P(abs(X_n - m) >= epsilon) = P((X_n - m)^2 >= epsilon^2) <= E((X_n - m)^2)/epsilon^2 = (V(X_n) + E(X_n)^2 - 2m E(X_n) + m^2)/epsilon^2.
$

Or, lorsque $n -> +infinity$, on a $V(X_n) -> 0$ et
$
E(X_n)^2 - 2m E(X_n) + m^2 -> m^2 - 2m^2 + m^2 = 0.
$

Ainsi, pour tout $epsilon > 0$,
$
P(abs(X_n - m) >= epsilon) -> 0.
$

On en déduit que $X_n$ converge en probabilité vers $m$.
]
#exercice(title: "Convergence d'un produit de variables aléatoires", n_stars: 1)[
Soit $(U_n)_(n in NN^*)$ une suite de variables aléatoires indépendantes, définies sur le même espace probabilisé $(Omega, cal(A), P)$, et de même loi uniforme sur $]0, 1]$.
On pose, pour tout $n in NN^*$,
$
X_n = product_(i=1)^n U_i^(1/n) "et" Y_n = (e X_n)^sqrt(n).
$

Montrer que la suite de variables aléatoires $(ln Y_n)_(n in NN^*)$ converge en loi vers une variable aléatoire dont on précisera la loi.
]

#correction[
Pour tout $n in NN^*$, on a
$
ln Y_n = sqrt(n)(1 + ln(X_n)) = sqrt(n)(1 + 1/n sum_(i=1)^n ln(U_i)) = (n + sum_(i=1)^n ln(U_i))/sqrt(n).
$

Posons $S_n = sum_(i=1)^n ln(U_i)$ et, pour tout $i in NN^*$, $T_i = ln(U_i)$. Alors
$
ln Y_n = (S_n + n)/sqrt(n).
$

Les variables $(T_i)$ sont i.i.d. De plus, par le théorème de transfert,
$
E(T_1) = integral_0^1 ln(t) dif t = lim_(A -> 0^+) [t ln(t) - t]_A^1 = -1.
$

Et
$
E(T_1^2) = integral_0^1 (ln(t))^2 dif t = lim_(A -> 0^+) integral_A^1 (ln(t))^2 dif t.
$

Par intégration par parties,
$
integral_A^1 (ln(t))^2 dif t = [t (ln(t))^2]_A^1 - 2 integral_A^1 ln(t) dif t = -A (ln(A))^2 + 2 A ln(A) + 2 - 2A ->_(A -> 0^+) 2.
$

Donc $E(T_1^2) = 2$ et
$
V(T_1) = E(T_1^2) - E(T_1)^2 = 2 - 1^2 = 1.
$

Ainsi, pour tout $n$,
$
(S_n - E(S_n))/sqrt(V(S_n)) = (S_n - n E(T_1))/sqrt(n V(T_1)) = (S_n + n)/sqrt(n) = ln Y_n.
$

Par le théorème central limite, la suite $(ln Y_n)_(n in NN^*)$ converge en loi vers une variable aléatoire $X$ suivant la loi normale centrée réduite $cal(N)(0, 1)$.
]


#exercice(title: "Minimum géométrique", n_stars: 2)[
Soit $(X_n)_(n in NN^*)$ une suite de variables aléatoires indépendantes suivant toutes la loi géométrique de paramètre $p in ]0, 1[$.
On pose
$
Y_n = min(X_1, dots, X_n).
$

Étudier la convergence en loi de $(Y_n)_(n >= 1)$.
]

#correction[
Soit $k in NN^*$. On a
$
P(Y_n >= k) = P(inter.big_(i=1)^n [X_i >= k]).
$

Par indépendance des $X_i$,
$
P(Y_n >= k) = product_(i=1)^n P(X_i >= k) = P(X_1 >= k)^n.
$

Or
$
P(X_1 >= k) = sum_(i=k)^(+oo) P(X_1 = i) = sum_(i=k)^(+oo) p(1 - p)^(i - 1)
= p(1 - p)^(k - 1) sum_(j=0)^(+oo) (1 - p)^j = (1 - p)^(k - 1).
$

Donc
$
P(Y_n >= k) = (1 - p)^(n(k - 1)).
$

On en déduit
$
P(Y_n = k) = P(Y_n >= k) - P(Y_n >= k + 1) = (1 - p)^(n(k - 1))(1 - (1 - p)^n).
$

Comme les $Y_n$ sont à valeurs dans $NN^*$, il suffit d'étudier la limite de $P(Y_n = k)$ pour tout $k in NN^*$.
Or $(1 - p) in ]0, 1[$, donc $(1 - p)^n ->_(n -> +infinity) 0$.

Ainsi,
$
lim_(n -> +infinity) P(Y_n = k) = cases(
  1 & "si" k = 1,
  0 & "sinon"
).
$

Donc $(Y_n)$ converge en loi vers une variable aléatoire certaine égale à $1$.
]
