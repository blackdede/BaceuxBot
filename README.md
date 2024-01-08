
#   
BaceuxBOT - Projet d'Architecture

## Description du Projet

Ce projet marque notre première incursion dans le langage assembleur et l'utilisation de la carte Evalbot de Stellaris. Notre objectif était de concevoir un scénario complet en exploitant nos nouvelles compétences en assembleur, en mettant l'accent sur l'utilisation des entrées et sorties de la carte Evalbot.

Notre choix s'est porté sur la création d'un robot policier, le "BaceuxBOT" de la "Brigade de l’Assembleur c’est Cool" (BAC). Nous avons intégré des fonctionnalités interactives basées sur les éléments spécifiques de la carte, tels que les bumpers, les boutons, les moteurs et les LEDs.

## Scénario Choisi

Le "BaceuxBOT" est chargé de maintenir l'ordre dans le groupe 1I en réagissant aux comportements néo-délinquants des robots de course. En s'inspirant de l'article L236-1 du code de la route, le robot intervient pour assurer la sécurité et la tranquillité publique en cas de manœuvres dangereuses.

## Organisation

Face à la complexité du projet, nous avons adopté une approche agile en 4 sprints :

1.  **Sprint 1:** Apprentissage de la carte et des GPIO, exercices pratiques sur les LEDs.
2.  **Sprint 2:** Développement des fonctionnalités du robot en lien avec le scénario.
3.  **Sprint 3:** Correction des bugs, documentation du code pour une compréhension facilitée.
4.  **Sprint 4:** Rédaction du rapport et préparation de la présentation finale.

## Fonctionnalités du Robot "BaceuxBOT"

Le "BaceuxBOT" dispose de deux modes :

### Mode Poursuite

-   Le robot roule à sa vitesse maximale tout droit, avec les LEDs en mode gyrophare.
-   En cas d'obstacle, recule de 40 centimètres, tourne dans la direction dégagée en activant les clignotants.

### Mode Intervention

-   Activation en appuyant sur le deuxième bouton.
-   Le robot s'arrête, fige ses lumières pour rester bien visible.
-   Les agents sont en intervention, le robot ne bouge pas.

## Arborescence du Code Source

Le code source est organisé en plusieurs fichiers modules pour faciliter la compréhension et la maintenance. Les principaux modules sont Bumper, Led, Moteurs et Switch, appelés depuis le fichier principal.

Le code source est disponible [ici](https://github.com/blackdede/BaceuxBot).

## Problèmes Rencontrés

Le défi majeur résidait dans la coordination de plusieurs composants simultanément, tels que le pare-chocs et le commutateur. La solution consistant à vérifier l'état des éléments à chaque décrémentation de la boucle s'est avérée prometteuse.

## Conclusion

Ce projet a été une expérience enrichissante. La découverte de l'assembleur et l'utilisation de la carte Evalbot ont constitué des défis stimulants. L'organisation en sprints, avec une méthodologie agile, a facilité notre progression. La création du "BaceuxBOT" a ajouté une dimension ludique à notre apprentissage, démontrant nos compétences nouvellement acquises.

La collaboration via GitHub a simplifié le travail d'équipe, et les problèmes rencontrés ont été des opportunités d'apprentissage significatives. En fin de compte, ce projet nous a permis d'acquérir de nouvelles compétences, de relever des défis techniques et de travailler de manière collaborative. Nous sommes fiers du "BaceuxBOT" et de tout ce que nous avons appris.
