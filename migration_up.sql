-- 1. ÉNUMÉRATIONS (ENUM)
CREATE TYPE type_depot_enum AS ENUM ('Boutique', 'Domicile');

CREATE TYPE statut_objet_enum AS ENUM ('Arrivé', 'En réparation', 'En rayon', 'Vendu', 'Recyclé');

CREATE TYPE objet_etat_enum AS ENUM ('Bon état', 'À réparer', 'Hors service');

CREATE TYPE mode_paiement_enum AS ENUM ('Espèces', 'Carte', 'Chèque');

-- 2. CREATE TABLE (Du Niveau 0 au Niveau 3)
-- Niveau 0

CREATE TABLE Categorie (
    categorie_id SERIAL PRIMARY KEY,
    categorie_nom VARCHAR(100) NOT NULL
);

CREATE TABLE Competence (
    competence_id SERIAL PRIMARY KEY,
    competence_nom VARCHAR(100) NOT NULL
);

CREATE TABLE Vente (
    vente_id SERIAL PRIMARY KEY,
    vente_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    vente_mode_paiement mode_paiement_enum NOT NULL
);

CREATE TABLE Personne (
    personne_id SERIAL PRIMARY KEY,
    personne_nom VARCHAR(100) NOT NULL,
    personne_prenom VARCHAR(100) NOT NULL,
    personne_telephone VARCHAR(15) NOT NULL,
    personne_adherent BOOLEAN NOT NULL DEFAULT FALSE
);

-- Niveau 2

CREATE TABLE Benevole (
    benevole_id SERIAL PRIMARY KEY,
    benevole_date_inscription TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    personne_id INTEGER NOT NULL UNIQUE REFERENCES Personne (personne_id)
);

CREATE TABLE Depot (
    depot_id SERIAL PRIMARY KEY,
    depot_type type_depot_enum NOT NULL,
    depot_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    personne_id INTEGER NOT NULL REFERENCES Personne (personne_id)
);

CREATE TABLE Atelier (
    atelier_id SERIAL PRIMARY KEY,
    atelier_nom VARCHAR(100) NOT NULL,
    atelier_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atelier_duree INTERVAL NOT NULL,
    atelier_nombre_place INTEGER NOT NULL,
    benevole_id INTEGER NOT NULL REFERENCES Benevole (benevole_id)
);

CREATE TABLE Objet (
    objet_id SERIAL PRIMARY KEY,
    objet_nom VARCHAR(100) NOT NULL,
    objet_etat objet_etat_enum NOT NULL,
    objet_poids NUMERIC(10, 2) NOT NULL,
    objet_statut statut_objet_enum NOT NULL,
    objet_prix NUMERIC(10, 2) NOT NULL,
    objet_date_rayon TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    vente_prix_final NUMERIC(10, 2),
    depot_id INTEGER NOT NULL REFERENCES Depot (depot_id),
    categorie_id INTEGER NOT NULL REFERENCES Categorie (categorie_id),
    vente_id INTEGER REFERENCES Vente (vente_id)
);

CREATE TABLE Reparation (
    reparation_id SERIAL PRIMARY KEY,
    reparation_date_debut TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reparation_duree INTERVAL NOT NULL,
    reparation_statut BOOLEAN NOT NULL DEFAULT FALSE,
    benevole_id INTEGER NOT NULL REFERENCES Benevole (benevole_id),
    objet_id INTEGER NOT NULL REFERENCES Objet (objet_id)
);

-- Niveau 3

CREATE TABLE CompetenceBenevole (
    competence_id INTEGER NOT NULL REFERENCES Competence (competence_id),
    benevole_id INTEGER NOT NULL REFERENCES Benevole (benevole_id),
    PRIMARY KEY (competence_id, benevole_id)
);

CREATE TABLE InscriptionAtelier (
    date_inscription TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    presence BOOLEAN NOT NULL DEFAULT FALSE,
    atelier_id INTEGER NOT NULL REFERENCES Atelier (atelier_id),
    personne_id INTEGER NOT NULL REFERENCES Personne (personne_id),
    PRIMARY KEY (atelier_id, personne_id)
);