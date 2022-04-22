-- Ajout de la colonne rating à customers
ALTER TABLE customers
ADD rating integer
CHECK(rating between 1 and 10);