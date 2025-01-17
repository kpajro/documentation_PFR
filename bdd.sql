CREATE TABLE Utilisateur (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255)
);

CREATE TABLE Adresse (
    id INTEGER PRIMARY KEY,
    rue VARCHAR(200),
    ville VARCHAR(100),
    code_postal VARCHAR(20),
    id_utilisateur INTEGER,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id)
);

CREATE TABLE Categorie (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100)
);

CREATE TABLE Produit (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100),
    description VARCHAR(255),
    prix FLOAT,
    id_categorie INTEGER,
    FOREIGN KEY (id_categorie) REFERENCES Categorie(id)
);

CREATE TABLE Panier (
    id INTEGER PRIMARY KEY,
    date DATE,
    id_utilisateur INTEGER,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id)
);

CREATE TABLE Panier_produit (
    id INTEGER PRIMARY KEY,
    quantite INTEGER,
    id_panier INTEGER,
    id_produit INTEGER,
    FOREIGN KEY (id_panier) REFERENCES Panier(id),
    FOREIGN KEY (id_produit) REFERENCES Produit(id)
);

CREATE TABLE Commande (
    id INTEGER PRIMARY KEY,
    date DATE,
    id_utilisateur INTEGER,
    id_adresse INTEGER,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id),
    FOREIGN KEY (id_adresse) REFERENCES Adresse(id)
);

CREATE TABLE Commande_produit (
    id INTEGER PRIMARY KEY,
    quantite INTEGER,
    prix FLOAT,
    id_commande INTEGER,
    id_produit INTEGER,
    FOREIGN KEY (id_commande) REFERENCES Commande(id),
    FOREIGN KEY (id_produit) REFERENCES Produit(id)
);

CREATE TABLE Paiement (
    id INTEGER PRIMARY KEY,
    date DATE,
    montant DECIMAL,
    id_commande INTEGER,
    type_paiement ENUM('carte', 'cheque', 'virement'),
    FOREIGN KEY (id_commande) REFERENCES Commande(id)
);