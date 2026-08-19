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
    ) AS "Jours en rayon"
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
GROUP BY Categorie.categorie_nom
ORDER BY "Nombre d'objets vendus" DESC
LIMIT 1;

-- 4. Combien d'heures de bénévolat ont été consacrées à la réparation cette année ?
