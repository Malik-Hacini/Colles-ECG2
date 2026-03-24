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
#linebreak()
 _Modern statisticians are familiar with the notion that any finite body of data contains only a limited amount of information on any point under examination; that this limit is set by the nature of the data themselves, and cannot be increased by any amount of ingenuity expended in their statistical examination: that the statistician's task, in fact, is limited to the extraction of the whole of the available information on any particular issue._
  
  -- R.A Fisher ])
#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let Sp = $op("Sp")$
#let dotp(..args) = math.chevron.l + args.pos().join(math.comma) + math.chevron.r

#let ts(arg) = $attach(arg, tl: t)$

#exercice(title: "Le lion est mort ce soir", n_stars: 2)[
On cherche à évaluer le nombre $N$ de lions d'Asie, espèce en voie de disparition, encore en vie dans la forêt de Gir.
Pour cela, on capture d'abord en une seule fois $m$ lions ($m in NN^*$), que l'on tatoue avant de les relâcher dans la nature.
On admet que, pendant toute la durée de l'étude, il n'y a ni naissance ni décès, puis l'on utilise l'une des deux méthodes suivantes.

+ *Première méthode*. #linebreak()
  On capture successivement au hasard (donc avec équiprobabilité), et avec remise en liberté après observation du sujet, $n$ lions.
  On note $Y_n$ le nombre de lions tatoués parmi eux.
  + Déterminer la loi de $Y_n$. En déduire que $Y_n/(m n)$ est un estimateur sans biais et convergent de $1/N$.
  + Pourquoi ne peut-on pas prendre $m n / Y_n$ comme estimateur de $N$ ?
  + On pose $B_n = m(n + 1)/(Y_n + 1)$. Calculer l'espérance de $B_n$, et montrer que $B_n$ est un estimateur asymptotiquement sans biais de $N$.
+ *Deuxième méthode.* #linebreak()
  On se donne $n in NN^*$.
  On capture également, un par un, et avec remise en liberté après observation du sujet, des lions de Gir jusqu'à en obtenir $n$ tatoués.
  On note $X_n$ la variable aléatoire égale au nombre de lions qu'il a été nécessaire de capturer pour en obtenir $n$ tatoués.
  On pose $D_1 = X_1$, et pour tout $i in ⟦2, n⟧$, $D_i = X_i - X_(i-1)$.
  On admet que les $D_i$ sont mutuellement indépendantes.
  + Pour tout $i in ⟦2, n⟧$, que représente concrètement $D_i$ ?
  + Déterminer, pour tout $i in ⟦2, n⟧$, la loi de $D_i$, son espérance et sa variance. En déduire l'espérance et la variance de $X_n$.
  + On pose $A_n = m/n X_n$. Montrer que $A_n$ est un estimateur sans biais et convergent de $N$.
]

#correction[
+ Première méthode.
  + Pour tout $i in ⟦1, n⟧$, notons $Z_i$ la variable indicatrice de l'événement « le $i$-ième lion capturé est tatoué ».
    À chaque capture, la probabilité d'obtenir un lion tatoué vaut $m/N$, donc $Z_i$ suit une loi de Bernoulli $cal(B)(m/N)$.
    De plus, les captures étant faites avec remise, les $Z_i$ sont indépendantes.

    Ainsi,
    $
    Y_n = sum_(i=1)^n Z_i,
    $
    donc $Y_n$ suit une loi binomiale $cal(B)(n, m/N)$.

    En particulier,
    $
    E(Y_n) = n m / N,
    $
    d'où
    $
    E(Y_n/(m n)) = 1/N.
    $
    Donc $Y_n/(m n)$ est un estimateur sans biais de $1/N$.

    De plus, comme $Y_n = sum_(i=1)^n Z_i$ avec les $Z_i$ i.i.d., la loi faible des grands nombres donne
    $
    Y_n / n ->_(n -> +infinity) m/N
    $
    en probabilité.
    En multipliant par $1/m$, on obtient
    $
    Y_n/(m n) ->_(n -> +infinity) 1/N,
    $
    donc $Y_n/(m n)$ est aussi un estimateur convergent de $1/N$.

  + Le fait que $Y_n/(m n)$ soit sans biais pour $1/N$ n'implique pas que son inverse soit sans biais pour $N$.
    Plus concrètement, si $m < N$, on a
    $
    P(Y_n = 0) = (1 - m/N)^n > 0,
    $
    de sorte que $m n / Y_n$ n'est même pas toujours défini.

  + Par le théorème de transfert,
    $
    E(B_n) &= sum_(k=0)^n m(n + 1)/(k + 1) P(Y_n = k) \
    &= sum_(k=0)^n m(n + 1)/(k + 1) binom(n, k) (m/N)^k (1 - m/N)^(n-k) \
    &= sum_(k=0)^n m binom(n + 1, k + 1) (m/N)^k (1 - m/N)^(n-k) \
    &= N sum_(j=1)^(n+1) binom(n + 1, j) (m/N)^j (1 - m/N)^((n + 1)-j) \
    &= N(1 - (1 - m/N)^(n + 1)).
    $

    Donc le biais de $B_n$ vaut
    $
    E(B_n) - N = -N(1 - m/N)^(n + 1) ->_(n -> +infinity) 0.
    $
    Ainsi, $B_n$ est un estimateur asymptotiquement sans biais de $N$.

+ Deuxième méthode.
  + Pour tout $i in ⟦2, n⟧$, $D_i$ représente le nombre de lions capturés entre la capture du $(i - 1)$-ième lion tatoué (exclue) et celle du $i$-ième lion tatoué (incluse).

  + À chaque capture, la probabilité d'obtenir un lion tatoué vaut $m/N$.
    Ainsi, pour tout $i in ⟦1, n⟧$, $D_i$ suit une loi géométrique de paramètre $m/N$.
    Donc
    $
    E(D_i) = N/m quad "et" quad V(D_i) = (1 - m/N)/((m/N)^2) = N(N - m)/m^2.
    $

    Or
    $
    X_n = sum_(i=1)^n D_i.
    $
    Par linéarité de l'espérance et indépendance des $D_i$,
    $
    E(X_n) = n N / m quad "et" quad V(X_n) = n N(N - m)/m^2.
    $

  + On a
    $
    E(A_n) = m/n E(X_n) = N,
    $
    donc $A_n$ est sans biais.

    De plus,
    $
    A_n = m (1/n sum_(i=1)^n D_i).
    $
    La loi faible des grands nombres donne
    $
    1/n sum_(i=1)^n D_i ->_(n -> +infinity) N/m
    $
    en probabilité.
    On en déduit
    $
    A_n ->_(n -> +infinity) N
    $
    en probabilité, donc $A_n$ est convergent.
]

#exercice(title: "Maximum de vraisemblance", n_stars: 2)[
Pour $a > 0$, on note
$
f_a (t) = cases(
  0 & "si" t < 1,
  a/t^(a+1) & "si" t >= 1
).
$
On considère alors une suite $(X_n)_(n in NN^*)$ de variables aléatoires i.i.d. de densité $f_a$, où $a$ est inconnu.
Pour $n in NN^*$, on définit une fonction $L_n$ (appelée fonction de vraisemblance) par
$
L_n : quad ([1, +oo[)^n times RR_+^* -> RR_+, #linebreak() quad quad quad (x_1, ..., x_n, a) mapsto product_(i=1)^n f_a (x_i).
$

+ Pour $(x_1, ..., x_n)$ fixés, montrer que $a mapsto L_n (x_1, ..., x_n, a)$ possède un maximum atteint en un unique réel $a$ que l'on exprimera en fonction de $x_1, ..., x_n$.
  On pourra à cet effet étudier les variations de la fonction $a mapsto ln(L_n (x_1, ..., x_n, a))$.

  On a donc trouvé une expression de $a = phi_n(x_1, ..., x_n)$ où $phi_n$ est une fonction définie sur $([1, +oo[)^n$.
  On pose alors $T_n = phi_n(X_1, ..., X_n)$, et on appelle $T_n$ estimateur du maximum de vraisemblance.
+ Montrer que pour $k in ⟦1, n⟧$, $ln(X_k)$ suit une loi exponentielle dont on précisera le paramètre. En déduire une densité de $S_n = ln(X_1) + ... + ln(X_n)$.
+ Exprimer $T_n$ en fonction de $S_n$. En déduire $E(T_n)$ et $V(T_n)$.
+ Montrer que $T_n$ est un estimateur asymptotiquement sans biais et convergent de $a$.
]

#correction[
+ On a
  $
  L_n (x_1, ..., x_n, a) = a^n product_(i=1)^n 1/(x_i^(a+1)),
  $
  de sorte que
  $
  ln(L_n (x_1, ..., x_n, a)) = n ln(a) - (a + 1) sum_(i=1)^n ln(x_i).
  $

  En particulier, la fonction $a mapsto ln(L_n (x_1, ..., x_n, a))$ est dérivable, de dérivée
  $
  n/a - sum_(i=1)^n ln(x_i).
  $
  Cette dérivée est positive si et seulement si
  $
  a <= n/(sum_(i=1)^n ln(x_i)).
  $
  Donc la fonction $a mapsto ln(L_n (x_1, ..., x_n, a))$ admet un maximum en
  $
  a = n/(sum_(i=1)^n ln(x_i)).
  $
  Par croissance de la fonction exponentielle, il en est de même de la fonction $a mapsto L_n (x_1, ..., x_n, a)$.

  Dans la suite, on pose donc
  $
  T_n = n/(sum_(i=1)^n ln(X_i)).
  $

+ Puisque $X_k$ ne prend que des valeurs supérieures à $1$, $ln(X_k)$ ne prend que des valeurs positives, de sorte que
  $
  P(ln(X_k) <= x) = 0
  $
  si $x < 0$.
  Si $x >= 0$, alors
  $
  P(ln(X_k) <= x) = P(X_k <= e^x) = integral_1^(e^x) a/t^(a+1) dif t = [-1/t^a]_1^(e^x) = 1 - e^(-a x).
  $
  Donc $ln(X_k)$ suit une loi exponentielle de paramètre $a$.

  On en déduit que $a ln(X_k)$ suit une loi exponentielle de paramètre $1$, et donc que $a S_n$ admet pour densité
  $
  g_n(t) = cases(
    0 & "si" t <= 0,
    1/((n - 1)!) t^(n-1) e^(-t) & "si" t > 0
  ).
  $
  Par transformation affine des densités, une densité de $S_n$ est alors
  $
  t mapsto a g_n(a t) = cases(
    0 & "si" t <= 0,
    a^n/((n - 1)!) t^(n-1) e^(-a t) & "si" t > 0
  ).
  $

+ On a $T_n = n/S_n$.
  Donc, par le théorème de transfert, sous réserve de convergence,
  $
  E(T_n) &= integral_0^(+oo) n/t (a^n/((n - 1)!)) t^(n-1) e^(-a t) dif t \
  &= n a^2/((n - 1)!) integral_0^(+oo) (a t)^(n-2) e^(-a t) dif t.
  $
  Un changement de variable $x = a t$ donne alors
  $
  E(T_n) &= n a^2/((n - 1)!) integral_0^(+oo) x^(n-2) e^(-x) dif x / a \
  &= a n/((n - 1)!) (n - 2)! = a n/(n - 1).
  $

  De même, toujours sous réserve de convergence,
  $
  E(T_n^2) &= integral_0^(+oo) n^2/t^2 (a^n/((n - 1)!)) t^(n-1) e^(-a t) dif t \
  &= n^2 a^3/((n - 1)!) integral_0^(+oo) (a t)^(n-3) e^(-a t) dif t.
  $
  Le même changement de variable donne
  $
  E(T_n^2) &= n^2 a^3/((n - 1)!) integral_0^(+oo) x^(n-3) e^(-x) dif x / a \
  &= n^2 a^2/((n - 1)!) (n - 3)! = n^2 a^2/((n - 1)(n - 2)).
  $

  La formule de Huygens donne alors
  $
  V(T_n) = E(T_n^2) - E(T_n)^2 = n^2 a^2/((n - 1)(n - 2)) - n^2 a^2/((n - 1)^2) = n^2 a^2/((n - 1)^2 (n - 2)).
  $

+ On a déjà
  $
  b(T_n) = E(T_n) - a = a/(n - 1) ->_(n -> +infinity) 0,
  $
  donc $T_n$ est un estimateur asymptotiquement sans biais de $a$.

  Et la variance de $T_n$ en $a$ vaut :
  $
V(T_n) = n^2 a^2/((n - 1)^2 (n - 2))->_(n -> +infinity) 0.
  $
On en déduit que $T_n$ est un estimateur convergent de $a$.
]

#exercice(title: "Brutal", n_stars: 3)[
Soient $n >= 1$ et $(X_1, ..., X_n)$ un échantillon identiquement distribué indépendant de loi de Poisson de paramètre $lambda > 0$ inconnu.
On pose
$
macron(X)_n = 1/n sum_(i=1)^n X_i quad "et" quad T_n = sqrt(n) (macron(X)_n - lambda)/sqrt(lambda).
$

En utilisant $T_n$, déterminer un intervalle de confiance asymptotique de $lambda$ au niveau de risque $alpha$.
]

#correction[
Par le théorème central limite, $T_n$ converge en loi vers une variable aléatoire $X$ suivant la loi normale centrée réduite.
Donc, pour tous réels $a < b$,
$
lim_(n -> +infinity) P(a <= T_n <= b) = P(a <= X <= b) = Phi(b) - Phi(a).
$

En particulier, soit $t_alpha$ l'unique réel tel que $Phi(t_alpha) = 1 - alpha/2$.
Alors
$
lim_(n -> +infinity) P(-t_alpha <= sqrt(n) (macron(X)_n - lambda)/sqrt(lambda) <= t_alpha) = 1 - alpha.
$

Soit encore
$
lim_(n -> +infinity) P(lambda - t_alpha/sqrt(n) sqrt(lambda) <= macron(X)_n <= lambda + t_alpha/sqrt(n) sqrt(lambda)) = 1 - alpha.
$

Mais
$
lambda - t_alpha/sqrt(n) sqrt(lambda) = (sqrt(lambda) - t_alpha/(2 sqrt(n)))^2 - t_alpha^2/(4n)
$
et de même
$
lambda + t_alpha/sqrt(n) sqrt(lambda) = (sqrt(lambda) + t_alpha/(2 sqrt(n)))^2 - t_alpha^2/(4n).
$

Donc
$
lim_(n -> +infinity) P((sqrt(lambda) - t_alpha/(2 sqrt(n)))^2 - t_alpha^2/(4n) <= macron(X)_n <= (sqrt(lambda) + t_alpha/(2 sqrt(n)))^2 - t_alpha^2/(4n)) = 1 - alpha.
$

Pour $n$ suffisamment grand, on a $sqrt(lambda) - t_alpha/(2 sqrt(n)) >= 0$, et l'événement précédent équivaut à
$
[ (sqrt(macron(X)_n + t_alpha^2/(4n)) - t_alpha/(2 sqrt(n)))^2 <= lambda <= (sqrt(macron(X)_n + t_alpha^2/(4n)) + t_alpha/(2 sqrt(n)))^2 ].
$

On en déduit que
$
lim_(n -> +infinity) P((sqrt(macron(X)_n + t_alpha^2/(4n)) - t_alpha/(2 sqrt(n)))^2 <= lambda <= (sqrt(macron(X)_n + t_alpha^2/(4n)) + t_alpha/(2 sqrt(n)))^2) = 1 - alpha.
$

Ainsi, un intervalle de confiance asymptotique de $lambda$ au niveau de confiance $1 - alpha$ est
$
[ (sqrt(macron(X)_n + t_alpha^2/(4n)) - t_alpha/(2 sqrt(n)))^2, (sqrt(macron(X)_n + t_alpha^2/(4n)) + t_alpha/(2 sqrt(n)))^2 ].
$
]

#exercice(title: "Optimisation Convexe", n_stars: 2)[
Soit $n in NN$ tel que $n >= 2$. L'espace vectoriel $RR^n$ est muni de sa structure euclidienne canonique, le produit scalaire étant noté $dotp(., .)$ et la norme associée $norm(.)$.
Soit $f$ une application de classe $C^1$ définie sur $RR^n$, à valeurs dans $RR$, convexe, c'est-à-dire vérifiant pour tout $(x, y) in (RR^n)^2$ et pour tout réel $lambda in [0, 1]$ :
$
f((1 - lambda)x + lambda y) <= (1 - lambda)f(x) + lambda f(y).
$

Pour tout $(h, x) in (RR^n)^2$ fixé, on définit la fonction $phi_(h,x)$ de la variable réelle $t$ par :
$
phi_(h,x) (t) = f(x + t h).
$

+ + Montrer que $phi_(h,x)$ est une fonction convexe de $RR$ dans $RR$.
  + En déduire que $phi_(h,x)'(0) <= phi_(h,x) (1) - phi_(h,x) (0)$.
+ Montrer que pour tout $(x, y) in (RR^n)^2$, on a
  $
  dotp(nabla f(x), y - x) <= f(y) - f(x).
  $
  En déduire que si $x$ est un point critique de $f$, alors $f$ possède un minimum, atteint en $x$.
+ On suppose dans cette question que $f(0) = 0$ et que $nabla f(0) = 0$.
  On suppose également que $f$ est strictement convexe, c'est-à-dire qu'elle vérifie pour tout $(x, y) in (RR^n)^2$, tels que $x != y$, pour tout réel $lambda in ]0, 1[$ :
  $
  f((1 - lambda)x + lambda y) < (1 - lambda)f(x) + lambda f(y).
  $
  + Montrer que pour tout $x in RR^n$, $f(0) <= f(x)$, puis que si $x != 0$, alors $f(x) != 0$.
  + Montrer que $inf_(x in RR^n, norm(x) = 1) f(x)$ existe. On note $alpha$ cette valeur. Montrer que $alpha > 0$.
  + Montrer que pour tout $norm(x) > 1$, $abs(f(x)) >= alpha norm(x)$. En déduire la valeur de $lim_(norm(x) -> +infinity) f(x)$.
]

#correction[
+ + Il s'agit de revenir à la définition : soient $t_1, t_2 in RR$ et $lambda in [0, 1]$. Alors
    $
    phi_(h,x) (lambda t_1 + (1 - lambda)t_2) &= f(x + (lambda t_1 + (1 - lambda)t_2) h) \
    &= f(lambda(x + t_1 h) + (1 - lambda)(x + t_2 h)) \
    &<= lambda f(x + t_1 h) + (1 - lambda)f(x + t_2 h) \
    &= lambda phi_(h,x) (t_1) + (1 - lambda) phi_(h,x) (t_2).
    $
    Donc $phi_(h,x)$ est convexe.
  + $phi_(h,x)$ étant convexe, ses cordes sont au-dessus de ses tangentes.
    En particulier, la tangente en $0$ est la droite d'équation $y = phi_(h,x)'(0)t + phi_(h,x) (0)$.
    Donc pour $t = 1$, on a $phi_(h,x) (1) >= phi_(h,x)'(0) + phi_(h,x) (0)$ soit encore
    $
    phi_(h,x)'(0) <= phi_(h,x) (1) - phi_(h,x) (0).
    $
+ On sait que $phi_(h,x)'(0) = dotp(nabla f(x), h)$.
  En particulier, si on prend $h = y - x$, alors il vient
  $
  dotp(nabla f(x), y - x) <= phi_(y-x,x) (1) - phi_(y-x,x) (0) = f(y) - f(x).
  $

  En particulier, si $x$ est un point critique de $f$, $nabla f(x) = 0$ et donc pour tout $y in RR^n$,
  $
  0 <= f(y) - f(x) <=> f(x) <= f(y).
  $
  $f$ possède alors un minimum en $x$.
+ + Pour $x = 0$, la relation précédente donne pour tout $y in RR^n$,
    $
    0 <= f(y).
    $
    S'il existait un $x != 0$ tel que $f(x) = 0$, alors il viendrait
    $
    f((0 + x)/2) < (f(0) + f(x))/2 = 0.
    $
    Ceci est contradictoire avec $f(y) >= 0$ pour tout $y in RR^n$.
  + La sphère unité $S = {x in RR^n | norm(x) = 1}$ est fermée et bornée dans $RR^n$.
    Comme $f$ est continue, la restriction de $f$ à $S$ atteint ses bornes, en particulier son minimum.
    Ainsi, l'infimum
    $
    alpha = inf_(x in RR^n, norm(x) = 1) f(x)
    $
    existe.

    De plus, pour tout $x in S$, on a $x != 0$, donc d'après la question précédente $f(x) != 0$.
    Or on sait aussi que $f(x) >= 0$ pour tout $x in RR^n$.
    Donc, pour tout $x in S$, $f(x) > 0$.

    Si $alpha = 0$, comme le minimum est atteint sur $S$, il existerait $x_0 in S$ tel que $f(x_0) = 0$, ce qui contredirait ce qui précède.
    Par conséquent, $alpha > 0$.
  + Soit $x in RR^n$ tel que $norm(x) > 1$, et posons $u = x / norm(x)$.
    Alors $norm(u) = 1$, donc par définition de $alpha$, on a $f(u) >= alpha$.

    De plus,
    $
    u = 1/(norm(x)) x + (1 - 1/(norm(x))) 0
    $
    avec $1 / norm(x) in ]0, 1[$.
    Par convexité de $f$ et comme $f(0) = 0$,
    $
    f(u) <= 1/(norm(x)) f(x).
    $
    Ainsi,
    $
    alpha <= f(u) <= f(x) / norm(x),
    $
    donc
    $
    f(x) >= alpha norm(x).
    $
    Comme $f(x) >= 0$, on a bien $abs(f(x)) = f(x) >= alpha norm(x)$.

    Puisque $alpha > 0$ et $alpha norm(x) ->_(norm(x) -> +infinity) +infinity$, on en déduit par comparaison que
    $
    lim_(norm(x) -> +infinity) f(x) = +infinity.
    $
]
