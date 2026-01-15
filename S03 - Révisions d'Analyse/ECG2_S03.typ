#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Révisions d'Analyse",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 3",
  school: "Lycée Champollion",
  show_correction: false,
  show_info_text: true,
  additional_comments: ""
)

#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}


#exercice(title: "Exercice 1 - Rentrée")[
Soit $p in NN $ fixé. Déterminer la nature de la série de terme général 
$display(n^p / 2^n)$.
]
#correction[
Commençons par noter que pour $p in {0, 1, 2}$, nous avons affaire à une série géométrique ou géométrique dérivée de raison $1/2$, qui est donc convergente.

De manière générale, on a
$ n^2 n^p / 2^n = n^(p+2) / 2^n -->_(n -> +infinity) 0$
par croissances comparées, de sorte que
$ n^p / 2^n =_(n -> +infinity) o(1/n^2). $

Et donc, par comparaison à une série de Riemann, la série de terme général 
$n^p / 2^n$ converge.
]
$$
 // #pagebreak()
#exercice(title: "Exercice 2 - Arches périodiques", n_stars:2)[

L'objectif est d'obtenir un équivalent simple de $ display(integral_(0)^(x) abs(sin(t))d t)$ lorsque $x -> +infinity $.
+
  + Montrer que la fonction $ t mapsto abs(sin(t))$ est $pi$-périodique.

  + En déduire, pour tout $k in NN$, la valeur de $display(integral_(k pi)^((k+1)pi) abs(sin(t)) d t )$.

  + Soit $x in RR$, et soit $k in NN$ l'unique réel tel que $k pi <= x <= (k+1)pi$. Montrer que: $ integral_(0)^(x) abs(sin(t)) d t = 2k + integral_(k pi)^(x) abs(sin(t))d t.  $
+ Déduire de la question précédente que $ integral_(0)^(x) |sin t | d t ~_(x -> +infinity) 2/pi x.   $ 
]  

#correction[
+ 
  + Pour tout $t in RR$, on a $abs(sin(t + pi)) = abs(-sin(t)) = abs(sin(t))$.
  + Soit $k in NN$. En utilisant le changement de variable affine $t = x - k pi$, il vient:
    $ integral_(k pi)^((k+1)pi) abs(sin(t))d t = integral_(0)^(pi) abs(sin(t)) d t = integral_(0)^(pi) sin(t) d t = [-cos(t)]_0^(pi) = 2.   $
    #figure(
      image("figures/arches.png", width: auto, height: auto),
      caption: [Toutes les arches ont la même aire],
    ) <fimg-label>

  + Dans ce qui suit, l’idée est que $display(integral_(0)^(x) abs(sin(t))d t)$ doit être environ égal à l’aire d’une arche, fois
    le nombre $k = floor(x/pi)$ d’arches qui se trouvent entièrement entre $0$ et $x$.

    Soit alors $x in RR$ et l'entier $k$ associé.
    
    $ integral_0^x abs(sin(t)) t = sum_(i=0)^(k-1) integral_(i pi)^((i+1) pi ) abs(sin(t)) d t + integral_(k pi)^x abs(sin(t)) d t = 2k + integral_(k pi)^x abs(sin(t)) d t. $

+ 
  Moralement, le raisonnement est simple: à $k$ fixé, l'erreur réalisée est plus petite que l'aire d'une arche complète, ce qui devient négligeable devant la somme des aires des arches précédentes quand $k$ tend vers $+infinity$. D'un point de vue technique, il nous faut traduire cela par un encadrement. Il nous suffit ensuite de repasser de $k$ à $x$ en inversant leur relation pour conclure #footnote[Ce qui revient implicitement à écrire $k = floor(x/pi)$ et exploiter $floor(t) ~_(t ->+infinity) t$.].

    La première étape est immédiate par croissance de l'intégrale:

  $ 0 ≤ ∫_(k π)^x | sin t | d t ≤ ∫_(k π)^((k+1)π) | sin t | d t ≤ 2 . $

  Et donc

  $ 2k ≤ ∫_0^x | sin t | d t ≤ 2k + 2 . $

  Or, on a $x/π - 1 < k ≤ x/π$, de sorte que

  $ 2 ( x/π - 1 ) ≤ 2k ≤ ∫_0^x | sin t | d t ≤ 2k + 2 ≤ 2x/π + 2 . $

  En divisant par $2x/π$, il vient

  $ 1 - π/x ≤ π / (2x) ∫_0^x | sin t | d t ≤ 1 + π/x . $

  Par le théorème des gendarmes, on a donc

  $ lim_(x → +∞) (π / (2x) ∫_0^x | sin t | d t) = 1, quad "c.a.d"  quad ∫_0^x | sin t | d t ~_(x → +∞) 2/pi x .   $



  #remarque[ ce résultat peut aisément se généraliser à toute fonction $f$ qui soit continue et $T$-périodique, à condition que l’intégrale de $f$ sur une période ne soit pas nulle. On a alors

    $ ∫_0^x f(t) d t ~_(x → +∞) (x / T) ∫_0^T f(t) d t . $]
    
]


#exercice(title: "Exercice 3 - Comparaison série intégrale", n_stars:2)[=== Partie 1 : Étude théorique
On considère une fonction $f$ continue, décroissante et strictement positive sur l’intervalle $[1; +infinity[$. On pose pour tout entier $n ≥ 1$ :

$ u_n = integral_(1)^(n) f(t) d t quad "et" quad v_n = sum_(k=1)^(n) f(k). $

+ Montrer que la suite $(w_n)_(n ≥ 1)$ définie par $w_n = v_n − u_n$ est décroissante et à termes positifs.

+ Dans cette question, on suppose que l’intégrale $display(integral_(1)^(+infinity) f(t) d t)$ est divergente.
  +
   Justifier l’inégalité $u_n > 0$ pour tout entier $n ≥ 2$.

  + A l'aide de la suite $w_n$, montrer que $u_n/v_n -->_(n-> +infinity) 1$, c'est à dire: $  sum_(k=1)^(n) f(k) ~_(n -> +infinity) integral_(1)^(n) f(t) d t. $

+ Dans cette question, on suppose que l’intégrale $display(integral_(1)^(+infinity) f(t) d t)$ converge.


  + Que peut‐on dire de la série de terme général $f(k)$ ?

  + On définit, pour tout entier $n$, le reste $display(R_n = sum_(k=n+1)^(+infinity) f(k)) $. 
   
    Montrer que si  $display(  f(n) / (integral_(n)^(+infinity) f(t) d t) ) -->_(n-> +infinity) 0$, on a $display(R_n / (integral_(n)^(+infinity) f(t) d t ) -->_(n -> +infinity)  1)$, c'est à dire: 

    $ sum_(k=n+1)^(+infinity) f(k)~_(n -> + infinity) integral_(n)^(+infinity) f(t) d t   . $

    


=== Partie 2 : Applications
 + Donner un équivalent de $display(sum_(k=1)^(n) 1/k)$ lorsque $n$ tend vers $+infinity$.

 + 
  + A l'aide de la fonction $g$ définie sur $RR_+^*$ définie par $g(x) = arctan (x) + 1/x$, montrer que, pour tout entier $n>=1$,
    $ arctan(n) + arctan(1/n) = pi/2 $
  + Donner un équivalent de $display(sum_(k=n+1)^(+infinity) 1/(1 + k^2))$ lorsque $n$ tend vers $+infinity$.



]
#pagebreak()
#correction[

 === Partie 1
 + On a:
  $ w_(n+1) - w_n = v_(n+1) - v_n + u_(n+1) - u_n = f(n + 1) - integral_(n)^(n+1) f(t) d t . $

  Mais par décroissance de $f$, pour tout tout $t in [n, n + 1]$, $f(n + 1) <= f(t)$, et donc:

  $ f(n + 1) = integral_(n)^(n+1) f(n + 1) d t <= integral_(n)^(n+1) f(t) d t. $

  On en déduit que $w_(n+1) - w_n <= 0$ et donc $(w_n)_(n>=1)$ est décroissante.

  De la même manière, on montre que pour tout $k in NN^*$ et tout $t in [k, k + 1]$, $f(t) <= f(k)$, et donc $display(integral_(k)^(k+1) f(t) d t <= f(k).)$

  En sommant ces relations pour $k$ allant de 1 à $n − 1$, il vient
  $display(integral_(1)^(n) f(t) d t <= sum_(k=1)^(n−1) f(k).)$
  D'ou:

  $ w_n = f(n) + sum_(k=1)^(n−1) f(k) − integral_(1)^(n) f(t) d t ≥ f(n) > 0. $

+ La fonction $f$ est continue sur $[1, n]$ et y est strictement positive, donc pour tout $n in NN$, $ u_n = integral_(1)^(n) f(t) d t > 0. $

  La fonction $display(F : x ↦ integral_(1)^(x) f(t) d t)$ est croissante car $f$ est positive. Donc si l’intégrale diverge, c’est que $F$ n’est pas majorée, et tend donc vers $+infinity$ lorsque $x -> +infinity$.

  En particulier,
  $ display(lim_(n->+infinity) u_n = lim_(n->+infinity) F(n) = lim_(n->+infinity) integral_(1)^(n) f(t) d t = +infinity.)$

  Et comme $u_n ≥ v_n$, on a de même $display(lim_(n->+infinity) v_n = +infinity.)$

  Puisque $(w_n)_(n>=1)$ est décroissante et minorée, elle converge, d'ou $ lim_(n->+infinity) (w_n / u_n) = 0.$

  Finalement :

  $ v_n / u_n = (w_n + u_n) / u_n = w_n / u_n + 1 -->_(n -> + infinity) 1. $

+
  + Si l’intégrale converge, alors $F$ admet une limite finie $alpha$ en $+infinity$, et donc est majorée (car elle est croissante). Et alors, pour tout $n in NN^*$, $u_n = F(n) <= alpha.$
    Or $w_n <= w_1$, de sorte que
    $ v_n = w_n + u_n <= w_1 + alpha.$
    Donc $(v_n)$ est majorée, et puisqu’elle est croissante (par positivité de $f$), elle converge.
    Et alors, puisque la suite des sommes partielles de $sum_k f(k)$, qui est exactement $(v_n)$ converge, la série $sum_k f(k)$ converge.

  + Pour tout $k in NN$ et tout $t in [k − 1, space k]$, on a: $ f(k) ≤ f(t) ≤ f(k − 1) ==>  f(k) ≤ integral_(k−1)^(k) f(t) d t ≤ f(k − 1). $
    Et donc, en sommant ces relations pour $k$ variant de $n + 1$ à $p$ ( $p > n$ ), il vient:

    $ sum_(k=n+1)^(p) f(k) ≤ integral_(n)^(p) f(t) d t ≤ sum_(k=n+1)^(p) f(k − 1). $

    En passant à la limite lorsque $p -> +infinity$, on a alors:

    $ sum_(k=n+1)^(+infinity) f(k) ≤ integral_(n)^(+infinity) f(t) d t ≤ sum_(k=n)^(+infinity) f(k). $

    Soit encore

    $ R_n ≤ integral_(n)^(+infinity) f(t) d t ≤ R_(n−1) = R_n + f(n). $

    On a donc:

    $ integral_(n)^(+infinity) f(t) d t − f(n) ≤ R_n ≤ integral_(n)^(+infinity) f(t) d t. $

    Si l’on divise par $display(integral_(1)^(+infinity) f(t) d t)$, il reste alors

    $ 1 − f(n) / (integral_(n)^(+infinity) f(t) d t) ≤ R_n /( integral_(n)^(+infinity) f(t) d t) ≤ 1. $

    Grâce à l’hypothèse de l’énoncé et au théorème des gendarmes, on a finalement
    $ ( R_n / (integral_(n)^(+infinity) f(t) d t )) -->_(n -> +infinity) 1. $

  #remarque[
    A première vue, ces raisonnements peuvent paraître très techniques et arbitraires. En réalité, comme bien souvent en maths, il deviennent parfaitement naturels lorsqu'on se place du #link("https://www.youtube.com/watch?v=WpSWTS3-w8U")[point de vue géométrique].  ]

=== Partie 2

  + Nous avons ici $f(t) = 1 / t$, qui vérifie bien toutes les hypothèses : elle est continue, strictement positive et décroissante. De plus, $display(integral_(1)^(+infinity) f(t) d t)$ diverge.

    D’après la première question,

    $ sum_(k=1)^(n) 1/k = sum_(k=1)^(n) f(k) ~ integral_(1)^(n) f(t) d t = ln(n). $

  
  + + La fonction $g$ est de classe $C^1$ sur $RR_+^*$, et on a

      $ g’(x) = 1 / (1 + x^2) − 1 / x^2 + 1 / (1 + 1 / x^2) = 1 / (1 + x^2) − 1 / (x^2 + 1) = 0. $
      Donc $g$ est constante sur $RR_+^*$. 

      Or $display(lim_(x -> +infinity )g(x)) = pi/2 - display(lim_(x -> +infinity)) 1/x = pi/2$, donc $g$ est constante égale à $pi/2$. En particulier, pour tout $n >= 1$, on a bien :
      $ arctan(n) + arctan(1/n) = pi/2 . $

    + Nous avons ici $display(f(t) = 1 / (1 + t^2))$, qui vérifie encore toutes les hypothèses.

      Or $ display(integral_(1)^(+infinity) 1 / (1 + t^2)d t)$ est convergente (par comparaison à une série de Riemann), et on a, pour tout $n in NN^*$,

      $ integral_(n)^(+infinity) f(t) d t = lim_(A->+infinity) integral_(n)^(A) 1 / (1 + t^2) d t = lim_(A->+infinity) ( arctan(A) − arctan(n) ) = pi/2 − arctan(n). $

      Alors

      $ lim_(n->+infinity) ( f(n) / (integral_(n)^(+infinity) f(t) d t )) = lim_(n->+infinity) (( 1 / (1 + n^2) ) / ( pi/2 − arctan(n) )). $
    
      D'après la question précédente, on a donc $pi/2 - arctan(n) = arctan(1/n) ~_(n -> +infinity) 1/n.$
      Ainsi, $ 1/(1+n^2) 1/(pi/2 - arctan(n)) ~_(n -> +infinity) n/(1+n^2) -->_(n -> +infinity) 0. $
      L'hypothèse technique de la question 3.b de la partie 1 est alors vérifiée et par conséquent: 
      $ sum_(k=n+1)^(+infinity) 1/(1+k^2) ~_(n -> + infinity) integral_(n)^(+infinity) 1/(1+t^2) d t = pi/2 - arctan(n) ~_(n -> +infinity) 1/n.  $

      
 ]

#exercice(title: "Exercice Bonus (ESPCT 2017) - Chemins autoévitants", n_stars: 3)[

=== Partie 1 : Lemme de Fekete
Soit $(u_n)_(n>=1)$ une suite réelle vérifiant pour tous $n,m$ entiers naturels non nuls,

$ u_(m+n) <= u_n + u_m. $

On pose, pour tout $n in N^*$, $display(v_n = min_(k in [1,n]) (u_k / k))$.

+ Montrer que la suite $(v_n)_(n>=1)$ admet une limite $ell$ dans ${-∞} ∪ RR$.
+ Montrer que pour tous $n,m$ entiers naturels non nuls, on a $u_(m n) <= m u_n$.
+ On suppose dans cette question que $ell$ ne vaut pas $-∞$. Soit $ε > 0$.
  + Montrer qu’il existe $m in N$ tel que $u_m / m <= ell + ε$.
  + En utilisant la division euclidienne de $n$ par $m$, montrer que la suite $(u_n / n)_(n>=1)$ converge vers $ell$ lorsque $n$ tend vers $+∞$.
=== Partie 2 : Connectivité du réseau carré
+ Dans cette partie, on appelle *chemin sans croisement de longueur *$bold(n)$ toute suite $M_0, M_1, …, M_n$ de points du plan à coordonnées entières vérifiant :

  i) $M_0 = O$ (origine du plan)

  ii) pour tout $i in [0, n-1]$, la distance entre $M_i$ et $M_(i+1)$ est égale à 1.
  
  iii) pour tout $i ≠ j$, on a $M_i ≠ M_j$.

  On note $N_n$ le nombre de chemins sans croisement de longueur $n$.

  + Montrer que $N_n <= 4^n$.

  + Montrer que pour tous $n,m$ entiers naturels non nuls, $N_(m+n) <= N_n N_m$.

  + Quelle relation vérifie la suite $u_n = ln (N_n)$ ?
  + En déduire que la suite $(N_n^(1/n))_(n>=1)$converge.

]
#pagebreak()
#correction[

  === Partie 1
+ La suite $(v_n)$ est décroissante puisque le minimum définissant $v_(n+1)$ porte sur $n+1$ termes, dont ceux définissant $v_n$, donc $v_(n+1) <= v_n$.  
  Par le théorème de la limite monotone, soit elle est minorée et admet alors une limite finie, soit elle tend vers $-infinity$.

+ Fixons $n in NN^* $ et prouvons le résultat par récurrence sur $m$. Pour $m=1$, c’est évident.  
  Supposons que $u_(m n) <= m u_n$. Alors  

  $ u_((m+1) n) = u_(m n + n) <= u_(m n) + u_n <= m u_n + u_n <= (m+1) u_n . $

  Donc par le principe de récurrence, pour tout $m in NN^*$, $u_(m n) <= m u_n$.

+ 
  + Puisque $v_n ->_(n -> +infinity) ell$, il existe $N in NN^*$ tel que pour $n >= N$, $|v_n - ell| <= epsilon$, et donc en particulier, $v_n - ell <= epsilon$.
    En particulier, pour $n = N$, on a $v_N <= ell + epsilon$.
  
    Mais puisque  
    $v_n = min_(k in [|1, N|]) (u_k) / k$,  
    il existe $m in [|1, N|]$ tel que $u_m / m <= ell + epsilon$.

  + Soit $n >= m$. Notons alors $n = a_(n m) + b_n$, avec $b_n < m$.  
    On a alors:
    $ u_n = u_(a_(n m) + b_n) <= u_(a_(n m)) + u_(b_n) <= a_n u_m + u_(b_n). $


    Et donc  
    $u_n / n <= a_n / n dot u_m + u_(b_n) / n$.

    Mais si on note $M = max(|u_1|, |u_2|, ..., |u_(m−1)|)$, alors on a $|u_(b_n)| <= M$.  
    
    Et donc $(|u_(b_n)|) / n <= M / n$, de sorte que $lim_(n -> +oo) u_(b_n)/n = 0$.

    Ainsi, il existe $N in NN$ tel que pour $n >= N$, $u_(b_n) / n <= epsilon$.
 
    D’autre part, on a $a_(n m) <= n$ et donc $a_n / n >= 1 / m$ et donc : $ "pour" n >= N,  
    u_n <= u_m / m + u_(b_n)/n <= ell + epsilon + epsilon = ell + 2 epsilon . $

    Enfin, pour tout $n in N$, on a $u_n / n >= v_n >= ell$.  
    Nous venons donc de prouver que pour tout $epsilon > 0$, il existe $N in N$ tel que pour $n >= N$,  
    $ell <= u_n / n <= ell + epsilon => |u_n / n − ell| <= epsilon$.  
    
    Ceci prouve donc que $u_n / n -->_(n -> +oo) ell$.

=== Partie 2
+ Avant de démarrer une question, il faut s’assurer qu’on a bien compris la définition qui est donnée. Un chemin sans croisement est une succession de points de $ZZ^(2)$, telle que la distance entre deux points successifs soit égale à $1$. Or, les seuls points de $ZZ^(2)$ situés à distance $1$ d’un point $A in ZZ^(2)$ sont les points qui sont à gauche, à droite, en haut et en bas de $A$. Enfin, la dernière condition signifie qu’un chemin ne passe jamais deux fois par le même point.

  #figure(
    image("figures/exchemins.png", width: auto, height: auto),
    caption: [Quelques exemples de chemins sans croisement],
  ) <fimg-label>

  + Puisque les points d’un chemin doivent être à coordonnées entières, et que la distance entre deux points successifs doit être égale à $1$, alors si $M_n = (a, b)$, il n’y a au maximum que quatre choix possibles pour $M_(n+1)$ : ce sont les points $(a + 1, b)$, $(a - 1, b)$, $(a, b + 1)$ et $(a, b - 1)$.  
    Et donc, on a $N_(n+1) <= 4 N_n$ et une récurrence rapide prouve alors que $N_n <= 4^(n)$. 

    #remarque[ notons qu’il est en fait aisé de faire bien mieux : il y a $4$ choix pour la position de $M_1$, mais pour chacun des points suivants, il n’y a au maximum que $3$ choix possibles, puisqu’il n’est pas possible de revenir de la direction dont on vient.]
    Et donc $M_n <= 4 dot 3^(n-1)$.

  + Si $M_0, M_1, #sym.dots.h, M_(m+n)$ est un chemin sans croisement de longueur $m + n$, alors $M_0 #sym.dots.h M_n$ est un chemin sans croisement de longueur $n$.  
    Et $M_n, M_(n+1), #sym.dots.h, M_(n+m)$ est un chemin de longueur $m$, qui satisfait aux axiomes ii) et iii), mais pas à i).  
    Toutefois, si on impose l’origine d’un chemin, que ce soit $O$ ou n’importe quel autre point, cela ne change pas le nombre de chemins.

    #figure(
      image("figures/croisement.png", width: auto, height: 30%),
      caption: [Un chemin sans croisement de longueur $n +m$ peut être coupé en deux chemins sans croisement de longueurs
      respectives $n$ et $m$.],
    ) <fimg-label>

    Il y a $N_n$ choix pour le premier chemin de longueur $n$, et au plus $N_m$ choix pour le second de longueur $m$. Finalement, $N_(m+n) <= N_n N_m$.

  + En passant au logarithme, on a $ln (N_(n+m)) <= ln (N_n) + ln (N_m) <=> u_(n+m) <= u_n + u_m$.
  + La suite $(u_n)$ vérifie les hypothèses de la première partie de l'exercice. Puisqu'elle est positive, c'est également le cas de la suite $(v_n)$, qui ne peut donc pas tendre vers $-infinity$.

    D'après les questions $1$ et $3$, $u_n/n$ converge donc vers une limite $ell_1$.

    Mais $u_n/n = ln (N_n^(1/n))$, de sorte que, par composition avec l'exponentielle, $N_n^(1/n) -->_(n -> +infinity)  e^(ell_1).$

  #remarque[

   Le nombre $ell = e^(ell_1)$ est appelée #link("fr.wikipedia.org/wiki/Constante_de_connectivité")[*constante de connectivité*] du réseau carré. Il représente la vitesse de croissance du nombre de chemins autoévitants avec $n$. En généralisant les arguments de l'exercice, on peut prouver l'existence d'une telle constante pour tout réseau infini. Cependant, les valeurs de ces constantes sont en général inconnues, et c'est le cas pour le réseau carré. Des simulations informatiques permettent d’en donner une valeur approchée qui est $2.638$. 

     En 2010, le mathématicien français Hugo Duminil-Copin a prouvé que la constante de connectivité du réseau hexagonal était $sqrt(2 + sqrt(2))$. 

    Ce résultat fait partie des travaux pour lesquels Dominil-Copin fut récompensé de la #link("https://lejournal.cnrs.fr/articles/hugo-duminil-copin-laureat-de-la-medaille-fields")[médaille Fields] en 2022.
    
    Autrement dit, si vous êtes venus à bout de l'exercice, vous n'êtes qu'à une "simple" valeur d'un résultat révolutionnaire !  ]

]









