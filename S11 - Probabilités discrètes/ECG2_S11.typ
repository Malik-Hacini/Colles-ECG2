#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Probabilités discrètes",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 10",
  school: "Lycée Champollion",
  show_correction: false,
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

#exercice(title: "Conditionnement", n_stars:1)[
On dispose de $(n + 1)$ urnes $U_0, U_1, dots, U_n$, chaque urne $U_k$ contenant $(k + 1)$ boules numérotées de $0$ à $k$. On tire une première boule dans l'urne $U_n$, dont le numéro indique dans quelle urne on tirera une seconde boule. On note $K$ le numéro de la première boule tirée, $X$ le numéro de la deuxième.

 A l'aide d'un conditionnement approprié, déterminer $E(X)$.
]

#correction[

  Le premier tirage s'effectue uniformément dans l'urne $U_n$, qui contient $(n+1)$ boules numérotées de $0$ à $n$.
  $K$ suit donc une loi uniforme sur $⟦0, n⟧$.
  $ forall k in ⟦0, n⟧, P(K = k) = 1 / (n + 1). $

  Sachant l'événement $[K = k]$, le second tirage s'effectue dans l'urne $U_k$.
  Cette urne contient $(k+1)$ boules numérotées de $0$ à $k$.
  La loi conditionnelle de $X$ sachant $[K = k]$ est donc une loi uniforme sur $⟦0, k⟧$.

  L'espérance d'une loi uniforme sur $⟦0, k⟧$ est le milieu de l'intervalle :
  $ E(X | K = k) = (0 + k) / 2 = k / 2. $

  Alors, d'après la formule de l'espérance totale:  $ E(X) &= sum_(k=0)^n P(K = k) E(X | K = k) \
  &= sum_(k=0)^n 1 / (n + 1) times k / 2 \
  &= 1 / (2(n + 1)) sum_(k=0)^n k \
  &= 1 / (2(n + 1)) times (n(n + 1)) / 2 \
  &= n / 4. $

]

#exercice(title: "La maison gagne toujours", n_stars:2)[
Au casino, un croupier mélange trois cartes : as de cœur, roi de cœur et valet de pique. Il les présente face cachée, et un joueur choisit l’une des cartes au hasard. Si c’est un cœur, il gagne deux euros pour le roi et un euro pour l’as, et le jeu recommence. Si c’est le valet de pique, le jeu s’arrête.
On note $N$ le nombre de cartes tirées par le joueur, et $X$ la somme qu’il a gagnée à la fin de la partie.

+ Déterminer la loi de $N$.

+ Déterminer la loi de $X$ sachant que $N = n$, et calculer $bold(E)(X|N = n)$.

+ Utiliser la formule de l’espérance totale pour calculer $bold(E)(X)$. Quel prix minimum le casino doit-il faire payer les parties pour que le jeu soit rentable?
]

#correction[


+ La partie s'arrête dès que le joueur tire le valet de pique.
  Lors d'un tirage, la probabilité de tirer le valet est $p = 1/3$.
  Les tirages étant indépendants (le jeu recommence, ce qui implique une remise en conditions initiales), la variable aléatoire $N$ correspondant au rang du premier valet obtenu suit une loi géométrique de paramètre $p = 1/3$.
  $ forall n in NN^*, P(N = n) = (1 - 1/3)^(n-1) times 1/3 = 2^(n-1) / 3^n. $
  Son espérance est $E(N) = 1/p = 3$.

+ Si l'événement $[N = n]$ est réalisé, cela signifie que le joueur a tiré $(n - 1)$ cartes de la famille "cœur" (as ou roi) lors des $(n - 1)$ premiers tirages, puis le valet au $n$-ième tirage.
  Notons $G_i$ le gain obtenu au $i$-ième tirage.
  Pour $i < n$, sachant que la carte tirée est un cœur, la probabilité que ce soit un as (gain 1) est $1/2$ et la probabilité que ce soit un roi (gain 2) est $1/2$.
  La variable aléatoire $X$, représentant la somme totale gagnée, est donc la somme de $(n - 1)$ variables aléatoires indépendantes et identiquement distribuées suivant la loi uniforme sur ${1, 2}$.
  On remarque que $G_i - 1$ suit une loi de Bernoulli de paramètre $1/2$.
  Ainsi, la variable $X - (n - 1) = sum_(i=1)^(n-1) (G_i - 1)$ suit une loi binomiale $cal(B)(n - 1, 1/2)$.
  La loi de $X$ sachant $[N = n]$ est donnée par :
  $ forall k in ⟦ n - 1, 2(n - 1) ⟧, P(X = k | N = n) = binom(n - 1, k - (n - 1)) (1/2)^(n - 1). $

  L'espérance conditionnelle s'obtient par linéarité. Sachant $[N=n]$, $ E(G_i) = 1 times 1/2 + 2 times 1/2 = 3/2 . $
  $ E(X | N = n) = sum_(i=1)^(n-1) E(G_i) = (n - 1) times 3/2 = 3/2 (n - 1). $

+ D'après la formule de l'espérance totale, la série suivante converge et l'on a :
  $ E(X) = sum_(n=1)^(+oo) E(X | N = n) P(N = n). $
  En remplaçant par les valeurs trouvées :
  $ E(X) &= sum_(n=1)^(+oo) 3/2 (n - 1) times (2/3)^(n-1) 1/3 \
  &= 1/2 sum_(n=1)^(+oo) (n - 1) (2/3)^(n-1) \
  &= 1/2 sum_(k=0)^(+oo) k (2/3)^k. $
  On reconnaît la série dérivée de la série géométrique de raison $2/3$. On rappelle que:  $ sum_(k=0)^(+oo) k x^k = x / (1 - x)^2 "pour" |x| < 1. $ Alors, 

  $ E(X) = 1/2 times (2/3) / (1 - 2/3)^2 = 1/2 times (2/3) / (1/9) = 1/2 times 2/3 times 9 = 3. $

  Le joueur gagne en moyenne 3 euros par partie. Pour que le jeu soit rentable pour le casino (espérance de gain du joueur inférieure au coût de la partie), le casino doit faire payer la partie strictement plus de 3 euros.
]
#exercice(title: "Gourmandise", n_stars:2)[
On considère un joueur qui effectue une série de manches indépendantes. A chaque manche, il gagne 1 point avec la probabilité $p$, sinon il perd 1 point avec la probabilité $1 - p$. Le jeu s'arrête lorsque le joueur est ruiné ou lorsque le joueur atteint un capital de $N$ points qu'il s'est fixé comme objectif. On note $r_n$ la probabilité que le joueur soit ruiné en partant avec un capital de $n$ points.

+ Montrer que les termes de la suite $(r_n)_(n in NN)$ vérifie une relation de récurrence à préciser.

+ + Déterminer l'expression explicite de $r_n$ en fonction de $p$. \
  + Que se passe-t-il lorsque $N$ tend vers $+oo$ ? Interpréter ce résultat.
]
#correction[


+ On note $R_n$ l'événement « le joueur est ruiné en partant avec un capital de $n$ points ».
  Considérons le résultat de la première manche. On note $G$ l'événement « le joueur gagne la première manche » et $P$ l'événement « le joueur perd la première manche ».
  On a $P(G) = p$ et $P(P) = 1 - p$.

  Si le joueur gagne la première manche, son capital passe à $n + 1$. La probabilité d'être ruiné devient alors $r_(n+1)$.
  Si le joueur perd la première manche, son capital passe à $n - 1$. La probabilité d'être ruiné devient alors $r_(n-1)$.
  D'après la formule des probabilités totales :
  $ r_n = P(R_n | G) P(G) + P(R_n | P) P(P) = p r_(n+1) + (1 - p) r_(n-1). $
  Cette relation est valable pour tout $n$ tel que $1 <= n <= N - 1$.
  Les conditions aux bords sont :

  #sym.bullet Si le capital est 0, le joueur est ruiné : $r_0 = 1$. 

  #sym.bullet Si le capital atteint $N$, le jeu s'arrête (il n'est pas ruiné) : $r_N = 0$.

+
  + La suite $(r_n)$ satisfait une récurrence linéaire d'ordre 2 à coefficients constants :
    $ p r_(n+1) - r_n + (1 - p) r_(n-1) = 0. $
    L'équation caractéristique associée est $p x^2 - x + (1 - p) = 0$.
    Le discriminant vaut $Delta = 1 - 4p(1 - p) = 1 - 4p + 4p^2 = (2p - 1)^2$.
    Les racines sont :
    $ x_1 = (1 + (2p - 1)) / (2p) = 1 quad "et" quad x_2 = (1 - (2p - 1)) / (2p) = (2(1 - p)) / (2p) = (1 - p) / p. $

    *Cas 1 : $p != 1/2$*.
  
    Les deux racines sont distinctes. La solution générale est de la forme $r_n = A dot 1^n + B dot ((1-p)/p)^n$.
    En utilisant les conditions aux bords :
    $ cases(r_0 = 1 => A + B = 1, r_N = 0 => A + B ((1-p)/p)^N = 0) $
    De la première équation, on a $A = 1 - B$. En injectant dans la seconde :
    $ (1 - B) + B ((1-p)/p)^N = 0 <=> B (((1-p)/p)^N - 1) = -1 <=> B = 1 / (1 - ((1-p)/p)^N). $
    On en déduit $A = 1 - 1 / (1 - ((1-p)/p)^N) = - ((1-p)/p)^N / (1 - ((1-p)/p)^N)$.
    Ainsi :
    $ r_n = ( ((1-p)/p)^n - ((1-p)/p)^N ) / ( 1 - ((1-p)/p)^N ). $

    *Cas 2 :  $p = 1/2$*.

    On a une racine double $x_0 = 1$. La solution générale est de la forme $r_n = A + B n$.
    Avec les conditions aux bords :
    $ cases(r_0 = 1 => A = 1, r_N = 0 => 1 + B N = 0 => B = -1/N) $
    D'où :
    $ r_n = 1 - n / N. $

  + Étudions la limite de $r_n$ lorsque $N$ tend vers $+oo$ (le joueur joue tant qu'il n'est pas ruiné, sans limite supérieure de gain).

  #sym.bullet Si $p = 1/2$ :
  
      $ lim_(N -> +oo) r_n = lim_(N -> +oo) (1 - n/N) = 1. $
      Dans un jeu équitable, la ruine est certaine.

  #sym.bullet  Si $p < 1/2$ (jeu défavorable) :

      On a $(1-p)/p > 1$ donc $((1-p)/p)^N$ tend vers $+oo$.
      Finalement,      $ lim_(N -> +oo) r_n = (-1) / (-1) = 1. $
      Si le jeu est défavorable, la ruine est certaine.

  #sym.bullet Si $p > 1/2$ (jeu favorable) :

      On a $(1-p)/p < 1$. Le terme $((1-p)/p)^N$ tend vers 0.
      $ lim_(N -> +oo) r_n = ( ((1-p)/p)^n - 0 ) / ( 1 - 0 ) = ((1 - p) / p)^n. $
      Dans ce cas, la probabilité de ruine n'est pas égale à 1. Il existe une probabilité strictement positive $(1 - ((1-p)/p)^n)$ que le joueur accumule de la fortune sans jamais être ruiné.
]


#exercice(title: "Formule du produit d'Euler", n_stars:3)[

Pour tout $s > 1$, on pose : $ quad zeta(s) = sum_(m=1)^(+oo) 1 / m^s $

Lors d'une épreuve de lancer de javelot, on suppose que la probabilité que le lanceur obtienne le _score_ $m$, c'est-à-dire qu'après le lancer du javelot, celui-ci se situe à une distance entre $m - 1$ et $m$ (exprimée en mètre) est donnée par :

$ forall m in NN^* space space p_m = lambda / m^s space , space "avec" s > 1 $

On note $L_m$ cet évenement.

+ Justifier que la fonction $zeta$ est bien définie pour tout $s > 1$.

+ Déterminer la valeur du réel $lambda$ en fonction de $s$, de sorte que $(p_m)_(m in NN^*)$ définisse une loi de probabilité.

+ Pour tout $n in NN^*$, on note $A_n$ l'évènement « le score du lanceur est divisible par $n$ ».

  + Montrer que : $ quad forall n in NN^* space space P(A_n) = 1 / n^s $

  + On note $P$ l'ensemble des nombres premiers. Etablir que $(A_p)_(p in P)$ est une famille d'évènements indépendants.
+ En déduire que : $ quad forall s > 1 space space 1 / zeta(s) = product_(p in P) (1 - 1 / p^s) $

+ BONUS : Donner une idée informelle de preuve de l'égalité finale sans utiliser de probabilités.
]

#correction[
+ La série définissant $zeta(s)$ est une série de Riemann d'exposant $s$. Comme $s > 1$, cette série converge absolument. La fonction $zeta$ est donc bien définie sur $]1, +oo[$.

+ Pour que $(p_m)_(m in NN^*)$ définisse une loi de probabilité, il faut que la somme des probabilités vaille 1 :
  $ sum_(m=1)^(+oo) p_m = 1 &<=> sum_(m=1)^(+oo) lambda / m^s = 1 \
  &<=> lambda sum_(m=1)^(+oo) 1 / m^s = 1 \
  &<=> lambda zeta(s) = 1. $
  On en déduit que $lambda = 1 / zeta(s)$.

+
  #set enum(numbering: "a.")
  + L'événement $A_n$ est réalisé si et seulement si le score $m$ est un multiple de $n$. On peut donc écrire $A_n = union.big_(k=1)^(+infinity) L_(k n) $. Les évenements $L_(k n)$ étant incompatibles, on a donc 
    $ P(A_n) = sum_(k=1)^(+oo) P({X = k n}) = sum_(k=1)^(+oo) p_(k n). $
    En utilisant l'expression de $p_m$ et la relation $lambda = 1/zeta(s)$ établie précédemment :
    $ P(A_n) = sum_(k=1)^(+oo) lambda / (k n)^s = lambda / n^s sum_(k=1)^(+oo) 1 / k^s = (lambda zeta(s)) / n^s = 1 / n^s. $

  + Soit $J$ une partie finie de l'ensemble $cal(P)$ des nombres premiers.
    L'événement $inter.big_(p in J) A_p$ correspond à l'événement « le score est divisible par tous les nombres premiers de $J$ ».
    Puisque les nombres premiers sont deux à deux premiers entre eux, un entier est divisible par tous les éléments de $J$ si et seulement si il est divisible par leur produit.
    En notant $N_J = product_(p in J) p$, on a donc :
    $ inter.big_(p in J) A_p = A_(N_J). $
    D'après la question 3.a :
    $ P(inter.big_(p in J) A_p) = P(A_(N_J)) = 1 / (N_J)^s = 1 / (product_(p in J) p)^s = product_(p in J) 1 / p^s. $
    Or, pour tout $p in cal(P)$, $P(A_p) = 1/p^s$. On a donc bien :
    $ P(inter.big_(p in J) A_p) = product_(p in J) P(A_p). $
    La famille $(A_p)_(p in cal(P))$ est donc une famille d'événements mutuellement indépendants.

+ Considérons l'événement « le score vaut 1 ». Puisque 1 est le seul entier naturel non nul qui n'admet aucun diviseur premier (tout entier $n >= 2$ admettant au moins un facteur premier), on a:
  $ L_1= inter.big_(p in cal(P)) overline(A_p). $
  Calculons alors la probabilité de cet événement de deux manières :

  #sym.bullet Directement : $P(X = 1) = p_1 = lambda / 1^s = lambda = 1 / zeta(s)$.

  #sym.bullet Par indépendance : la famille $(A_p)$ étant indépendante, la famille des événements contraires $(overline(A_p))$ l'est aussi. Par le théorème de limite monotone pour les probabilités,   $ P(inter.big_(p in cal(P)) overline(A_p)) = product_(p in cal(P)) P(overline(A_p)) = product_(p in cal(P)) (1 - P(A_p)) = product_(p in cal(P)) (1 - 1 / p^s). $
  On en déduit l'égalité demandée :
  $ 1 / zeta(s) = product_(p in cal(P)) (1 - 1 / p^s). $

  * Remarque * : Cette formule, dûe à #link("https://fr.wikipedia.org/wiki/Leonhard_Euler")[Leonhard Euler], tout à fait surprenante à première vue est d'une importance capitale en mathématiques fondamentales. En effet, elle établit un lien entre un objet analytique (la fonction continue $zeta$), sur lequel les puissants outils de l'Analyse peuvent s'appliquer et les nombres premiers, sur lesquels nous ne disposons que de très peu d'outils. Aujourd'hui encore, ils font partie des objets connus recelant le plus de mystères...

+ Se référer à la vidéo #link("youtube.com/watch?v=u7BadbVwnl4")[suivante], courte et très pédagogique. 
]


