#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Algèbre linéaire : Élements propres ",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 8",
  school: "Lycée Champollion",
  show_correction: true,
  show_info_text: true,
  additional_comments: [
 #linebreak()
 #linebreak()

 L'algèbre linéaire constitue un des trois grands blocs du programme d'ECG, avec l'analyse et les probabilités. Dans le cadre de la prépa, elle peut paraître abstraite et remplie de calculs à rallonge, notations, théorèmes et concepts abscons.

Cependant, cette théorie à émergée de l'idée simple d'étuder les systèmes linéaires sous l'angle de la *géométrie*, ce qui a débouché sur l'axiomatisation des espaces vectoriels comme concept général fondateur. Il ne faut donc jamais perdre de vue notre amie géométrie, car son omniprésence sera le phare de notre voyage dans une nuit abstraite.

  A cet effet, je recommande ardemment l'excellente série de vidéos #link("https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab")[Essence of Linear Algebra] de la chaîne 3blue1brown (en anglais sous titré français). Je suis persuadé que quelques heures de méditation sur cette présentation de l'algèbre linéaire au cours de l'année vous sera infiniment plus utile qu'un enchaînement machinal d'exercices. En effet, leur réalité évidente sous-jacente vous resterait pour toujours invisible avec des yeux calculatoires.

  _Algebra is the offer made by the devil to the mathematician. The devil says: "I will give you this powerful machine, it will answer any question you like. All you need to do is give me your soul: give up geometry and you will have this marvelous machine._ -- Michael Atiyah
]
)

#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let dsum = $plus.circle$

/* #pagebreak() */

#exercice(title: "Petites questions", n_stars:1)[
Soit $E$ un $RR$-espace vectoriel et $f$ un endomorphisme de $E$.

+ Dans cette question, on suppose qu'il existe $ n in NN^*$ tel que $0$ est valeur propre de $f^n$. Montrer que $0$ est valeur propre de $f$.
+ Dans cette question, on suppose $E$ de dimension finie. Montrer que $ 0 in.not  op("Sp")(f) <==> f "surjectif" $
+ Dans cette question, on suppose que $f$ est un automorphisme. Déterminer les valeurs propres de $f^(-1)$ en fonction des valeurs propres de $u$.
]

#correction[
+ Rappelons que $0$ est valeur propre d’un endomorphisme si, et seulement si, celui-ci n’est pas injectif.
  Si $0$ est valeur propre de $f^n$ alors l’endomorphisme $f^n$ n’est pas injectif et donc $f$ ne peut pas l’être non plus (en effet, la composée d’injections est une injection). Ainsi, $0$ est valeur propre de $f$.
+ En vertu du théorème du rang, 
  $ 0 "valeur propre de" f <=> f "non injectif" <=> f "non surjectif"  $

+ Si $lambda$ est valeur propre de $u$ alors il existe $x eq.not 0_E$ vérifiant $f(x) = lambda x$. 

  En appliquant $u^(-1)$, on obtient $x = lambda u^(-1) (x).$
  Puisque $x eq.not O_E$, $lambda eq.not 0$ et l’on peut écrire $u^(-1)(x) = 1/lambda x$ donc $1/lambda$ est valeur propre de $u^(-1)$. Ainsi, les inverses des valeurs propres de $u$ figurent parmi les valeurs propres de $u^(-1)$.

  L'autre inclusion s'obtient par symétrie et l'on peut donc affirmer que les valeurs propres de $u^(-1)$ sont exactement les inverses des valeurs propres de $u$ (avec ces dernières non nulles).


  
]

#exercice(title: "Invariance du spectre par changement de base", n_stars:1)[
Soit $A, P$ $ in M_(n)(RR)$ avec $P$ inversible. On note $B = P A P^(-1).$ Montrer que $ op("Sp")(A) = op("Sp")(B). $

]

#correction[
Soit $lambda$ une valeur propre de $A$ et $X$ un vecteur propre associé. On a : 
  $ A X = lambda X => P^(-1)B P X = lambda X => B P X = lambda P X. $

Donc $ P X eq.not 0$ (car $P$ est inversible) est un vecteur propre de $B$ associé à la  valeur propre $lambda$, ainsi $lambda in op("Sp")(B).$ L'inclusion réciproque s'obtient par symétrie.

On peut aussi se contenter de dire qu'$A$ et $B$ représentent le même endomorphisme dans deux bases différentes, donc ont les mêmes valeurs propres et même vecteurs propres (exprimés dans les bases correspondantes).
]

#exercice(title: "Caractérisation des homothéties", n_stars:2)[
Soit $E$ un $RR$-espace vectoriel et $f$ un endomorphisme de $E$. On suppose que tout vecteur non nul de $E$ est un vecteur propre de $f$.

  Montrer que $f$ est une homothétie vectorielle : $ exists lambda in RR "tel que "forall x in E, f(x) = lambda x. $

]

#correction[

On a la propriété

$ forall x != 0_E, exists lambda_x in K, f(x) = lambda_x x. $

Montrons que $x ↦ lambda_x$ est une fonction constante sur $E backslash {0}$.

Soient $x, y ≠ 0_E$.

*Cas $1$* : $(x, y)$ est une famille libre.  
L’égalité $f(x + y) = f(x) + f(y)$ donne  
$ lambda_(x+y) (x + y) = lambda_x x + lambda_y y. $ 
Par liberté de $(x, y)$, on obtient $lambda_x = lambda_(x+y) = lambda_y$.

*Cas $2$* : $(x, y)$ est une famille liée.  

On peut écrire $y = mu x$ et donc $f(y) = mu f(x) = lambda_x mu x = lambda_x y$, puis $lambda_y = lambda_x$ car $y eq.not x$. 

Ainsi, la fonction $ x mapsto lambda_x$ est constante. #linebreak() En notant sa valeur $lambda$, on a $u(x) = lambda x$ pour tout $x in E$ qu’il soit nul ou non.

]

#let Tr = $op("Tr")$
#exercice(title: "Spectre clair", n_stars:1)[
 Soit $E$ un $RR$-espace vectoriel de dimension finie. #linebreak() Soient $F,G$ des sous espaces vectoriels de $E$ tels que $F dsum G = E$. On note $p$ le projecteur sur $F$ parallèlement à $G$.
  #linebreak()
  + Montrer par deux méthodes différentes que $op("Sp")(p) subset {0,1}$.
  + Vérifier quelles valeurs de ${0,1}$ sont effectivement valeurs propres de $p$ et déterminer les vecteurs propres associées.
]
#correction[
+
 * Méthode 1 : *
  
  $p$ est un projecteur donc $p compose p = p <=> p^2 - p = 0 <=> Q(X) = X(1-X)$ annule $p$. Les racines de $Q$ sont $0$ et $1$, donc $op("Sp")(p) subset {0,1}$.

 * Méthode 2 : *

  Soient $lambda in RR backslash {0,1}$ et $x in E$ tel que $p(x) = lambda x.$ #linebreak() Comme $F dsum G = E$, on peut écrire $x = x_F + x_G$ avec $x_F in F$ et $ x_G in G$. Alors, on a #linebreak() $ p(x) = x_F = lambda (x_F + x_G) <=> (1 - lambda)x_F = lambda x_G. $

  Or, $lambda in.not {0,1}$ donc on a égalité entre un élément de $F$ et un élément de $G$. Or, $F inter G = {0}$ donc $x_F = x_G = 0$, donc $x = 0$. Ainsi, $lambda$ n'est pas valeur propre de $p$, donc $op("Sp")(p) subset {0,1}$.

   

+

  Cas 1 : $lambda = 0$ #linebreak()
  Alors, $x_F$ = 0 donc  $x in G$. Inversement, $forall x in G, p(x) =0$. Donc $0$ est valeur propre de $p$ et l'espace propre associé est $G$.

  Cas 2 : $lambda = 1$ #linebreak()
  Alors, $x_G = 0$ donc  $x in F$. Inversement, $forall x in F, p(x) = x$. Donc $1$ est valeur propre de $p$ et l'espace propre associé est $F$.

  Finalement, $op("Sp")(p) = {0,1}$ avec $E_0 = op("Ker")(p) = G$ et $E_1 = op("Ker")(p- op("Id")_E) = F$.

  * Remarque *: Comme prévu par le cours, on a bien $E_0 dsum E_1$.

 ]

#pagebreak()

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

#exercice(title: "Polynôme minimal", n_stars:2)[

Soit $E$ un espace vectoriel réel de dimension finie et $f$ un endomorphisme de $E$.
 Soit $Q$ un polynôme tel que $Q(f) = 0$ et de degré minimal parmi les polynômes non nuls tels que $P(f) = 0$.
   Montrer que toute racine de $Q$ est valeur propre de $f$.
]

#correction[

+ Soit $lambda in RR$ une racine de $Q$. Alors il existe un polynôme $R in R[X]$, non nul, tel que
   $Q = (X - lambda)R$.

   En particulier, on a  
   $0 = Q(f) = (f - lambda op("Id")_E )R(f)$.

   Supposons que $lambda$ ne soit pas valeur propre de $f$.  
   Alors $f - lambda op("Id")_E$ est inversible, et donc en composant la relation précedente à gauche par $(f - lambda op("Id")_E^(-1)$,
   il vient $R(f) = 0$.

   Le degré de $R(f)$ est strictement inférieur à celui de $Q$, contredisant la minimalité du degré de $Q$ parmi les polynômes annulateurs non nuls.  
   Donc $lambda$ est une valeur propre de $f$.

]
