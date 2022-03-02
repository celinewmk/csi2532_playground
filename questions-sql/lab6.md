Réponses aux questions

1. Lister les name et birthplace de tous les artists

SELECT name, birthplace 
FROM artists;

2. Lister le title et le price de toutes les artworks après 1600.

SELECT title, price
FROM artworks
WHERE year > 1600;

3. Lister le title et le type de toutes les artworks qui ont été peintes en
2000 ou peintes par Picasso.

SELECT title, type 
FROM artworks 
WHERE year=2000 or artist_name='Picasso';

4. Lister les name et birthplace de tous les artists nés entre 1880 et 1930.

SELECT name, birthplace 
FROM artists 
WHERE (SELECT EXTRACT(year FROM dateofbirth))>=1880 AND (SELECT EXTRACT(year FROM dateofbirth))<=1930;

5. Lister les name et le country de naissance de tous les artists dont le style de peinture est Modern, Baroque or Renaissance.

SELECT name, country
FROM artists
WHERE style IN ('Modern','Baroque','Renaissance');

6. Lister tous les détails des artworks dans la base de données, triés par title.

SELECT * FROM artworks 
ORDER BY title;

7. Lister les name et les customer ids de tous les customers qui aiment Picasso.

SELECT C.name, C.id 
FROM customers as C, likeartists as L 
WHERE C.id=L.customer_id AND L.artist_name='Picasso';

8. Lister les name de tous les customers qui aiment les artistes de style Renaissance et dont le price est supérieur à 30000.

select C.name
from customers as C, likeartists as L, artworks as A
WHERE C.id=L.customer_id AND L.artist_name=A.artist_name AND A.type='Renaissance' AND A.price > 30000;