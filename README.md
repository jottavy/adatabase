
Adatabase · La Remise

Base de données relationnelle pour La Remise, une ressourcerie associative : les objets donnés sont collectés, triés, réparés quand c'est possible, revendus à petit prix en boutique, et recyclés sinon. La base suit aussi les bénévoles, leurs compétences et les ateliers de réparation.

Projet back / SQL : conception (Merise), migrations, jeu de données et requêtes métier. Postgres tourne dans Docker.

Arborescence
adatabase/
├── README.md
├── docker-compose.yml       # service Postgres
├── conception/
│   ├── dictionnaire.md      # dictionnaire de données
│   ├── decisions.md         # ambiguïtés tranchées + justifications
│   ├── schema-ea.png        # schéma entité-association
│   ├── schema-relationnel.md
│   └── arbre-dependances.png
├── migration_up.sql         # types ENUM + CREATE TABLE (ordre de dépendances)
├── migration_down.sql       # l'inverse exact, IF EXISTS partout
├── seed.sql                 # données d'exemple crédibles
└── queries.sql              # une requête par question métier
Le schéma en bref
Table	Rôle
Personne	Donateurs, inscrits aux ateliers et bénévoles partagent une seule identité
Benevole	Le rôle de bénévole, rattaché à une Personne
Competence / CompetenceBenevole	Les compétences, en lien plusieurs-à-plusieurs avec les bénévoles
Categorie	Les catégories d'objets
Depot	Un dépôt (boutique ou domicile) fait par une Personne
Objet	Un objet — issu d'un Depot, dans une Categorie, qui suit un parcours de statuts
Reparation	Une réparation d'un Objet par un Benevole (réussie ou échouée)
Vente	Un passage en caisse pouvant porter sur plusieurs objets
Atelier	Un atelier animé par un Benevole
InscriptionAtelier	Une Personne inscrite à un Atelier, avec la présence
Parcours d'un objet : Arrivé → En réparation → En rayon → Vendu, ou Recyclé.

Les 10 questions métier ont chacune leur requête dans queries.sql.


