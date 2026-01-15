#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Algèbre Linéaire et Probabilités discrètes",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 6",
  school: "Lycée Champollion",
  show_correction: true,
  show_info_text: true,
  additional_comments: [
 #linebreak()
#linebreak()

L'algèbre linéaire constitue un des trois grands blocs du programme d'ECG, avec l'analyse et les probabilités. Dans le cadre de la prépa, elle peut paraître abstraite et remplie de calculs à rallonge, notations, théorèmes et concepts abscons.

Cependant, cette théorie à émergée de l'idée simple d'étuder les systèmes linéaires sous l'angle de la *géométrie*, ce qui a débouché sur l'axiomatisation des espaces vectoriels comme concept général fondateur. Il ne faut donc jamais perdre de vue notre amie géométrie, car son omniprésence sera le phare de notre voyage dans une nuit abstraite.

  A cet effet, je recommande ardamment l'excellente série de vidéos #link("https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab")[Essence of Linear Algebra] de la chaîne 3blue1brown (en anglais sous titré français). Je suis persuadé que quelques heures de méditation sur cette présentation de l'algèbre linéaire au cours de l'année vous sera infiniment plus utile qu'un enchaînement machinal d'exercices. En effet, leur réalité évidente sous-jacente vous resterait pour toujours invisible avec des yeux calculatoires.

  _Algebra is the offer made by the devil to the mathematician. The devil says: "I will give you this powerful machine, it will answer any question you like. All you need to do is give me your soul: give up geometry and you will have this marvelous machine._ -- Michael Atiyah
]
)

#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let dsum = $plus.circle$

#exercice(title: "Exercice 1 : Changement de base", n_stars:1)[

  Soient $b = (i, j)$ et $B = (I, J)$ deux bases d’un $RR$-espace vectoriel de dimension $2$ et $P$ la matrice de passage de $b$ à $B$.  
  Pour $x in E$, notons

  $ v = op("Mat")_b (x) quad "et" quad V = op("Mat")_B (x). $

  + Retrouver la relation entre $v$ et $V$.

  + Soient $f in L(E)$ et  

   $ m = op("Mat")_b (f) quad "et" quad M = op("Mat")_B (f). $

   Retrouver la relation entre $m$ et $M$.

  + On suppose que $M$ est diagonale. En déduire une méthode rapide de calcul de $m^n$.
]

#correction[
 Voir cours !
]

 #pagebreak() 

#exercice(title: "Exercice 2 : Construction de sous-espaces vectoriels ", n_stars:1)[
Soit $E$ un $RR$-espace vectoriel de dimension finie et $F$ et $G$ deux sous-espaces vectoriels de $E$ tels que $dim(F) + dim(G) > dim(E)$. Montrer que :
 $ F inter G eq.not {0}. $ 
]

#correction[
  On suppose par l'absurde que $F inter G = {0}$.
  Alors, $F$ et $G$ sont en somme directe et d'après le cours (à prouver pendant la colle) :
  $ dim(F + G) = dim(F) + dim(G). $

  Ainsi, d'après l'hypothèse de l'énoncé, 
  $ dim(F + G) > dim(E). $

  Or, $F dsum G$ est un sous-espace vectoriel de $E$, donc $ dim(F+G) <= dim(E) .$

  C'est absurde, donc $F inter G eq.not {0}$.
]



#exercice(title: "Exercice 3 : Projections et sommes directes", n_stars:1)[
  Soit $E$ un $RR$-espace vectoriel et $E_1, E_2, dots E_n$ des sous espaces vectoriels de $E$ tels que #linebreak() $E_1 dsum dots dsum E_n = E $. On note $p_i$ le projecteur sur $E_i$
    parallèlement à $dsum_(j eq.not i) E_j$.

+ Montrer que si $i eq.not j$, $p_i compose p_j = 0_E$.

+ Montrer que $p_1+ dots +p_n = op("Id")_E$.

]

#correction[
+ Soit $i eq.not j$. Par définition des projecteurs $p_i$ et $p_j$, on a $op("Im")(p_j)=E_j subset op("Ker")(p_i)$. 

  Ainsi, $p_i compose p_j = 0.$

+ Soit $x in E$. Pour $x_i in E_i$, on a:

  $ sum_(j=1)^(n) p_j (x_i) = p_i (x_i) + sum_(j eq.not i)^() p_j (x_i) = x_i + sum_(j eq.not i )^() 0 = x_i. $

  On a donc $p_1 + dots + p_n = op("Id")_(E_i)$ sur chaque $E_i$. Or, à l'aide d'une base adaptée a la somme directe $E_1 dsum dots dsum E_n$, tout $x in E$ s'écrit $x = x_1 + dots + x_n$ avec $x_i in E_i$.

  Ainsi, $p_1 + dots + p_n = op("Id")_E$ sur tout l'espace par "recollement".
]

#exercice(title: "Exercice 4 : Caractérisation des homothéties", n_stars:1)[
Soit $E$ un $RR$-espace vectoriel et $f in cal(L)(E)$. #linebreak()
On suppose que pour tout $x in E$, les vecteurs $x$ et $f(x)$ forment une famille liée. #linebreak()
Soit $cal(B) = (e_1, dots , e_n)$ une base de $E$.

+ Montrer que la matrice de $f$ dans $B$ est diagonale.
+ En calculant $f(e_1 + dots + e_n)$, conclure que $f$ est une homothétie vectorielle, c'est à dire qu'il existe $lambda in RR$ tel que $f(x)= lambda x$ pour tout $x in E$.
]

#correction[
+ Pour tout $i in [| 1,n |]$, savoir $(e_i, f(e_i))$ liée avec $e_i eq.not 0_E$ assure qu’il existe $lambda_i in R$ tel que $f(e_i) = lambda_i e_i$.  
  La matrice de $f$ dans $B$ est alors une matrice diagonale.

+ Pour $x = e_1 + dots + e_n$, la famille $(x, f(x))$ est liée avec $x eq.not 0_E$.  
  Il existe donc $λ in R$ tel que $f(x) = lambda x$. Par linéarité de $f$, il vient

  $ λ_1 e_1 + ⋯ + λ_n e_n = λ e_1 + ⋯ + λ e_n $

  et donc

  $ (λ_1 - λ) e_1 + ⋯ + (λ_n - λ) e_n = 0_E. $

  Par liberté de la famille $(e_1, …, e_n)$, on obtient $λ_1 = ⋯ = λ_n = λ$.  
  Ainsi, $f = λ op("Id")_E$.

]
#exercice(title: "Exercice 5 : Calcul de rang", n_stars:1)[
Déterminer, suivant la valeur du réel $a$, le rang de la matrice suivante :

  $ A = mat(
    1, a, a^(2), a^(3);
    a, a^(2), a^(3), 1;
    a^(2), a^(3), 1, a;
    a^(3), 1, a, a^(2)
  ) $
]

#correction[
On effectue les opérations suivantes :
  $ L_(2) - a L_(1) -> L_(2),quad L_(3) - a^(2) L_(1) -> L_(3),quad L_(4) - a^(3) L_(1) -> L_(4). $
  Ainsi $A$ a même rang que

  $ A_1 = mat(
    1, a, a^(2), a^(3);
    0, 0, 0, 1 - a^(4);
    0, 0, 1 - a^(4), a(1 - a^(4));
    0, 1 - a^(4), a(1 - a^(4)), a^(2)(1 - a^(4))
  ) $

On échange ensuite $L_(2)$ et $L_(4)$ ; on trouve que $A$ a même rang que

  $ A_2 = mat(
    1, a, a^(2), a^(3);
    0, 1 - a^(4), a(1 - a^(4)), a^(2)(1 - a^(4));
    0, 0, 1 - a^(4), a(1 - a^(4));
    0, 0, 0, 1 - a^(4)
  ) $

On obtient une matrice triangulaire, dont les pivots sont non nuls si $1 - a^(4) != 0$, c’est-à-dire si $a != 1$ et $a != -1$.  
  Dans ce cas la matrice est de rang $4$.  
  Si $a = 1$ ou $a = -1$, la matrice $A$ a même rang qu’une matrice dont une seule ligne est non nulle ; elle a donc pour rang $1$.

]
#exercice(title: "Exercice 6 : Matrice aléatoire (HEC 2007)", n_stars:2)[
Soient $X$ et $Y$ deux variables aléatoires indépendantes sur $(Omega, cal(A), P)$ suivant la même loi géométrique de paramètre $p in ]0,1[.$ Pour tout $omega in Omega$, on pose $M(omega) = mat(X(omega), Y(omega); Y(omega), X(omega))$. Déterminer la probabilité que $M$ soit inversible.
]

#correction[
Notons $A$ l’événement ${ ω ∈ Ω : M(ω) "est inversible" }$.  
Puisque $M(ω)$ est une matrice $2 × 2$, elle est inversible si et seulement si son déterminant est non nul, soit si et seulement si $X^2(ω) - Y^2(ω) ≠ 0$.  
Autrement dit, on a $ overline(A) = [ X^2 = Y^2 ]$, et puisque $X$ et $Y$ sont à valeurs positives, on a $ overline(A) = [ X = Y ]$.

En appliquant la formule des probabilités totales au système complet d’événements #linebreak() ${ [X = k], k ∈ NN^*}$, il vient  

$ P( overline(A) ) = P( X = Y ) = sum_(k=1)^(+infinity) P( [X = Y] ∩ [X = k] ) = sum_(k=1)^(+infinity) P( [X = k] ∩ [Y = k] ). $

Par indépendance de $X$ et $Y$, on a ainsi


$ P( overline(A) )& = sum_(k=1)^(+infinity)  P(X = k)P(Y = k) \ 
  &= sum_(k=1)^(+infinity) p^2 (1 - p)^(2(k - 1)) \
  &= p^2 sum_(i=0)^(+infinity)   ((1 - p)^2)^i & \
  &= p^2 1/(1-(1-p)^2)  \ 
  &= p^2/(2p -p^2) \ 
  &= p/(2-p). $

Et finalement,

$ P(A) = 1 - P( overline(A) ) = 1 - p/(2-p) = (2-2p)/(2-p). $

]



#exercice(title: "Exercice 7 : Dérivation", n_stars:2)[
Dans le $RR$-espace vectoriel $cal(C)^(infinity)(RR,RR)$, on considère l'application dérivation $D : f mapsto f'. $

+ Montrer que $D$ est un endomorphisme surjectif mais non injectif de $cal(C)^(infinity)(RR,RR)$.

+ + Montrer qu'il existe un endomorphisme $u$ de $cal(C)^(infinity)(RR,RR)$ tel que $D compose u = op("Id")_(cal(C)^(infinity)(RR,RR))$.
  + Justifier qu'il n'existe pas d'endomorphisme $v$ de $E$ tel que $v compose D = op("Id")_(cal(C)^(infinity)(RR,RR))$.

+ On considère $E$ le sous-espace vectoriel de $cal(C)^(infinity)(RR,RR)$ de dimension $4$ engendré par les fonctions $ c_0 : x mapsto cos(x), quad c_1 : x mapsto x cos(x), quad c_2: x mapsto sin(x), quad "et" quad c_3: x mapsto x sin(x). $

  + Montrer que $E$ est stable par $D$, c'est à dire que pour $f$ dans $E$, $D(f)$ est aussi dans $E$.
  + 
    + Donner la matrice $M$ de $D$ dans la base $cal(B) = (c_0, c_1, s_0, s_1)$ 
    + Déterminer les fonctions de $E$ vérifiant la relation $(P)$ sur $RR$:
  $ (P): y'' + 2y' + y = x cos(x). $

  


]

#correction[
+ Il est clair que la dérivée d'une fonction $cal(C)^infinity$ est elle-même $cal(C)^infinity$. De plus, la linéarité est simple à établir (cours d'ECG1). On en conclut que $D$ est bien un endomorphisme de $E$.

  *Surjectivité*:
  
  Soit $f in$. Soit $F$ une primitive quelconque de $f$. Alors $F in E$ et $D(F) = F' = f.$ #linebreak()
  Ainsi, $D$ est surjectif.


  *Injectivité*:

  Soit $lambda in RR$. On note $tilde(lambda)$ la fonction constante égale à $lambda$ sur $RR$. Alors, $tilde(lambda) in E$ et $D(tilde(lambda)) = 0_E.$ Ainsi, toutes les fonctions constantes ayant la même dérivée, $D$ n'est pas injective. Plus précisément, on a montré que $ op("Ker")(D)= {tilde(lambda), lambda in RR} eq.not {0_E}$.


+
  + On définit sur $E$ l'application $display(u : f mapsto integral_(0)^(x) f(t)d t) $. #linebreak()
    Autrement dit, $u(f)$ est la primitive de $f$ qui s'annule en $0$.
    Il est aisé de montrer que $u$ est un endomorphisme de $u$. #linebreak()
    De plus, pour tout $f in E$, $D compose u (f)$ est la dérivée d'une primitive de $f$, donc $f$. #linebreak() Ainsi, $D compose u = op("Id")_E.$

   

  + Si il existait un tel endomorphisme, alors $v compose D = op("Id")_E$ serait bijectif donc injectif, donc $D$ serait injectif (à reprouver rapidement), ce qui est faux d'après la question $1$.
+ 
  + En dérivant les fonctions $c_i$, on obtient directement des combinaisons linéaires de fonctions $c_i$, donc $E$ est stable par $D$.
  +
   + Par calcul, on obtient 
      $ M = op("Mat")_(cal(B))(D) = mat( 0, 1, 1, 0;
      0, 0, 0, 1;
      -1, 0, 0 , 1;
       0, -1, 0, 0). $
   + Soit $y$ une fonction de $E$ vérifiant la relation $(P)$. Comme $cal(B)$ est une base de $E$, on peut écrire $y = lambda_0c_0 + dots +lambda_3c_3$ avec $(lambda_0, dots, lambda_3) in RR^4$. La relation $(P)$ s'écrit:
     $ (P) : D^2(y) + 2D(y) + y = c_0. $
     On peut aussi l'écrire sous forme matricielle dans la base $cal(B)$, en considérant les vecteur $Y = vec(lambda_0, lambda_1, lambda_2, lambda_3)$ et $C_0 = vec(1, 0, 0, 0)$ associés à $y$ et $c_0$:
     $ (P) : M^2 Y + M Y + Y = C_0 $
   
     En calculant, on arrive à l'expression suivante:
     $ (P) : vec(lambda_2 + lambda_3 + 2lambda_4, lambda_4, -lambda_1 - 2lambda_2 + lambda_4, -lambda_2)  = vec(1, 0, 0, 0) $
     Le système est simple à résoudre et on obtient finalement $Y = vec(0, 0, 0, 1)$ dans la base $cal(B)$, donc $y : x mapsto x sin(x)$ est la seule fonction de $E$ vérifiant $(P)$.
  
]


