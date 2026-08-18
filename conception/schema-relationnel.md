Categorie(categorie_id, categorie_nom) - R1
Competence(competence_id, competence_nom) - R1
Vente(vente_id, vente_date, vente_mode_paiement) - R1
Personne(personne_id, personne_nom, personne_prenom, personne_telephone, personne_adherent) - R1
Depot(depot_id, depot_type, depot_date, #personne_id) - R2
Benevole(benevole_id, benevole_date_inscription #personne_id) - R2
Objet(objet_id, objet_nom, objet_etat, objet_poids, objet_statut, objet_prix, objet_date_rayon, vente_prix_final, #depot_id, #categorie_id, #vente_id) - R2
Reparation(reparation_id, reparation_date_debut, reparation_duree, reparation_statut, #benevole_id, #objet_id) - R2
Atelier(atelier_id, atelier_nom, atelier_date, atelier_duree, atelier_nombre_place, #benevole_id) - R2
InscriptionAtelier(#personne_id, #atelier_id, date_inscription, presence) - R3
CompetenceBenevole(#benevole_id, #competence_id) - R3