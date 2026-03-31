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

  title: [Calcul différentiel dans $RR^n$],
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 25",
  school: "Lycée Champollion",
  show_correction: false,
  show_info_text: true,
  additional_comments: [
#linebreak()
#linebreak()
Le calcul différentiel ne peut se comprendre et s'apprécier qu'avec une attention particulière donnée à la visualisation. A cet effet, je ne peux que vous conseiller l'excellent calculateur graphique 3D #link("desmos.com.3D")[Desmos]. Un exemple des capacités de cet outil, sur la notion phare du programme d'ECG : #link("https://www.desmos.com/3d/huecrg4oc1")[Gradient comme direction de plus grande pente].
#linebreak()
_“Differential Geometry” contains the word “Geometry.”
A tautology? Well, the undergraduate who ﬁrst opens up the assigned textbook on the subject may care to disagree! In place of geometry, our hapless student is instead confronted with a
profusion of formulas, and their proofs consist of lengthy and opaque computations. If the student is honest
and brave, the professor may be forced to confront an embarrassingly blunt question: “Where has
the geometry gone?!”_ 

-- Tristan Needham, _Visual Differential Geometry_])
#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let Sp = $op("Sp")$
#let dotp(..args) = math.chevron.l + args.pos().join(math.comma) + math.chevron.r

#let ts(arg) = $attach(arg, tl: t)$


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
#exercice(title: "Au galop", n_stars: 2)[
Soit $f : RR^2 -> RR$ définie par
$
f(x, y) = (1 + y + x y - x^2 / 2) e^y.
$

+ Montrer que $f$ est $C^2$ sur $RR^2$, déterminer ses dérivées partielles premières et secondes.
+ Montrer que $f$ admet un unique point critique $(alpha, beta)$.
+ Vérifier que la détermination des valeurs propres de $nabla^2 f(alpha, beta)$ ne suffit pas à déterminer la nature de ce point critique.
+ Déterminer un vecteur propre $u$ de $nabla^2 f(alpha, beta)$ associé à la valeur propre $0$.
+ En étudiant la fonction $t mapsto f((alpha, beta) + t u)$, déterminer la nature du point critique $(alpha, beta)$.
]

#correction[
+ La fonction $(x, y) mapsto 1 + y + x y - x^2 / 2$ est $C^2$ sur $RR^2$ car polynomiale.
  De même, $(x, y) mapsto y$ est $C^2$ sur $RR^2$, et la fonction exponentielle est $C^2$ sur $RR$.
  Par composition, $(x, y) mapsto e^y$ est $C^2$ sur $RR^2$.
  Et donc $f$ est de classe $C^2$ sur $RR^2$ car produit de deux fonctions de classe $C^2$.

  On a alors
  $
  partial_1 f(x, y) = e^y (y - x) quad "et" quad partial_2 f(x, y) = e^y (1 + y + x y - x^2 / 2 + 1 + x).
  $

  En dérivant une seconde fois, il vient
  $
  partial_(1,1) f(x, y) = -e^y, quad partial_(2,2) f(x, y) = e^y (3 + 2x + y + x y - x^2 / 2),
  $
  $
  partial_(1,2) f(x, y) = partial_(2,1) f(x, y) = e^y (y - x + 1).
  $
+ $(x, y)$ est un point critique de $f$ si et seulement si
  $
  cases(
    e^y (y - x) = 0,
    e^y (2 + x + y + x y - x^2 / 2) = 0
  ) <=> cases(
    y = x,
    2 + x + y + x y - x^2 / 2 = 0
  ) <=> cases(
    y = x,
    2 + 2x + x^2 / 2 = 0
  ) <=> cases(
    y = x,
    4 + 4x + x^2 = 0
  ).
  $

  Or $4 + 4x + x^2 = (x + 2)^2$, donc $f$ admet un unique point critique qui est $(-2, -2)$.

+ La matrice hessienne de $f$ en $(-2, -2)$ est
  $
  nabla^2 f(-2, -2) = mat(-e^(-2), e^(-2); e^(-2), -e^(-2)).
  $
  Les deux colonnes sont colinéaires, et donc $0$ est valeur propre de $nabla^2 f(-2, -2)$.
  Ainsi, le signe des valeurs propres de la hessienne ne suffit pas à déterminer la nature du point critique $(-2, -2)$.

+ Les deux premières colonnes sont l'opposée l'une de l'autre, donc $(1, 1)$ est vecteur propre de la hessienne pour la valeur propre $0$.

* Remarque * : Dans le cas d'une fonction d'une variable, si la dérivée et la dérivée seconde en un point sont nulles, on pousse le développement limité à un ordre supérieur pour étudier la nature locale du point critique.
Ici, le vecteur propre associé à la valeur propre $0$ nous indique une direction dans laquelle la formule de Taylor à l'ordre $2$ ne peut conclure, et nous étudions ce qui se passe dans cette direction, à l'aide des outils de première année.

+ La fonction indiquée par l'énoncé est
  $
  g : t mapsto f((-2, -2) + t (1, 1)) = f(-2 + t, -2 + t) = e^(-2 + t)(1 - t + t^2 / 2).
  $

  Un développement limité nous donne alors
  $
  g(t) = e^(-2) e^t (1 - t + t^2 / 2) = e^(-2) (1 + t + t^2 / 2 + t^3 / 6 + o(t^3))(1 - t + t^2 / 2) = e^(-2)(1 + t^3 / 6 + o(t^3)).
  $

  Au voisinage de $0$, $g(t) - g(0) ~ e^(-2) / 6 t^3$, qui est du signe de $t$.
  Ainsi, dans tout voisinage de $0$, $f(-2 + t, -2 + t) - f(-2, -2)$ prend à la fois des valeurs positives et des valeurs négatives.
Donc $f$ n'admet pas d'extrémum local en $(-2, -2)$.
]

