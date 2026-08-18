-- 1. SUPPRESSION DES TABLES (Du Niveau 3 au Niveau 0)

-- Niveau 3 (Tables d'association / dépendantes)
DROP TABLE IF EXISTS InscriptionAtelier;

DROP TABLE IF EXISTS CompetenceBenevole;

-- Niveau 2 (Tables dépendant du Niveau 1 ou 2)
DROP TABLE IF EXISTS Reparation;

DROP TABLE IF EXISTS Objet;

DROP TABLE IF EXISTS Atelier;

-- Niveau 1 (Tables dépendant du Niveau 0)
DROP TABLE IF EXISTS Depot;

DROP TABLE IF EXISTS Benevole;

-- Niveau 0 (Tables de base)
DROP TABLE IF EXISTS Personne;

DROP TABLE IF EXISTS Vente;

DROP TABLE IF EXISTS Competence;

DROP TABLE IF EXISTS Categorie;

-- 2. SUPPRESSION DES ÉNUMÉRATIONS (ENUM)

DROP TYPE IF EXISTS mode_paiement_enum;

DROP TYPE IF EXISTS objet_etat_enum;

DROP TYPE IF EXISTS statut_objet_enum;

DROP TYPE IF EXISTS type_depot_enum;