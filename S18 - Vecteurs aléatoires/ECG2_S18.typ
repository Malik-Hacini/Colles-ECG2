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

  title:"Vecteurs aléatoires",
  classe:"ECG2 - Maths. Approfondies
",
  year:"2025-2026",
  date: "Semaine 18",
  school: "Lycée Champollion",
  show_correction: false,
  show_info_text: true,
  additional_comments: [
#linebreak()

  _Rappelons-nous qu’autrefois, et à une époque qui n’est pas encore bien reculée, une pluie ou une sécheresse extrême, une comète traînant après elle une queue fort étendue, les éclipses, les aurores boréales et généralement tous les phénomènes extraordinaires étaient regardés comme autant de signes de la colère céleste. On invoquait le ciel pour détourner leur funeste influence. [En réalité,] la courbe décrite par une simple molécule d’air ou de vapeurs, est réglée d’une manière aussi certaine, que les orbites planétaires : il n’y a de differences entre elles, que celle qu’y met notre ignorance. La probabilité est relative en partie à cette ignorance, en partie à nos connaissances._

   -- Pierre Simon de Laplace]
)
#show list: it => context {
  let height = measure(it).height / 2
  block(height: height, columns(2, it))
}

#let Sp = $op("Sp")$
#let dotp(..args) = math.angle.l + args.pos().join(math.comma) + math.angle.r


#exercice(title:"Mauvaise file", n_stars : 2)[
Trois personnes entrent simultanément dans une poste ne comportant que deux guichets. On note $X_i$ le temps passé par la i-ème personne au guichet. Les variables $X_i$ sont supposées mutuellement indépendantes et suivant toutes trois la loi uniforme sur $[0,1]$.

+ Déterminer la fonction de répartition de la variable correspondant au temps que doit attendre la troisième personne pour qu'un guichet se libère, notée $Y$.
+ En déduire que $Y$ admet une densité, et déterminer l'une de ses densités.
+ Déterminer une densité de la variable aléatoire correspondant au temps total que la troisième personne passe dans le bureau de poste, notée $Z$.
+ En déduire $E(Z)$ et $V(Z)$.

]

#correction[
+ Pour tout $x in RR$, on a $[Y > x] = [X_1 > x] inter.big [X_2 > x]$.
  Et donc, par indépendance de $X_1$ et $X_2$, il vient
  $ F_Y (x) & = P(Y <= x) \ & = 1 - P(Y > x) = 1 - P([X_1 > x] inter.big [X_2 > x]) 
  \ & = 1 - P(X_1 > 1) P(X_2 > x) \ & = 1 - (1 - F_(X_1) (x))(1 - F_(X_2) (x)) = cases(
    0 & "si" x <= 0,
    1 - (1 - x)^2 & "si" 0 < x < 1,
    1 & "si" x >= 1
  ) $

+ Puisque $F_(X_1)$ et $F_(X_2)$ sont continues sur $RR$ et de classe $cal(C)^1$ sauf éventuellement en un nombre fini de points, il en est de même de $F_Y$.
  Une densité de $Y$ est alors toute fonction coïncidant avec $F'_Y$ là où $F_Y$ est dérivable. Par exemple, on peut prendre
  $ f_Y (x) = cases(
    0 & "si" x <= 0,
    2(1 - x) & "si" 0 < x < 1,
    0 & "si" x >= 1
  ) $

+ Par le lemme des coalitions, $Y = min(X_1, X_2)$ et $X_3$ sont indépendantes.
  Puisque la densité de $X_3$ est bornée, par produit de convolution, une densité de $Y + X_3$ est alors donnée par
  $ h(x) = integral_(-oo)^(+oo) f_Y (t) f_(X_3) (x - t) dif t. $
  Mais on a $f_Y (t) != 0 <=> 0 <= t <= 1$ et $f_(X_3) (x - t) != 0 <=> 0 <= x - t <= 1 <=> x - 1 <= t <= x$.

  Ainsi, pour $x <= 0$, on a $f_Z (x) = 0$.
  De même, pour $x - 1 >= 1 <=> x >= 2$, on a $f_Z (x) = 0$.
  Si $x in [0, 1]$, il vient
  $ f_Z (x) = integral_0^x 2(1 - t) dif t = [ -(1 - t)^2 ]_0^x = 1 - (1 - x)^2 = 2x - x^2. $

  Enfin, pour $1 <= x <= 2$, on a
  $ f_Z (x) = integral_(x-1)^1 2(1 - t) dif t = (2 - x)^2. $

  Une densité de $Z$ est donc
  $ f_Z (x) = cases(
    2x - x^2 & "si" 0 <= x <= 1,
    4 - 4x + x^2 & "si" 1 < x <= 2,
    0 & "sinon"
  ) $

+ Notons que $0 <= Z <= 2$, de sorte que l'existence de l'espérance de $Z$ est garantie. On a alors
  $ E(Z) = integral_(-oo)^(+oo) t f_Z (t) dif t = integral_0^1 t(2t - t^2) dif t + integral_1^2 t(2 - t)^2 dif t = 5/6. $
  De même, le moment d'ordre 2 de $Z$ est donné par
  $ E(Z^2) = integral_(-oo)^(+oo) t^2 f_Z (t) dif t = integral_0^1 t^2 (2t - t^2) dif t + integral_1^2 t^2 (2 - t)^2 dif t = 5/6. $
  Et donc, par la formule de Huygens, la variance de $Z$ vaut
  $ V(Z) = E(Z^2) - E(Z)^2 = 5/6 - 25/36 = 5/36. $
]

/* #pagebreak() */

#exercice(title: "Minimum", n_stars:2)[
Un sac contient $N$ boules numérotées de 1 à $N$. On effectue dans ce sac $n$ tirages uniformes d'une boule avec remise et on note $Z_n$ le plus petit numéro obtenu. Déterminer la loi de $Z_n$.
]

#correction[
Commençons par remarquer que $Z_n (Omega) = ⟦ 1, N ⟧$.
Notons $X_i$ le numéro de la boule obtenue lors du $i$-ème tirage, de sorte que $X_i arrow.r.hook cal(U)(⟦ 1, N ⟧)$.
De plus, les tirages ayant lieu avec remise, $X_1, dots, X_n$ sont mutuellement indépendantes.
On a alors $Z_n = min(X_1, dots, X_n)$.

Pour tout $k in ⟦ 1, N ⟧$, on a donc $[Z_n >= k] = display(inter.big_(i=1)^n [X_i >= k])$, et par indépendance des $X_i$,
$ P(Z_n >= k) = product_(i=1)^n P(X_i >= k) = P(X_1 >= k)^n. $

Or $ P(X_1 >= k) = sum_(ell=k)^N P(X_1 = ell) = sum_(ell=k)^N 1/N = (N - k + 1) / N . $

Ainsi, il vient $P(Z_n >= k) = ((N - k + 1) / N)^n$.

Enfin, puisque $Z_n$ est à valeurs entières, on a $[Z_n >= k] = [Z_n = k] union [Z_n >= k + 1]$, de sorte que
$ P(Z_n >= k) = P(Z_n = k) + P(Z_n >= k + 1) <=> P(Z_n = k) = P(Z_n >= k) - P(Z_n >= k + 1). $

Et donc, pour tout $k in ⟦ 1, N ⟧$,
$ P(Z_n = k) = ((N - k + 1) / N)^n - ((N - k) / N)^n. $

Notons que pour $k = N$, on obtient $P(Z_n = N) = 1/N^n$, ce qui était prévisible, puisque le seul moyen que la plus petite des boules porte le numéro $N$ est d'avoir tiré $n$ fois la boule $N$.
]

/* #pagebreak() */

#exercice(title: "Marche aléatoire", n_stars:2)[
Soit $p in ]0, 1[$. On considère une suite $(X_n)_(n in NN^*)$ de variables aléatoires mutuellement indépendantes, de même loi, et telles que $P(X_1 = -1) = 1 - p$ et $P(X_1 = 1) = p$. On pose $S_n = sum_(k=1)^n X_k$.

+ Déterminer deux réels $a$ et $b$ tels que $Y_n = a X_n + b$ suive une loi de Bernoulli de paramètre $p$.
+ En utilisant la question précédente, déterminer la loi de $S_n$ et calculer son espérance.
*Application* :
 #set enum(start: 3) 
  + Un ivrogne sort du bar, et chaque seconde avance d'un mètre vers la droite avec probabilité $p$, ou d'un mètre vers la gauche avec probabilité $1 - p$. \
    En moyenne, où se trouve-t-il après 10 secondes ?
  + Proposer un programme `Python` simulant la marche d'un tel ivrogne pendant 1000 secondes, avec $p = 1/2$.
]

#correction[
  + $Y_n = 1/2 (X_n + 1)$ ne prend que les valeurs 0 et 1, avec $P(Y_n = 1) = P(X_n = 1) = p$, donc suit une loi de Bernoulli $cal(B)(p)$.

+ On a
  $ S_n = sum_(k=1)^n X_k = sum_(k=1)^n (2 Y_k - 1) = 2 sum_(k=1)^n Y_k - n $
  et $sum_(k=1)^n Y_k$ suit une loi binomiale $cal(B)(n, p)$ car les $Y_i$ sont indépendantes.
  De plus, $S_n$ prend ses valeurs dans $⟦ -n, n ⟧$, et donc pour tout $k in ⟦ -n, n ⟧$,
  $ P(S_n = k) & = P(2 sum_(k=1)^n Y_k = k + n) \ & = P(sum_(k=1)^n Y_k  = (k + n) / 2) = cases(
    0 & "si" k + n "est impair",
    binom(n, (k + n) / 2) p^((k + n) / 2) (1 - p)^((2 - k - n) / 2) & "si" k + n "est pair"
  ) $
  On a alors, par linéarité de l'espérance,
  $ E(S_n) = sum_(i=1)^n E(X_i) = sum_(i=1)^n ((-1)(1 - p) + p) = n(2p - 1). $

*Application* :
 #set enum(start: 3)
 + Si on note $X_i$ la variable aléatoire qui vaut 1 si l'ivrogne se déplace vers la gauche et -1 s'il se déplace d'un mètre sur la droite, alors $S_n$ désigne sa position à l'instant $n$.
    En particulier, on a
    $ E(S_10) = 2 times 10 times p - 10 = 20p - 10. $
    *Remarque* : Si $p = 0.5$, alors en moyenne il est revenu à son point de départ, que si $p > 0.5$, alors il se sera en moyenne déplacé vers la gauche, et que si $p < 0.5$, alors il se sera en moyenne déplacé vers la droite.
 + ```python
import random

def simulation_ivrogne(n_secondes, p):
    position = 0
    
    for _ in range(n_secondes):
        tirage = random.random()
        if tirage < p:
            position = position + 1
        else:
            position = position - 1
    return position

duree = 1000    
p = 0.5     

resultat = simulation_ivrogne(duree, proba_p)
print(f"Après {duree} secondes, l'ivrogne est à la position : {resultat}")

  ```
]

#exercice(title: "Poissons géométriques", n_stars:3)[
Toutes les variables aléatoires de l'exercice sont définies sur un espace probabilisé $(Omega, cal(A), P)$.

On considère une suite $(X_n)_(n in NN^*)$ de variables aléatoires indépendantes, suivant toutes la loi géométrique de paramètre $p$, où $p$ est un réel de $]0, 1[$. On pose de plus $q = 1 - p$.

Pour tout entier naturel $n$ non nul, on pose : $S_n = sum_(i=1)^n X_i$.

On considère également une variable aléatoire $N$, à valeur dans $NN^*$, possédant une espérance et indépendante des variables aléatoires $X_n$.

Pour tout $omega$ de $Omega$, on pose $S(omega) = display( sum_(i=1)^(N(omega)) X_i (omega))$ et on admet que $display(S = sum_(i=1)^N X_i)$ est une variable aléatoire.

Enfin, on rappelle la formule suivante, que l'on pourra utiliser sans la justifier. Pour tous entiers naturels $r$ et $s$ tels que $r <= s$, on a :
$ sum_(j=r)^s binom(j, r) = binom(s+1, r+1) $

+ Déterminer $S_n (Omega)$. Montrer que l'on a :
  $ forall k in S_n (Omega), quad P([S_n = k]) = binom(k-1, n-1) p^n q^(k-n) $

+
  + Vérifier pour tout $n in NN^*$, l'existence de l'espérance conditionnelle $E(S | [N=n])$ et donner sa valeur.
  + En déduire $E(S)$.

+ On suppose dans cette question que $N$ suit la loi géométrique de paramètre $p$. Déterminer la loi de $S$.
]


#correction[
+

  Puisque chaque $X_i$ suit une loi géométrique, on a $X_i (Omega) = NN^*$.
  Ainsi, la somme des $n$ termes vaut au minimum $n$.
  On a donc $S_n (Omega) = ⟦ n, +oo ⟦$.

  Montrons par récurrence la propriété $ cal(P)(n) : forall k >= n, P(S_n = k) = binom(k-1, n-1) p^n q^(k-n). $

  *Initialisation ($n=1$) :*

  $P(S_1 = k) = P(X_1 = k) = p q^(k-1)$.
  La formule donne $binom(k-1, 0) p^1 q^(k-1) = 1 dot p q^(k-1)$.

  *Hérédité :* 

  Supposons $cal(P)(n)$ vraie.
  On a $S_(n+1) = S_n + X_(n+1)$. Par la formule des probabilités totales (convolution discrète):
  $ P(S_(n+1) = k) = sum_(j=n)^(k-1) P(S_n = j) P(X_(n+1) = k - j). $
  En utilisant l'hypothèse de récurrence :
  $ P(S_(n+1) = k) & = sum_(j=n)^(k-1) binom(j-1, n-1) p^n q^(j-n) times p q^(k-j-1) \ & =
   p^(n+1) q^(k-(n+1)) sum_(j=n)^(k-1) binom(j-1, n-1). $
  On pose le changement d'indice $i = j-1$. La somme devient :
  $ sum_(i=n-1)^(k-2) binom(i, n-1) $
  D'après la formule rappelée dans l'énoncé avec $r = n-1$ et $s = k-2$ :
  $ sum_(i=n-1)^(k-2) binom(i, n-1) = binom((k-2)+1, (n-1)+1) = binom(k-1, n) $
  Finalement :
  $ P(S_(n+1) = k) = binom(k-1, n) p^(n+1) q^(k-(n+1)) $
  Ce qui achève la récurrence.


+ 
  + Conditionnellement à $[N=n]$, $S$ est la somme déterministe de $n$ variables $X_i$ indépendantes. Par linéarité de l'espérance :
    $ E(S | [N=n]) = E(S_n) = sum_(i=1)^n E(X_i) = n E(X_1) $
    Comme $X_1 arrow.r.hook cal(G)(p)$, $E(X_1) = 1/p$.
    Donc :
    $ E(S | [N=n]) = n/p $

  +     D'après la formule de l'espérance totale:    $ E(S) = sum_(n=1)^(+oo) E(S | [N=n]) P(N=n) = sum_(n=1)^(+oo) n/p P(N=n) = 1/p sum_(n=1)^(+oo) n P(N=n) = 1/p E(N) $
    On sait que $N$ possède une espérance, donc $E(S)$ existe et vaut $E(N)/p$.

+
On applique la formule des probabilités totales :
$ P(S = k) = sum_(n=1)^(+oo) P(S = k | N = n) P(N = n) $
On sait que $P(S=k | N=n) = P(S_n=k)$, qui est nul si $n > k$. La somme s'arrête donc à $k$.
$ P(S = k) & = sum_(n=1)^(k) binom(k-1, n-1) p^n q^(k-n) times p q^(n-1) \ & =
sum_(n=1)^(k) binom(k-1, n-1) p^(n+1) q^(k-1) \ &
= p^2 q^(k-1) sum_(n=1)^(k) binom(k-1, n-1) p^(n-1) $
On pose $j = n-1$. La somme va de $0$ à $k-1$ :
$ P(S = k) = p^2 q^(k-1) underbrace(sum_(j=0)^(k-1) binom(k-1, j) p^j 1^((k-1)-j), (1+p)^(k-1)) $
On obtient donc :
$ P(S = k) = p^2 q^(k-1) (1+p)^(k-1) = p^2 [q(1+p)]^(k-1) $
Or $q(1+p) = (1-p)(1+p) = 1 - p^2$.
Ainsi :
$ forall k in NN^*, quad P(S = k) = p^2 (1 - p^2)^(k-1) $

$S$ suit une loi géométrique de paramètre $p^2$.

]
