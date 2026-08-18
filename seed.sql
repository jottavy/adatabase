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
INSERT INTO Categorie (categorie_nom) VALUES 
('Meubles'),
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
INSERT INTO Competence (competence_nom) VALUES 
('Électricité'),
('Menuiserie'),
('Couture'),
('Informatique'),
('Mécanique vélo'),
('Plomberie');

-- Personnes
INSERT INTO Personne (personne_nom, personne_prenom, personne_telephone, personne_adherent) VALUES 
('Dupont', 'Jean', '0601020304', TRUE),       -- Personne 1 : >3 dépôts
('Martin', 'Sophie', '0611223344', TRUE),      -- Personne 2
('Bernard', 'Lucas', '0622334455', TRUE),     -- Personne 3
('Petit', 'Marie', '0633445566', FALSE),      -- Personne 4
('Moreau', 'Pierre', '0644556677', TRUE),     -- Personne 5
('Lefebvre', 'Julie', '0655667788', TRUE),    -- Personne 6
('Garcia', 'Thomas', '0666778899', FALSE),    -- Personne 7
('Roux', 'Camille', '0677889900', TRUE),      -- Personne 8
('Fournier', 'Antoine', '0688990011', TRUE),  -- Personne 9
('Girard', 'Emma', '0699001122', FALSE),      -- Personne 10
('Bonnet', 'Nicolas', '0701020304', TRUE),    -- Personne 11
('Lambert', 'Clara', '0711223344', TRUE),     -- Personne 12
('Fontaine', 'Julien', '0722334455', TRUE),   -- Personne 13
('Rousseau', 'Manon', '0733445566', FALSE),   -- Personne 14
('Vincent', 'Hugo', '0744556677', TRUE);      -- Personne 15

-- Ventes
INSERT INTO Vente (vente_date, vente_mode_paiement) VALUES 
('2026-08-01 10:15:00', 'Espèces'),
('2026-08-02 11:30:00', 'Carte'),
('2026-08-03 14:20:00', 'Carte'),
('2026-08-04 16:45:00', 'Chèque'),
('2026-08-05 09:10:00', 'Espèces'),
('2026-08-06 15:00:00', 'Carte'),
('2026-08-07 10:50:00', 'Espèces'),
('2026-08-08 17:15:00', 'Carte'),
('2026-08-09 12:00:00', 'Carte'),
('2026-08-10 14:30:00', 'Espèces'),
('2026-08-12 11:00:00', 'Carte'),
('2026-08-14 16:20:00', 'Espèces');

-- ============================================================================
-- NIVEAU 1 : Bénévoles et Dépôts
-- ============================================================================

-- Bénévoles
INSERT INTO Benevole (personne_id, benevole_date_inscription) VALUES 
(1, '2026-01-10 09:00:00'),
(2, '2026-01-12 10:00:00'),
(3, '2026-01-15 14:00:00'),
(4, '2026-01-20 11:00:00'),
(5, '2026-02-01 11:00:00'),
(6, '2026-02-05 09:30:00'),
(7, '2026-02-08 14:00:00'),
(8, '2026-02-10 15:00:00');

-- Dépôts
-- Note : Jean Dupont (personne_id = 1) a effectué 4 dépôts distincts
INSERT INTO Depot (depot_type, depot_date, personne_id) VALUES 
('Boutique', '2026-01-10 10:00:00', 1), -- Dépôt ancien (> 6 mois)
('Boutique', '2026-07-01 10:00:00', 1), -- Dépôt du mois dernier (Juillet)
('Domicile', '2026-07-02 14:00:00', 2),
('Boutique', '2026-07-05 11:15:00', 3),
('Boutique', '2026-07-10 09:30:00', 4),
('Domicile', '2026-07-12 16:00:00', 7),
('Boutique', '2026-07-15 10:45:00', 10),
('Boutique', '2026-07-20 14:15:00', 12),
('Domicile', '2026-07-25 11:00:00', 14),
('Boutique', '2026-08-01 09:00:00', 1), -- 3e dépôt Dupont
('Boutique', '2026-08-05 14:00:00', 1); -- 4e dépôt Dupont

-- ============================================================================
-- NIVEAU 2 : Ateliers, Compétences Bénévoles, Objets
-- ============================================================================

-- Ateliers
INSERT INTO Atelier (atelier_nom, atelier_date, atelier_duree, atelier_nombre_place, benevole_id) VALUES 
('Initiation Couture', '2026-09-01 14:00:00', '2 hours', 8, 1),
('Réparation Électro', '2026-09-05 10:00:00', '3 hours', 5, 2),
('Atelier Menuiserie', '2026-09-10 14:00:00', '4 hours', 6, 3),
('Recyclage Informatique', '2026-09-15 09:00:00', '2 hours', 10, 4),
('Entretien Vélo', '2026-09-20 10:00:00', '3 hours', 8, 5);

-- CompétenceBenevole
-- Compétence 1 = Électricité (attribuée aux bénévoles 1 et 6)
INSERT INTO CompetenceBenevole (competence_id, benevole_id) VALUES 
(1, 1),
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
INSERT INTO Objet (
    objet_nom, objet_etat, objet_poids, objet_statut, objet_prix, vente_prix_final, depot_id, categorie_id, vente_id
) VALUES
('Chaise en chêne', 'Bon état', 5.50, 'Vendu', 25.00, 20.00, 2, 1, 1),
('Grille-pain Vintage', 'À réparer', 1.20, 'Vendu', 10.00, 10.00, 2, 2, 2),
('Veste en cuir', 'Bon état', 1.80, 'Vendu', 30.00, 30.00, 3, 3, 3),
('Micro-ondes', 'Bon état', 12.00, 'Vendu', 35.00, 30.00, 2, 2, 4),
('Lot de 5 assiettes', 'Bon état', 2.50, 'Vendu', 8.00, 8.00, 3, 6, 5),
('VTT Homme', 'À réparer', 14.00, 'Vendu', 45.00, 40.00, 4, 10, 6),
('Manteau d''hiver', 'Bon état', 2.00, 'Vendu', 20.00, 20.00, 2, 3, 7),
('Encyclopédie 10 vol', 'Bon état', 8.50, 'Vendu', 15.00, 12.00, 3, 4, 8),
('Jeu de construction', 'Bon état', 1.10, 'Vendu', 12.00, 10.00, 4, 5, 9),
('Miroir doré', 'Bon état', 4.00, 'Vendu', 25.00, 25.00, 2, 8, 10),
('Écran PC 24 pouces', 'Bon état', 3.80, 'Vendu', 40.00, 35.00, 5, 9, 11),
('Chaise de bureau', 'Bon état', 7.00, 'Vendu', 18.00, 15.00, 6, 1, 12),
('Armoire ancienne', 'Bon état', 45.00, 'En rayon', 120.00, NULL, 1, 1, NULL),
('Secrétaire en teck', 'Bon état', 28.00, 'En rayon', 90.00, NULL, 1, 1, NULL),
('Table basse verre', 'Bon état', 15.00, 'En rayon', 40.00, NULL, 3, 1, NULL),
('Roman SF Lot', 'Bon état', 0.90, 'En rayon', 5.00, NULL, 4, 4, NULL),
('Machine à café', 'Bon état', 3.20, 'En rayon', 18.00, NULL, 2, 2, NULL),
('Canapé 2 places', 'Bon état', 35.00, 'En rayon', 80.00, NULL, 3, 1, NULL),
('BD Tintin T1', 'Bon état', 0.40, 'En rayon', 4.00, NULL, 4, 4, NULL),
('Perceuse filaire', 'À réparer', 2.30, 'En rayon', 15.00, NULL, 2, 7, NULL),
('Lampe de chevet', 'Bon état', 1.10, 'En rayon', 10.00, NULL, 3, 8, NULL),
('Robot pâtissier', 'Bon état', 6.50, 'En rayon', 50.00, NULL, 4, 2, NULL),
('Jeu Monopoly', 'Bon état', 1.00, 'En rayon', 8.00, NULL, 2, 5, NULL),
('Trieur en bois', 'Bon état', 2.00, 'En rayon', 12.00, NULL, 3, 1, NULL),
('Aspirateur sans sac', 'À réparer', 5.00, 'En réparation', 15.00, NULL, 2, 2, NULL),
('Grille-pain inox', 'À réparer', 1.40, 'En réparation', 8.00, NULL, 2, 2, NULL),
('Sèche-cheveux brûlé', 'Hors service', 0.60, 'Recyclé', 0.00, NULL, 4, 2, NULL),
('Meuble cassé', 'Hors service', 18.00, 'Recyclé', 0.00, NULL, 2, 1, NULL);

-- ============================================================================
-- NIVEAU 3 : Réparations et Inscriptions
-- ============================================================================

-- Réparations (exemples sur l'année 2026)
INSERT INTO Reparation (reparation_date_debut, reparation_duree, reparation_statut, benevole_id, objet_id) VALUES 
('2026-07-10 09:00:00', '1 hour 30 mins', TRUE, 1, 2),
('2026-07-12 14:00:00', '2 hours', FALSE, 2, 6),
('2026-07-15 10:00:00', '45 mins', TRUE, 3, 3),
('2026-07-18 11:30:00', '1 hour', TRUE, 1, 4),
('2026-07-20 15:00:00', '3 hours', FALSE, 2, 20),
('2026-08-01 16:00:00', '1 hour 45 mins', TRUE, 2, 25),
('2026-08-05 11:00:00', '2 hours', TRUE, 4, 26);

-- Inscriptions aux ateliers
INSERT INTO InscriptionAtelier (personne_id, atelier_id, date_inscription, presence) VALUES 
(1, 1, '2026-08-20 10:00:00', TRUE),
(2, 1, '2026-08-21 11:30:00', FALSE),
(3, 1, '2026-08-22 14:00:00', TRUE),
(4, 2, '2026-08-23 09:00:00', TRUE),
(5, 2, '2026-08-24 15:15:00', TRUE),
(6, 3, '2026-08-25 10:30:00', FALSE),
(7, 3, '2026-08-25 11:00:00', TRUE),
(8, 4, '2026-08-26 14:00:00', TRUE),
(9, 4, '2026-08-26 16:20:00', TRUE),
(10, 4, '2026-08-27 09:10:00', FALSE),
(11, 5, '2026-08-27 11:40:00', TRUE),
(12, 5, '2026-08-28 10:00:00', TRUE);