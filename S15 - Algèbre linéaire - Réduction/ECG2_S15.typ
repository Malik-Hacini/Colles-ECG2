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

