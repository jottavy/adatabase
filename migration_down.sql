-- ============================================================================
-- 1. SUPPRESSION DES TABLES (Ordre inverse des dépendances)
-- ============================================================================

-------------------------------------------------------------------------------
-- NIVEAU 3 : Tables de liaison complexes et interventions
-------------------------------------------------------------------------------
DROP TABLE IF EXISTS InscriptionAtelier CASCADE;

DROP TABLE IF EXISTS Reparation CASCADE;

-------------------------------------------------------------------------------
-- NIVEAU 2 : Tables dépendantes des Niveaux 0 et 1
-------------------------------------------------------------------------------
DROP TABLE IF EXISTS CompetenceBenevole CASCADE;

DROP TABLE IF EXISTS Objet CASCADE;

DROP TABLE IF EXISTS Atelier CASCADE;

-------------------------------------------------------------------------------
-- NIVEAU 1 : Tables dépendantes du Niveau 0
-------------------------------------------------------------------------------
DROP TABLE IF EXISTS Depot CASCADE;

DROP TABLE IF EXISTS Benevole CASCADE;

-------------------------------------------------------------------------------
-- NIVEAU 0 : Tables indépendantes
-------------------------------------------------------------------------------
DROP TABLE IF EXISTS Personne CASCADE;

DROP TABLE IF EXISTS Vente CASCADE;

DROP TABLE IF EXISTS Competence CASCADE;

DROP TABLE IF EXISTS Categorie CASCADE;

-- ============================================================================
-- 2. SUPPRESSION DES ÉNUMÉRATIONS (Types personnalisés)
-- ============================================================================

DROP TYPE IF EXISTS mode_paiement_enum CASCADE;

DROP TYPE IF EXISTS objet_etat_enum CASCADE;

DROP TYPE IF EXISTS statut_objet_enum CASCADE;

DROP TYPE IF EXISTS type_depot_enum CASCADE;