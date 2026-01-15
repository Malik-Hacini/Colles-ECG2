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
TODO
]
#exercice(title: "La maison gagne toujours", n_stars:1)[
Au casino, un croupier mélange trois cartes : as de cœur, roi de cœur et valet de pique. Il les présente face cachée, et un joueur choisit l’une des cartes au hasard. Si c’est un cœur, il gagne deux euros pour le roi et un euro pour l’as, et le jeu recommence. Si c’est le valet de pique, le jeu s’arrête.
On note $N$ le nombre de cartes tirées par le joueur, et $X$ la somme qu’il a gagnée à la fin de la partie.

+ Déterminer la loi de $N$.

+ Déterminer la loi de $X$ sachant que $N = n$, et calculer $bold(E)(X|N = n)$.

+ Utiliser la formule de l’espérance totale pour calculer $bold(E)(X)$. Quel prix minimum le casino doit-il faire payer les parties pour que le jeu soit rentable?
]
#exercice(title: "Gourmandise", n_stars:2)[
On considère un joueur qui effectue une série de manches indépendantes. A chaque manche, il gagne 1 point avec la probabilité $p$, sinon il perd 1 point avec la probabilité $1 - p$. Le jeu s'arrête lorsque le joueur est ruiné ou lorsque le joueur atteint un capital de $N$ points qu'il s'est fixé comme objectif. On note $r_n$ la probabilité que le joueur soit ruiné en partant avec un capital de $n$ points.

+ Montrer que les termes de la suite $(r_n)_(n in NN)$ vérifie une relation de récurrence à préciser.

+ + Déterminer l'expression explicite de $r_n$ en fonction de $p$. \
  + Que se passe-t-il lorsque $N$ tend vers $+oo$ ? Interpréter ce résultat.
]
#correction[
TODO
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

]


