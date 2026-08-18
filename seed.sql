-- Catégories (au moins 8)
INSERT INTO
    Categorie (categorie_nom)
VALUES ('Meubles'),
    ('Électroménager'),
    ('Vêtements'),
    ('Livres'),
    ('Jouets'),
    ('Vaisselle'),
    ('Bricolage'),
    ('Décoration');

-- Compétences
INSERT INTO
    Competence (competence_nom)
VALUES ('Électricité'),
    ('Menuiserie'),
    ('Couture'),
    ('Informatique');

-- Personnes (au moins 10)
INSERT INTO
    Personne (
        personne_nom,
        personne_prenom,
        personne_telephone,
        personne_adherent
    )
VALUES (
        'Dupont',
        'Jean',
        '0601020304',
        TRUE
    ),
    (
        'Martin',
        'Sophie',
        '0611223344',
        FALSE
    ),
    (
        'Bernard',
        'Lucas',
        '0622334455',
        TRUE
    ),
    (
        'Petit',
        'Marie',
        '0633445566',
        FALSE
    ),
    (
        'Moreau',
        'Pierre',
        '0644556677',
        TRUE
    ),
    (
        'Lefebvre',
        'Julie',
        '0655667788',
        FALSE
    ),
    (
        'Garcia',
        'Thomas',
        '0666778899',
        TRUE
    ),
    (
        'Roux',
        'Camille',
        '0677889900',
        FALSE
    ),
    (
        'Fournier',
        'Antoine',
        '0688990011',
        TRUE
    ),
    (
        'Girard',
        'Emma',
        '0699001122',
        FALSE
    );

-- Ventes (au moins 10)
INSERT INTO
    Vente (
        vente_date,
        vente_mode_paiement
    )
VALUES (
        '2026-08-01 10:15:00',
        'Espèces'
    ),
    (
        '2026-08-02 11:30:00',
        'Carte'
    ),
    (
        '2026-08-03 14:20:00',
        'Carte'
    ),
    (
        '2026-08-04 16:45:00',
        'Chèque'
    ),
    (
        '2026-08-05 09:10:00',
        'Espèces'
    ),
    (
        '2026-08-06 15:00:00',
        'Carte'
    ),
    (
        '2026-08-07 10:50:00',
        'Espèces'
    ),
    (
        '2026-08-08 17:15:00',
        'Carte'
    ),
    (
        '2026-08-09 12:00:00',
        'Carte'
    ),
    (
        '2026-08-10 14:30:00',
        'Espèces'
    );

-- Bénévoles (au moins 12 : personne_id de 1 à 10 + créer 2 personnes si besoin, ou lier aux personnes existantes)
-- Attention : personne_id est UNIQUE dans Benevole !
INSERT INTO
    Benevole (
        personne_id,
        benevole_date_inscription
    )
VALUES (1, '2026-01-10 09:00:00'),
    (2, '2026-01-12 10:00:00'),
    (3, '2026-01-15 14:00:00'),
    (4, '2026-02-01 11:00:00'),
    (5, '2026-02-05 09:30:00');
-- (Complète jusqu'à 12 bénévoles)

-- Dépôts
INSERT INTO
    Depot (
        depot_type,
        depot_date,
        personne_id
    )
VALUES (
        'Boutique',
        '2026-07-01 10:00:00',
        1
    ),
    (
        'Domicile',
        '2026-07-02 14:00:00',
        2
    ),
    (
        'Boutique',
        '2026-07-05 11:15:00',
        3
    );

-- Ateliers (au moins 4)
INSERT INTO
    Atelier (
        atelier_nom,
        atelier_date,
        atelier_duree,
        atelier_nombre_place,
        benevole_id
    )
VALUES (
        'Initiation Couture',
        '2026-09-01 14:00:00',
        '2 hours',
        8,
        1
    ),
    (
        'Réparation Électro',
        '2026-09-05 10:00:00',
        '3 hours',
        5,
        2
    ),
    (
        'Atelier Menuiserie',
        '2026-09-10 14:00:00',
        '4 hours',
        6,
        3
    ),
    (
        'Recyclage Informatique',
        '2026-09-15 09:00:00',
        '2 hours',
        10,
        4
    );

-- CompetenceBenevole
INSERT INTO
    CompetenceBenevole (competence_id, benevole_id)
VALUES (1, 1),
    (3, 1), -- Bénévole 1 a électricité et couture
    (2, 2);

-- Note : vente_id vaut NULL si l'objet n'est pas encore vendu !
INSERT INTO
    Objet (
        objet_nom,
        objet_etat,
        objet_statut,
        objet_prix,
        vente_prix_final,
        depot_id,
        categorie_id,
        vente_id
    )
VALUES
    -- Objets VENDUS (liés à une Vente et un vente_prix_final)
    (
        'Chaise en chêne',
        'Bon état',
        'Vendu',
        25.00,
        20.00,
        1,
        1,
        1
    ),
    (
        'Grille-pain Vintage',
        'À réparer',
        'Vendu',
        10.00,
        10.00,
        1,
        2,
        2
    ),
    (
        'Veste en cuir',
        'Bon état',
        'Vendu',
        30.00,
        30.00,
        2,
        3,
        3
    ),

-- Objets EN RAYON (vente_id = NULL)
(
    'Table basse glass',
    'Bon état',
    'En rayon',
    40.00,
    NULL,
    2,
    1,
    NULL
),
(
    'Roman SF Lot',
    'Bon état',
    'En rayon',
    5.00,
    NULL,
    3,
    4,
    NULL
),

-- Objets EN RÉPARATION (vente_id = NULL)
(
    'Aspirateur sans sac',
    'À réparer',
    'En réparation',
    15.00,
    NULL,
    1,
    2,
    NULL
),

-- Objets ARRIVÉS ou RECYCLÉS (vente_id = NULL)
( 'Lape cassée', 'Hors service', 'Recyclé', 0.00, NULL, 3, 2, NULL );
-- (Complète avec les lignes manquantes pour atteindre au moins 40 objets)

-- Réparations (au moins 15)
INSERT INTO
    Reparation (
        reparation_date_debut,
        reparation_duree,
        reparation_statut,
        benevole_id,
        objet_id
    )
VALUES (
        '2026-07-10 09:00:00',
        '1 hour 30 mins',
        TRUE,
        1,
        2
    ),
    (
        '2026-07-12 14:00:00',
        '2 hours',
        FALSE,
        2,
        6
    );
-- (Complète jusqu'à 15 réparations)

-- Inscriptions aux ateliers
INSERT INTO
    InscriptionAtelier (
        personne_id,
        atelier_id,
        date_inscription,
        presence
    )
VALUES (
        1,
        1,
        '2026-08-20 10:00:00',
        TRUE
    ),
    (
        2,
        1,
        '2026-08-21 11:30:00',
        FALSE
    ),
    (
        3,
        2,
        '2026-08-22 14:00:00',
        TRUE
    );