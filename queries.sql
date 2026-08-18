-- 1. Combien d'objets avons-nous reçus le mois dernier, et quel poids total ?
SELECT
    COUNT(*) AS "Nombre d'objets",
    SUM(poids) AS "Poids total"
FROM Objet
WHERE
    objet_date_rayon >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month'
    AND objet_date_rayon < DATE_TRUNC('month', CURRENT_DATE);