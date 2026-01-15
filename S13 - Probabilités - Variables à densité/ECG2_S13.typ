#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Probabilités : Variables à densité",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaines 12 et 13",
  school: "Lycée Champollion",
  show_correction: true,
  show_info_text: true,
  additional_comments: [
 #linebreak()
 #linebreak()

  _Rappelons-nous qu’autrefois, et à une époque qui n’est pas encore bien reculée, une pluie ou une sécheresse extrême, une comète traînant après elle une queue fort étendue, les éclipses, les aurores boréales et généralement tous les phénomènes extraordinaires étaient regardés comme autant de signes de la colère céleste. On invoquait le ciel pour détourner leur funeste influence. [En réalité,] la courbe décrite par une simple molécule d’air ou de vapeurs, est réglée d’une manière aussi certaine, que les orbites planétaires : il n’y a de differences entre elles, que celle qu’y met notre ignorance. La probabilité est relative en partie à cette ignorance, en partie à nos connaissances._

   -- Pierre Simon de Laplace
 ]
)

#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}


#exercice(title: "Le lion n'est pas mort ce soir", n_stars:1)[


La nuit, dans la savane, un lion se rend à la rivière pour boire et y reste un quart d’heure.
Après de nombreuses observations, on estime que l’instant d’arrivée $T$ du lion à la rivière se situe entre 0h (minuit) et 2h du matin. De plus, la variable aléatoire $T$, exprimée en heures, admet une densité de probabilité $f$ définie par :

$ f(t) = cases(
  3/4 t(2 - t) & "si" 0 <= t <= 2,
  0 & "sinon."
) $

+ Vérifier que $f$ est une densité de probabilité.

+ Un observateur se présente à la rivière à 0h30 min et y reste un quart d’heure. Quelle est la probabilité pour qu’il aperçoive le lion?

]

#correction[

+ 
  #sym.bullet $f$ est continue sur $RR backslash  {0,2}$.

  #sym.bullet Pour tout $t in [0, 2]$, on a $t >= 0$ et $2 - t >= 0$. Le produit est donc positif.
    En dehors de $[0, 2]$, $f$ est nulle.
    Ainsi, $forall t in RR, f(t) >= 0$.

  #sym.bullet Calculons l'intégrale de $f$ :
    $ integral_(-oo)^(+oo) f(t) dif t &= integral_0^2 3/4 t(2 - t) dif t \
    &= 3/4 integral_0^2 (2t - t^2) dif t \
    &= 3/4 [ t^2 - t^3/3 ]_0^2 \
    &= 3/4 ( (12 - 8)/3 ) = 3/4 times 4/3 = 1. $

  $f$ est bien une densité de probabilité.

+ 
 L'observateur est présent sur l'intervalle de temps $I = [1/2, 3/4]$.
 Le lion arrive à l'instant $T$ et reste 15 minutes. Il est donc présent sur l'intervalle $I_L = [T, T + 1/4]$.

 L'événement "l'observateur aperçoit le lion" correspond à l'intersection des intervalles de présence : $I_L inter I_O != emptyset$.
  Cela se traduit par le système d'inégalités suivant:
  $ (T + 1/4 >= 1/2) "et" (T <= 3/4) $
  $ arrow.l.r.double T >= 1/4 "et" T <= 3/4 $

  On cherche donc la probabilité $P(1/4 <= T <= 3/4)$.
  
  $ P(1/4 <= T <= 3/4) &= integral_(1/4)^(3/4) f(t) dif t \
  &= 3/4 integral_(1/4)^(3/4) (2t - t^2) dif t \
  &= 3/4 [ t^2 - t^3/3 ]_(1/4)^(3/4). $

  Une bonne dose de calcul nous donne finalement : 
  $ P(1/4 <= T <= 3/4) = 81/256 - 11/256 = 70/256 = 35/128. $

  La probabilité que l'observateur aperçoive le lion est de $35/128 approx 0.273$.

]

#exercice(title: "Matrice aléatoire", n_stars:2)[
 Soit $X$ une variable aléatoire qui suit la loi normale $cal(N)(0, 4)$. On pose $M = mat(2X, 1; -4, X)$. Déterminer la probabilité que $M$ admette deux valeurs propres distinctes.
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

#exercice(title: "Cordes aléatoires", n_stars:3)[
On considère le cercle de centre O et de rayon 1. On s'intéresse à la longueur d'une corde de ce cercle perpendiculaire à la droite (AB) lorsque cette corde est choisie "au hasard". 
Le plan est muni du repère $(O, vec(O A), vec(O D))$.

+ Première méthode. On considère que la corde aléatoire est déterminée par son milieu $H$ qui appartient au diamètre $[A B]$. On appelle $X$ l'abscisse de ce milieu et on fait l'hypothèse que $X$ suit une loi uniforme sur $[-1, 1]$.
  + Calculer la longueur $L_1$ de la corde en fonction de $X$.
  + Par des considérations d'aires et sans chercher à trouver une primitive, calculer
    $ integral_(-1)^1 sqrt(1 - x^2) dif x . $
  + En déduire la valeur moyenne de la fonction $x mapsto sqrt(1 - x^2)$ sur l'intervalle $[-1, 1]$, puis l'espérance de $L_1$.

+ Deuxième méthode. On considère que la corde aléatoire est déterminée par le choix d'une de ses extrémités $M$ sur le demi-cercle $ hat(A D B)$. On appelle $T$ une mesure de l'angle orienté $hat(B O M)$ et on fait l'hypothèse que $T$ suit une loi uniforme sur $[0, pi]$.
  + Calculer la longueur $L_2$ de la corde en fonction de $T$.
  + En déduire l'espérance de $L_2$.

+ A la lumière de ces deux méthodes, quel commentaire peut-on faire concernant l'espérance de la longueur d'une corde aléatoire ?

+ Épilogue : une troisième méthode.
  + Montrer que pour tout réel $ell in [0, 2]$, il existe une unique corde orthogonale à $[A B]$, dont une extrémité $M$ est sur le quart de cercle $hat(B D)$ et dont la longueur vaut $ell$. Il en est de même si l'extrémité $M$ se situe sur le quart de cercle $hat(D A)$. \
    On tire alors au hasard une corde orthogonale à $[A B]$ de la façon suivante : on lance d'abord une pièce équilibrée. Si elle tombe sur pile, on décide que l'extrémité $M$ se situe sur le quart de cercle $hat(B D)$ et si elle tombe sur face, on décide que l'extrémité $M$ se situe sur le quart de cercle $hat(D A)$. Une fois cette décision prise, on positionne la corde en tirant au hasard sa longueur de façon uniforme sur l'intervalle $[0, 2]$.
  + Quelle est l'espérance de la longueur $L_3$ de la corde ainsi tirée au hasard ?
]

#correction[
+
  Avant tout, un schéma pour bien situer le problème : 

  #figure(
    image("figures/cercle.png", width: auto, height: auto),
    caption: [Corde choisie aléatoirement par son milieu],
  ) <fimg-label>
  + Par le théorème de Pythagore, $X^2 + (L_1/2)^2 = 1$. Comme $L_1$ est positif, on en déduit donc que $L_1 = 2 sqrt(1 - X^2)$.
  + Le demi-cercle $hat(B D A)$ est le graphe de la fonction $f(x) = sqrt(1 - x^2)$ sur l'intervalle $[-1, 1]$. L'intégrale $integral_(-1)^1 sqrt(1 - x^2) dif x$ correspondant à l'aire sous la courbe, cette intégrale vaut l'aire d'un demi disque de rayon 1. On a donc
    $ integral_(-1)^1 sqrt(1 - x^2) dif x = pi / 2 . $
  + La valeur moyenne de la fonction $x mapsto sqrt(1 - x^2)$ sur l'intervalle $[-1, 1]$ vaut donc
    $ 1/2 integral_(-1)^1 sqrt(1 - x^2) dif x = pi / 4 . $
    Par la formule de transfert, l'espérance de $L_1$ vaut
    $ E[L_1] = 2 times E[sqrt(1 - X^2)] = 2 times 1/2 integral_(-1)^1 sqrt(1 - x^2) dif x = pi / 2 approx 1,57 . $

+
  + On a $L_2 = 2 sin T$.
  + Par la formule de transfert,
    $ E[L_2] = 2 times E[sin T] = 2 integral_0^pi sin t (dif t) / pi = 2 / pi [-cos t]_0^pi = 4 / pi approx 1,27 . $

+ Tout le problème est de savoir ce que veut dire l'expression "tirer une corde au hasard". Il y a derrière cette question un problème de modélisation. Les deux méthodes proposées nous indiquent seulement que le résultat dépend évidemment de la modélisation utilisée : un angle et un milieu choisis uniformément ne correspondent pas aux mêmes longueurs moyennes.

+
  + Notons $x$ l'abscisse du point $M$. D'après la première question, la longueur de la corde correspondante est $sqrt(1 - x^2)$ et on a $0 <= x <= 1$. Il suffit alors de remarquer que si $0 <= ell <= 2$, l'équation $sqrt(1 - x^2) = ell$ a une unique solution (il s'agit de $x = sqrt(1 - (ell/2)^2)$). Bien sûr, le point $M$ sur le quart de cercle étudié est uniquement déterminé par son abscisse.
  + Si le tirage amène face, la corde choisie a sa longueur qui suit une loi uniforme sur $[0, 2]$, donc sa longueur moyenne est 1. Si le tirage amène pile, la corde choisie a sa longueur qui suit une loi uniforme sur $[0, 2]$, donc sa longueur moyenne est 1. L'espérance de $L_3$ vaut donc
    $ E(L_3) = 1/2 times 1 + 1/2 times 1 = 1 . $
    Voici une rédaction plus formelle. Soit $epsilon$ une variable aléatoire qui vaut 1 si la pièce tombe sur pile et -1 si la pièce tombe sur face. Considérons ensuite une variable aléatoire $U$, indépendante de $epsilon$ qui suit une loi uniforme sur $[0, 2]$. Au vu de la façon dont est tirée au hasard la corde, sa longueur $L_3$ vérifie l'égalité en loi :
    $ L_3 = bb(1)_(epsilon=1) U + bb(1)_(epsilon=-1) U = U . $
    Ainsi
    $ E[L_3] = E[U] = integral_0^2 u (dif u) / 2 = 1 . $
    Remarque : si $X$ désigne l'abscisse du point $M$, on a $X = epsilon sqrt(1 - (U/2)^2)$.
]
