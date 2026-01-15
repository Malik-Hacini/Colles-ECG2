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

]

#exercice(title: "Nilpotence", n_stars:2)[
  Soit $ n >= 2$ et $A$ une matrice nilpotente d'indice $p>1$ de $cal(M)_n (RR)$, c'est à dire que $A^p = 0$ et $A^(p-1) eq.not 0$.
+ Montrer que $p<=n$.

+ Montrer, par deux méthodes, que $Sp(A) = {0}.$

+ En déduire que pour tout $k in NN^*$,  $tr(A^k) = 0$.

+ $A$ est elle diagonalisable ?
]

#correction[
]


#exercice(title: "Pas à pas", n_stars:3)[
Soit $n in NN^*$. Déterminer toutes les matrices A de $cal(M)_2 (RR)$ telles que $ A^n = mat( 1, 1 ; 0 , 1). $
]

#correction[

]

