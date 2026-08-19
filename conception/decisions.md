Distinction entre Personne et Bénévole pour que les Bénévoles puissent être à la fois client (personne qui dépose, achète ou répare un objet)
sans pour autant avoir des doublons de Noms, Prénoms, Coordonées dans les tables Personnes ET Bénévoles. 

Pas de distinction entre le client, le client adhérant et le bénéveole. Juste un booléen pour l'adhérent et le une cléf étrangère pour le bénévole. 

Pour durées (les réparations et les ateliers), on a décidé d'utiliser le TYPE INTERVAL pour que la data soit directement en heure, cela évite les converstions. 

Création d'une table CompetenceBenevelove à part certains bénévoles peuvent avoir plusieurs compétences. 