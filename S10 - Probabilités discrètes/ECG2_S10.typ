#import "@local/mh_colle:1.0.0": *
 
#show: project.with(
  authors:"M. Hacini",

  title:"Probabilités discrètes",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 9",
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

#exercice(title: "L'infinité des coups de midi", n_stars:2)[
Un candidat à un jeu télévisé doit répondre successivement à un nombre non exhaustif de questions indépendantes indexées sur $NN^*$. Il est éliminé dès qu’il donne une réponse incorrecte à l’une des questions posées et on note $X$ la variable aléatoire qui est égale au numéro de la dernière réponse correcte donnée par le candidat. Si le candidat ne répond pas correctement dès la première question, alors on pose $X = 0$.

*Cas 1* : On suppose que la probabilité de répondre correctement à la question numérotée $n$ est égale exactement à $1/n$, avec $n in NN^*$.

+  + Déterminer la loi associée à la variable aléatoire $X$.
   + Déterminer l’espérance et la variance de $X$.

    _Indication_: On pourra considérer les variables aléatoires $Y = X + 1$ et $Z = X^2 - 1$.

*Cas 2* : On suppose que la probabilité de répondre correctement à la question numérotée $n$ est égale exactement à $((n-1)/n)^2$, avec $n in NN$ et $n >= 2$.

+ 
  + Déterminer la loi associée à la variable aléatoire $X$.
  + Déterminer l’espérance de $X$.

+ Comparer les deux cas, puis conclure.
]

#correction[

On note $S_n$ l'événement "le candidat répond correctement à la question $n$".
D'après l'énoncé, les questions sont indépendantes.
La variable aléatoire $X$ est égale à $k$ si et seulement si le candidat réussit les $k$ premières questions et échoue à la $(k+1)$-ième.
$ [X = k] = S_1 inter dots inter S_k inter overline(S_(k+1)). $


+
  + 
    La probabilité de répondre correctement à la question $n$ est $p_n = P(S_n) = 1/n$.
    On a donc $P(overline(S_n)) = 1 - 1/n = (n-1)/n$.
    Pour $n=1$, $p_1 = 1$, donc le candidat répond toujours correctement à la première question. Ainsi, $X >= 1$ et $P(X=0) = 0$.

    Soit $k in NN^*$. Par indépendance des questions :
    $ P(X=k) &= P(S_1) times P(S_2) times dots times P(S_k) times P(overline(S_(k+1))) \
             &= (product_(i=1)^k 1/i) times (1 - 1/(k+1)) \
             &= 1/(k!) times k/(k+1). $
    Ainsi, $forall k in NN^*, P(X=k) = k / ((k+1)!)$.

  + 
    Considérons la variable $Y = X + 1$. $Y$ prend ses valeurs dans $NN backslash {0, 1}$.
    Pour $j >= 2$, on a :
    $ P(Y = j) = P(X = j - 1) = (j-1) / (j!) = j/(j!) - 1/(j!) = 1/((j-1)!) - 1/(j!). $
    On reconnaît le terme général d'une somme télescopique. Alors,
    $ E(Y) &= sum_(j=2)^(+oo) j P(Y=j) = sum_(j=2)^(+oo) j (j-1)/(j!) = sum_(j=2)^(+oo) 1/((j-2)!) = sum_(m=0)^(+oo) 1/(m!) = e. $
    Comme $X = Y - 1$, par linéarité :
    $ E(X) = E(Y) - 1 = e - 1. $

    Pour la variance, Calculons $E(Y(Y+1))$ :
    $ E(Y(Y+1)) &= sum_(j=2)^(+oo) j(j+1) (j-1)/(j!)  & = sum_(j=2)^(+oo) (j^2 - 1)/( (j-1)! ) 
    &= sum_(j=2)^(+oo) ( (j-1)(j+1) ) / ( (j-1)! )  & = sum_(j=2)^(+oo) (j+1)/( (j-2)! ). $
    Posons $m = j-2$ :
    $ E(Y^2 + Y) = sum_(m=0)^(+oo) (m + 3)/(m!) = sum_(m=1)^(+oo) m/(m!) + 3 sum_(m=0)^(+oo) 1/(m!) = e + 3e = 4e. $
    On en déduit $E(Y^2) = 4e - E(Y) = 4e - e = 3e$.
    Enfin, $V(X) = V(Y) = E(Y^2) - E(Y)^2 = 3e - e^2 = e(3 - e)$.


+
  + 
    Calculons d'abord la probabilité de réussir les $k$ premières questions ($k >= 1$).
    $ P(X >= k) = P(S_1 inter dots inter S_k) = p_1 times product_(i=2)^k ((i-1)/i)^2. $
    Le produit est télescopique :
    $ product_(i=2)^k ((i-1)/i)^2 = (1^2/2^2) times (2^2/3^2) times dots times ((k-1)^2/k^2) = 1/k^2. $
    Donc $P(X >= k) = 1/k^2$.
    On en déduit la loi de $X$ par différence :
    $ P(X=k) = P(X >= k) - P(X >= k+1) = 1/k^2 - 1/(k+1)^2 = (2k+1)/( k^2 (k+1)^2 ). $

  + Puisque $X$ est une variable à valeurs entières positives, on peut utiliser la formule suivante (exercice):
    $ E(X) = sum_(k=1)^(+oo) P(X >= k) = sum_(k=1)^(+oo) 1/k^2 = pi^2/6. $
   


Comparons les espérances obtenues dans les deux cas :
- Cas 1 : $E_1 = e - 1 approx 1,718$.
- Cas 2 : $E_2 = pi^2/6 approx 9,87/6 approx 1,645$.

On constate que $E_1 > E_2$.

Bien que dans le second cas, la probabilité de succès $p_n = (1 - 1/n)^2$ tende vers 1 lorsque $n$ devient grand (les questions deviennent "faciles"), le "tri" se fait très sévèrement au début.
En effet, pour la question 2 :
- Cas 1 : probabilité de succès $1/2 = 0,5$.
- Cas 2 : probabilité de succès $(1/2)^2 = 0,25$.

Le handicap initial du second cas (probabilités de succès faibles pour les petits $n$) pèse plus lourd dans l'espérance que l'avantage à long terme (queue de distribution plus épaisse).
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

