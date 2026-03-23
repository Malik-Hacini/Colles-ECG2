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

  title: "Estimation statistique - Calcul différentiel",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 23",
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

#exercice(title: "Caractérisation d'un projecteur orthogonal", n_stars: 2)[
Soit $E$ un espace euclidien, et $p$ un projecteur de $E$.
Montrer que $p$ est un projecteur orthogonal si et seulement si
$
forall x in E, norm(p(x)) <= norm(x).
$
]

#correction[
Supposons d'abord que $p$ est un projecteur orthogonal.
Pour tout $x in E$, on a
$
x = p(x) + (x - p(x))
$
et $p(x) perp (x - p(x))$.
Par le théorème de Pythagore,
$
norm(x)^2 = norm(p(x))^2 + norm(x - p(x))^2,
$
d'où $norm(p(x)) <= norm(x)$ pour tout $x in E$.

Réciproquement, supposons que
$
forall x in E, norm(p(x)) <= norm(x),
$
et supposons que $p$ est le projecteur sur $F$ parallèlement à $G$.
Prenons $x in F$ et $y in G$, et posons, pour tout $t in RR$,
$
f(t) = norm(x + t y)^2.
$
Alors
$
f(t) = norm(x)^2 + 2t dotp(x, y) + t^2 norm(y)^2.
$
De plus, $p(x + t y) = x$, donc
$
norm(x) = norm(p(x + t y)) <= norm(x + t y),
$
c'est-à-dire $f(0) <= f(t)$ pour tout $t in RR$.
La fonction $f$ admet donc un minimum en $0$, ainsi $f'(0) = 0$, ce qui donne
$
2 dotp(x, y) = 0.
$
Donc $dotp(x, y) = 0$ pour tous $x in F$ et $y in G$, c'est-à-dire $F perp G$.
Ainsi, $p$ est un projecteur orthogonal.
]

#exercice(title: "Méthode des moindres carrés ", n_stars: 2)[
Soient $n, p in NN$ tels que $p <= n$. On munit $RR^n$ du produit scalaire canonique et on identifie $RR^n$ à $cal(M)_(n,1)(RR)$.
Soit $A in cal(M)_(n,p)(RR)$ de rang $p$ et $B in cal(M)_(n,1)(RR)$.

+ Montrer qu'il existe une unique matrice $X_0 in cal(M)_(p,1)(RR)$ telle que
  $
  norm(A X_0 - B) = inf_(X in cal(M)_(p,1)(RR)) norm(A X - B).
  $
+ Montrer que $X_0$ est l'unique solution de
  $
  ts(A) A X = ts(A) B.
  $
+ Application : déterminer
  $
  inf_((x,y) in RR^2) ((x + y - 1)^2 + (x - y)^2 + (2x + y + 2)^2).
  $
]

#correction[
+ Puisque $A$ est de rang $p$, l'application $X mapsto A X$ de $cal(M)_(p,1)(RR)$ vers $op("Im")(A)$ est injective.
  Donc
  $
  inf_(X in cal(M)_(p,1)(RR)) norm(A X - B) = inf_(Y in op("Im")(A)) norm(Y - B).
  $
  Le second membre est la distance de $B$ au sous-espace vectoriel $op("Im")(A)$.
  Comme $op("Im")(A)$ est de dimension finie, cette distance est atteinte en un unique point, le projeté orthogonal de $B$ sur $op("Im")(A)$, que l'on note $A X_0$.
  L'unicité de $X_0$ découle alors de l'injectivité de $X mapsto A X$.

+ On a
  $
  A X_0 "est le projeté orthogonal de" B "sur" op("Im")(A)
  <=> forall X in cal(M)_(p,1)(RR), A X_0 - B perp A X.
  $
  Cela équivaut à
  $
  forall X in cal(M)_(p,1)(RR), ts(A X) (A X_0 - B) = 0
  <=> forall X in cal(M)_(p,1)(RR), ts(X) (ts(A) A X_0 - ts(A) B) = 0.
  $
  Donc $ts(A) A X_0 = ts(A) B$.
  Réciproquement, cette équation implique l'orthogonalité précédente, donc elle caractérise bien $X_0$, et la solution est unique.

+ Posons
  $
  A = mat(1, 1; 1, -1; 2, 1), quad B = mat(1; 0; -2).
  $
  L'expression à minimiser est $norm(A X - B)^2$ pour $X = mat(x; y)$.
  Le minimum est atteint en la solution $X_0$ de $ts(A) A X = ts(A) B$.
  Or
  $
  ts(A) A = mat(6, 2; 2, 3), quad ts(A) B = mat(-3; -1).
  $
  On trouve $X_0 = mat(-1/2; 0)$.
  Ainsi
  $
  inf_((x,y) in RR^2) ((x + y - 1)^2 + (x - y)^2 + (2x + y + 2)^2) = 7/2.
  $
]

#exercice(title: "Calcul de distance", n_stars: 2)[
Calculer
$
inf_(a,b in RR) integral_0^1 (x^2 - a x - b)^2 dif x.
$
]

#correction[
Posons $E = cal(C)([0,1])$ muni du produit scalaire
$
dotp(f, g) = integral_0^1 f(t) g(t) dif t.
$
On a
$
integral_0^1 (x^2 - a x - b)^2 dif x = norm(x^2 - (a x + b))^2.
$
Lorsque $(a,b)$ parcourt $RR^2$, la fonction $a x + b$ parcourt $F = op("Vect")(1, x)$.
Donc
$
inf_(a,b in RR) integral_0^1 (x^2 - a x - b)^2 dif x = inf_(f in F) norm(x^2 - f)^2.
$

Cette borne est atteinte pour $f = p_F(x^2)$, projection orthogonale de $x^2$ sur $F$.
Posons $p_F(x^2) = a x + b$.
Les conditions
$x^2 - (a x + b) perp 1$ et $x^2 - (a x + b) perp x$
donnent
$
cases(
  integral_0^1 (x^2 - (a x + b)) dif x = 0,
  integral_0^1 (x^3 - (a x^2 + b x)) dif x = 0
).
$

On trouve $a = 1$ et $b = -1/6$, donc $p_F(x^2) = x - 1/6$.
Ainsi
$
norm(x^2 - p_F(x^2)) = 1/sqrt(180),
$
et finalement
$
inf_(a,b in RR) integral_0^1 (x^2 - a x - b)^2 dif x = 1/180.
$
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
