| Nom                       | Description                          | Type                                |
| ------------------------- | ------------------------------------ | ----------------------------------- |
| depot_type                | Type de dépôt                        | ENUM NOT NULL                       |
| depot_date                | Date du dépôt                        | DATE NOT NULL DEFAULT CURRENT_TIME  |
| personne_nom              | Nom de la personne                   | VARCHAR NOT NULL                    |
| personne_prenom           | Prénom de la personne                | VARCHAR                             |
| personne_telephone        | N° téléphone de la personne          | VARCHAR                             |
| personne_adherent         | Indique si la personne est adhérente | BOOLEAN                             |
| objet_nom                 | Nom de l'objet / libellé             | VARCHAR                             |
| objet_etat                | État de l'objet                      | ENUM                                |
| objet_poids               | Poids de l'objet                     | NUMERIC                             |
| objet_statut              | Statut de l'objet                    | ENUM                                |
| objet_prix                | Prix de l'objet en rayon             | NUMERIC                             |
| objet_date_rayon          | Date de mise en rayon                | DATE                                |
| reparation_date_debut     | Date de début de la réparation       | DATE                                |
| reparation_duree          | Durée de la réparation               | INTERVAL                            |
| reparation_statut         | Statut de la réparation              | BOOLEAN                             |
| vente_date                | Date de la vente                     | DATE                                |
| vente_mode_paiement       | Mode de paiement de la vente         | ENUM                                |
| vente_prix_final           | Prix final de la vente                | NUMERIC                             |
| benevole_date_inscription | Date d'inscription du bénévole       | DATE                                |
| atelier_nom               | Nom de l'atelier                     | VARCHAR                             |
| atelier_date              | Date de l'atelier                    | DATE                                |
| atelier_duree             | Durée de l'atelier                   | INTERVAL                            |
| atelier_nombre_place      | Nombre de places de l'atelier        | INTEGER                             |
| competence_nom            | Compétence maîtrisée par le bénévole | VARCHAR                             |
| categorie_nom             | Nom de la catégorie                  | ENUM                                |
| date_inscription          | Date d'inscription à l'atelier       | TIMESTAMP DEFAULT CURRENT_TIMESTAMP |
| presence                  | Présence à l'atelier                 | BOOLEAN                             |
