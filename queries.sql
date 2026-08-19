-- 1. Combien d'objets avons-nous reçus le mois dernier, et quel poids total ?
SELECT
    COUNT(*) AS "Nombre d'objets",
    SUM(objet_poids) AS "Poids total"
FROM Objet
    JOIN Depot ON Objet.depot_id = Depot.depot_id
WHERE
    Depot.depot_date >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month'
    AND Depot.depot_date < DATE_TRUNC('month', CURRENT_DATE);

-- 2. Quels objets sont actuellement en rayon, et depuis combien de temps ?
SELECT
    objet_nom,
    objet_etat,
    objet_statut,
    objet_prix,
    DATE_PART(
        'day',
        CURRENT_DATE - objet_date_rayon
    ) AS "Depuis (nombre de jour)"
FROM Objet
WHERE
    objet_statut = 'En rayon';

-- 3. Quelle catégorie se vend le mieux ? Laquelle rapporte le plus ?
SELECT
    Categorie.categorie_nom,
    COUNT(Objet.objet_id) AS "Nombre d'objets vendus",
    SUM(Objet.vente_prix_final) AS "Revenu total"
FROM Objet
    JOIN Categorie ON Objet.categorie_id = Categorie.categorie_id
WHERE
    Objet.objet_statut = 'Vendu'
GROUP BY
    Categorie.categorie_nom
ORDER BY "Nombre d'objets vendus" DESC
LIMIT 1;

-- 4. Combien d'heures de bénévolat ont été consacrées à la réparation cette année ?
SELECT
    SUM(reparation_duree) AS "Nombre d'heures consacrées à la réparation cette année"
FROM Reparation
    -- Résultat avec résultat data exploitable
    -- SELECT
    --     ROUND(EXTRACT(EPOCH FROM SUM(reparation_duree)) / 3600) AS "Nombre d'heures"
    -- FROM Reparation
    -- WHERE reparation_date_debut >= DATE_TRUNC('year', CURRENT_DATE);

-- 5. Quel est le taux de réussite des réparations, par bénévole et globalement ?
-- Globalement
SELECT
    COUNT(*) FILTER (
        WHERE
            reparation_statut = true
    ) * 100 / COUNT(*) AS "Taux global de réussite des réparations (en %)"
FROM Reparation

-- Par bénévole
SELECT
    Benevole.benevole_id,
    Personne.personne_nom,
    Personne.personne_prenom,
    COUNT(*) FILTER (
        WHERE
            reparation_statut = true
    ) * 100 / COUNT(*) AS "Taux de réussite des réparations par bénévole (en %)"
FROM
    Personne
    JOIN Benevole ON Personne.personne_id = Benevole.personne_id
    JOIN Reparation ON Benevole.benevole_id = Reparation.benevole_id
GROUP BY
    Benevole.benevole_id,
    Personne.personne_nom,
    Personne.personne_prenom

-- 6. Quelles personnes nous ont fait plus de trois dépôts ?
SELECT Personne.personne_id, Personne.personne_nom, Personne.personne_prenom
FROM Personne
    JOIN Depot ON Personne.personne_id = Depot.personne_id
GROUP BY
    Personne.personne_id
HAVING
    COUNT(*) > 3

-- 7. Quel poids total avons-nous détourné de la déchetterie (tout ce qui n'est pas recyclé) ?
SELECT
    SUM(Objet.objet_poids) AS "Poids total de ce qui n'a pas été recyclé (en kg)"
FROM objet
WHERE
    objet_statut != 'Recyclé'

-- 8. Quel est le taux de présence réelle sur nos ateliers ?
SELECT Atelier.atelier_nom,
    COUNT(*) FILTER (
        WHERE
            InscriptionAtelier.presence = true) * 100 / COUNT(*) AS "Taux de présence (en %)"
FROM Atelier
    JOIN InscriptionAtelier ON Atelier.atelier_id = InscriptionAtelier.atelier_id
GROUP BY Atelier.atelier_id, Atelier.atelier_nom

-- 9. Quels bénévoles ont la compétence « électricité » et sont disponibles pour animer un atelier ?
SELECT Benevole.benevole_id, Personne.personne_nom, Personne.personne_prenom, Competence.competence_nom
FROM Benevole
    JOIN Personne ON Personne.personne_id = Benevole.benevole_id
    JOIN CompetenceBenevole ON CompetenceBenevole.benevole_id = Benevole.benevole_id