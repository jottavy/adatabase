depot_type	Type de dépot ENUM	NOT NULL
depot_date	Date du dépot	DATE NOT NULL, DEFAULT CURRENT_TIMESTAMP
personne_nom	Nom de la personne VARCHAR	NOT NULL
personne_prenom	Prénom de la personne	VARCHAR
personne_telephone N° téléphone du personne	VARCHAR
personne_adherent	Info s'il est adhérent BOOLEAN
objet_nom	Nom de l'objet / libéllé	VARCHAR
objet_etat	État de l'objet	ENUM
objet_poids	Poids de l'objet	NUMERIC
objet_statut Statut de l'objet (avant réparation)	ENUM
objet_prix	Prix de l'objet en rayon NUMERIC
objet_date_rayon Date de mise en rayon DATE
reparation_date_debut	La date début de la réparation	DATE
reparation_duree	Durée de la réparation	INTERVAL
reparation_statut	Statut de la réparation	BOOLEAN 
vente_date	Date de la vente	DATE
vente_mode_paiement	Mode de paiement de la vente	ENUM
vente_prix_final	Prix finale de la vente	NUMERIC
benevole_date_inscription	Date d'inscription du bénévole	DATE
atelier_nom	Nom de l'atelier	VARCHAR
atelier_date	Date de l'atelier	DATE
atelier_durée	Durée (h) de l'atelier INTERVAL 
atelier_nombre_place	Nombre de place de l'atelier INTEGER
competence_nom	Compétence maîtrisée par bénévole	VARCHAR
categorie_nom Nom de la catégorie ENUM
date_inscription À l'atelier DEFAULT CURRENT_TIMESTAMP
presence À l'atelier BOOLEAN