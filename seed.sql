-- ============================================================================
-- NETTOYAGE DES DONNÉES EXISTANTES
-- ============================================================================

TRUNCATE TABLE InscriptionAtelier,
Reparation,
Objet,
CompetenceBenevole,
Atelier,
Depot,
Benevole,
Vente,
Personne,
Competence,
Categorie RESTART IDENTITY CASCADE;

-- ============================================================================
-- NIVEAU 0 : Tables sans dépendances
-- ============================================================================

-- Catégories
INSERT INTO
    Categorie (categorie_nom)
VALUES ('Meubles'),
    ('Électroménager'),
    ('Vêtements'),
    ('Livres'),
    ('Jouets'),
    ('Vaisselle'),
    ('Bricolage'),
    ('Décoration'),
    ('Informatique'),
    ('Loisirs & Sport');

-- Compétences
INSERT INTO
    Competence (competence_nom)
VALUES ('Électricité'),
    ('Menuiserie'),
    ('Couture'),
    ('Informatique'),
    ('Mécanique vélo'),
    ('Plomberie');

-- Personnes
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
        TRUE
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
        TRUE
    ),
    (
        'Garcia',
        'Thomas',
        '0666778899',
        FALSE
    ),
    (
        'Roux',
        'Camille',
        '0677889900',
        TRUE
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
    ),
    (
        'Bonnet',
        'Nicolas',
        '0701020304',
        TRUE
    ),
    (
        'Lambert',
        'Clara',
        '0711223344',
        TRUE
    ),
    (
        'Fontaine',
        'Julien',
        '0722334455',
        TRUE
    ),
    (
        'Rousseau',
        'Manon',
        '0733445566',
        FALSE
    ),
    (
        'Vincent',
        'Hugo',
        '0744556677',
        TRUE
    );

-- Ventes
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
    ),
    (
        '2026-08-12 11:00:00',
        'Carte'
    ),
    (
        '2026-08-14 16:20:00',
        'Espèces'
    );

-- ============================================================================
-- NIVEAU 1 : Bénévoles et Dépôts
-- ============================================================================

-- Bénévoles
INSERT INTO
    Benevole (
        personne_id,
        benevole_date_inscription
    )
VALUES (1, '2026-01-10 09:00:00'),
    (2, '2026-01-12 10:00:00'),
    (3, '2026-01-15 14:00:00'),
    (4, '2026-01-20 11:00:00'),
    (5, '2026-02-01 11:00:00'),
    (6, '2026-02-05 09:30:00'),
    (7, '2026-02-08 14:00:00'),
    (8, '2026-02-10 15:00:00'),
    (9, '2026-03-01 10:00:00'),
    (10, '2026-03-10 16:00:00'),
    (11, '2026-03-15 14:30:00'),
    (12, '2026-04-02 09:00:00');

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
    ),
    (
        'Boutique',
        '2026-07-10 09:30:00',
        4
    ),
    (
        'Domicile',
        '2026-07-12 16:00:00',
        7
    ),
    (
        'Boutique',
        '2026-07-15 10:45:00',
        10
    ),
    (
        'Boutique',
        '2026-07-20 14:15:00',
        12
    ),
    (
        'Domicile',
        '2026-07-25 11:00:00',
        14
    );

-- ============================================================================
-- NIVEAU 2 : Ateliers, Compétences Bénévoles, Objets
-- ============================================================================

-- Ateliers
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
    ),
    (
        'Entretien Vélo',
        '2026-09-20 10:00:00',
        '3 hours',
        8,
        5
    );

-- CompetenceBenevole
INSERT INTO
    CompetenceBenevole (competence_id, benevole_id)
VALUES (1, 1),
    (3, 1),
    (2, 2),
    (6, 2),
    (2, 3),
    (4, 4),
    (5, 5),
    (1, 6),
    (2, 6),
    (3, 7),
    (4, 8);

-- Objets
INSERT INTO
    Objet (
        objet_nom,
        objet_etat,
        objet_poids,
        objet_statut,
        objet_prix,
        vente_prix_final,
        depot_id,
        categorie_id,
        vente_id
    )
VALUES (
        'Chaise en chêne',
        'Bon état',
        5.50,
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
        1.20,
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
        1.80,
        'Vendu',
        30.00,
        30.00,
        2,
        3,
        3
    ),
    (
        'Micro-ondes',
        'Bon état',
        12.00,
        'Vendu',
        35.00,
        30.00,
        1,
        2,
        4
    ),
    (
        'Lot de 5 assiettes',
        'Bon état',
        2.50,
        'Vendu',
        8.00,
        8.00,
        2,
        6,
        5
    ),
    (
        'VTT Homme',
        'À réparer',
        14.00,
        'Vendu',
        45.00,
        40.00,
        3,
        10,
        6
    ),
    (
        'Manteau d''hiver',
        'Bon état',
        2.00,
        'Vendu',
        20.00,
        20.00,
        1,
        3,
        7
    ),
    (
        'Encyclopédie 10 vol',
        'Bon état',
        8.50,
        'Vendu',
        15.00,
        12.00,
        2,
        4,
        8
    ),
    (
        'Jeu de construction',
        'Bon état',
        1.10,
        'Vendu',
        12.00,
        10.00,
        3,
        5,
        9
    ),
    (
        'Miroir doré',
        'Bon état',
        4.00,
        'Vendu',
        25.00,
        25.00,
        1,
        8,
        10
    ),
    (
        'Écran PC 24 pouces',
        'Bon état',
        3.80,
        'Vendu',
        40.00,
        35.00,
        4,
        9,
        11
    ),
    (
        'Chaise de bureau',
        'Bon état',
        7.00,
        'Vendu',
        18.00,
        15.00,
        5,
        1,
        12
    ),
    (
        'Table basse verre',
        'Bon état',
        15.00,
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
        0.90,
        'En rayon',
        5.00,
        NULL,
        3,
        4,
        NULL
    ),
    (
        'Machine à café',
        'Bon état',
        3.20,
        'En rayon',
        18.00,
        NULL,
        1,
        2,
        NULL
    ),
    (
        'Canapé 2 places',
        'Bon état',
        35.00,
        'En rayon',
        80.00,
        NULL,
        2,
        1,
        NULL
    ),
    (
        'BD Tintin T1',
        'Bon état',
        0.40,
        'En rayon',
        4.00,
        NULL,
        3,
        4,
        NULL
    ),
    (
        'Perceuse filaire',
        'À réparer',
        2.30,
        'En rayon',
        15.00,
        NULL,
        1,
        7,
        NULL
    ),
    (
        'Lampe de chevet',
        'Bon état',
        1.10,
        'En rayon',
        10.00,
        NULL,
        2,
        8,
        NULL
    ),
    (
        'Robot pâtissier',
        'Bon état',
        6.50,
        'En rayon',
        50.00,
        NULL,
        3,
        2,
        NULL
    ),
    (
        'Jeu Monopoly',
        'Bon état',
        1.00,
        'En rayon',
        8.00,
        NULL,
        1,
        5,
        NULL
    ),
    (
        'Trieur en bois',
        'Bon état',
        2.00,
        'En rayon',
        12.00,
        NULL,
        2,
        1,
        NULL
    ),
    (
        'Veste de pluie',
        'Bon état',
        0.70,
        'En rayon',
        14.00,
        NULL,
        3,
        3,
        NULL
    ),
    (
        'Lot de verres',
        'Bon état',
        1.80,
        'En rayon',
        6.00,
        NULL,
        1,
        6,
        NULL
    ),
    (
        'Radiateur bain d''huile',
        'Bon état',
        9.00,
        'En rayon',
        22.00,
        NULL,
        2,
        2,
        NULL
    ),
    (
        'Poupée ancienne',
        'Bon état',
        0.60,
        'En rayon',
        15.00,
        NULL,
        3,
        5,
        NULL
    ),
    (
        'Clavier USB',
        'Bon état',
        0.80,
        'En rayon',
        7.00,
        NULL,
        4,
        9,
        NULL
    ),
    (
        'Souris sans fil',
        'Bon état',
        0.20,
        'En rayon',
        5.00,
        NULL,
        4,
        9,
        NULL
    ),
    (
        'Ressort de musculation',
        'Bon état',
        1.50,
        'En rayon',
        6.00,
        NULL,
        5,
        10,
        NULL
    ),
    (
        'Livre de recettes',
        'Bon état',
        0.80,
        'En rayon',
        4.00,
        NULL,
        6,
        4,
        NULL
    ),
    (
        'Vase en céramique',
        'Bon état',
        1.30,
        'En rayon',
        9.00,
        NULL,
        7,
        8,
        NULL
    ),
    (
        'Étagère métallique',
        'Bon état',
        11.00,
        'En rayon',
        20.00,
        NULL,
        8,
        1,
        NULL
    ),
    (
        'Jean Levis',
        'Bon état',
        0.60,
        'En rayon',
        16.00,
        NULL,
        1,
        3,
        NULL
    ),
    (
        'Aspirateur sans sac',
        'À réparer',
        5.00,
        'En réparation',
        15.00,
        NULL,
        1,
        2,
        NULL
    ),
    (
        'Grille-pain inox',
        'À réparer',
        1.40,
        'En réparation',
        8.00,
        NULL,
        1,
        2,
        NULL
    ),
    (
        'Chaise pliante bois',
        'À réparer',
        3.00,
        'En réparation',
        5.00,
        NULL,
        2,
        1,
        NULL
    ),
    (
        'Vélo enfant',
        'À réparer',
        8.50,
        'En réparation',
        18.00,
        NULL,
        3,
        10,
        NULL
    ),
    (
        'Machine à coudre',
        'À réparer',
        7.00,
        'En réparation',
        30.00,
        NULL,
        1,
        2,
        NULL
    ),
    (
        'Paire d''enceintes',
        'À réparer',
        4.50,
        'En réparation',
        25.00,
        NULL,
        2,
        2,
        NULL
    ),
    (
        'Horloge comtoise',
        'À réparer',
        25.00,
        'En réparation',
        60.00,
        NULL,
        3,
        8,
        NULL
    ),
    (
        'Tondeuse électrique',
        'À réparer',
        12.00,
        'En réparation',
        35.00,
        NULL,
        4,
        7,
        NULL
    ),
    (
        'Imprimante HP',
        'À réparer',
        6.00,
        'En réparation',
        12.00,
        NULL,
        5,
        9,
        NULL
    ),
    (
        'Sèche-cheveux',
        'À réparer',
        0.70,
        'En réparation',
        6.00,
        NULL,
        6,
        2,
        NULL
    ),
    (
        'Lot de t-shirts',
        'Bon état',
        1.20,
        'Arrivé',
        10.00,
        NULL,
        1,
        3,
        NULL
    ),
    (
        'Cafetière filtre',
        'À réparer',
        1.80,
        'Arrivé',
        5.00,
        NULL,
        2,
        2,
        NULL
    ),
    (
        'Sécateur jardin',
        'Bon état',
        0.50,
        'Arrivé',
        7.00,
        NULL,
        3,
        7,
        NULL
    ),
    (
        'BD Asterix',
        'Bon état',
        0.40,
        'Arrivé',
        3.00,
        NULL,
        1,
        4,
        NULL
    ),
    (
        'Lecteur DVD HS',
        'Hors service',
        2.00,
        'Recyclé',
        0.00,
        NULL,
        2,
        2,
        NULL
    ),
    (
        'Sèche-cheveux brûlé',
        'Hors service',
        0.60,
        'Recyclé',
        0.00,
        NULL,
        3,
        2,
        NULL
    ),
    (
        'Meuble cassé',
        'Hors service',
        18.00,
        'Recyclé',
        0.00,
        NULL,
        1,
        1,
        NULL
    );

-- ============================================================================
-- NIVEAU 3 : Réparations et Inscriptions
-- ============================================================================

-- Réparations
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
    ),
    (
        '2026-07-15 10:00:00',
        '45 mins',
        TRUE,
        3,
        3
    ),
    (
        '2026-07-18 11:30:00',
        '1 hour',
        TRUE,
        1,
        4
    ),
    (
        '2026-07-20 15:00:00',
        '3 hours',
        FALSE,
        2,
        18
    ),
    (
        '2026-07-22 09:30:00',
        '2 hours 30 mins',
        TRUE,
        4,
        34
    ),
    (
        '2026-07-25 14:00:00',
        '1 hour 15 mins',
        TRUE,
        5,
        35
    ),
    (
        '2026-07-28 10:45:00',
        '2 hours',
        FALSE,
        1,
        36
    ),
    (
        '2026-08-01 16:00:00',
        '1 hour 45 mins',
        TRUE,
        2,
        37
    ),
    (
        '2026-08-03 09:00:00',
        '3 hours 15 mins',
        FALSE,
        3,
        38
    ),
    (
        '2026-08-05 11:00:00',
        '2 hours',
        TRUE,
        4,
        39
    ),
    (
        '2026-08-08 14:30:00',
        '50 mins',
        TRUE,
        5,
        40
    ),
    (
        '2026-08-10 10:00:00',
        '1 hour 20 mins',
        FALSE,
        6,
        41
    ),
    (
        '2026-08-12 15:15:00',
        '2 hours 45 mins',
        TRUE,
        7,
        42
    ),
    (
        '2026-08-13 09:00:00',
        '1 hour 10 mins',
        TRUE,
        8,
        43
    ),
    (
        '2026-08-14 11:00:00',
        '2 hours',
        FALSE,
        1,
        45
    ),
    (
        '2026-08-15 14:00:00',
        '1 hour 30 mins',
        TRUE,
        2,
        48
    ),
    (
        '2026-08-16 10:00:00',
        '3 hours',
        FALSE,
        3,
        49
    );

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
        1,
        '2026-08-22 14:00:00',
        TRUE
    ),
    (
        4,
        2,
        '2026-08-23 09:00:00',
        TRUE
    ),
    (
        5,
        2,
        '2026-08-24 15:15:00',
        TRUE
    ),
    (
        6,
        3,
        '2026-08-25 10:30:00',
        FALSE
    ),
    (
        7,
        3,
        '2026-08-25 11:00:00',
        TRUE
    ),
    (
        8,
        4,
        '2026-08-26 14:00:00',
        TRUE
    ),
    (
        9,
        4,
        '2026-08-26 16:20:00',
        TRUE
    ),
    (
        10,
        4,
        '2026-08-27 09:10:00',
        FALSE
    ),
    (
        11,
        5,
        '2026-08-27 11:40:00',
        TRUE
    ),
    (
        12,
        5,
        '2026-08-28 10:00:00',
        TRUE
    );