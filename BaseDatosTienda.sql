-- 1 Llista el nom de tots els productos que hi ha en la taula producto.
SELECT nombre 
FROM producto;

-- 2 Llista els noms i els preus de tots els productos de la taula producto.
SELECT nombre,precio 
FROM producto;

-- 3 Llista totes les columnes de la taula producto.
 SELECT * 
 FROM producto; 

-- 4 Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans (USD).
SELECT nombre, (precio/22.09), (precio/19.54) 
FROM producto;
!!!!!!!!!!!!!
-- 5 Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars nord-americans.
SELECT nombre AS nom_de_producto, (precio*0.89) AS EURO, (precio/19.54) AS USD 
FROM producto;

-- 6 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
SELECT UPPER (nombre), precio 
FROM producto;

-- 7 Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
SELECT LOWER (nombre), precio 
FROM producto;

-- 8 Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre,RIGHT (UPPER (nombre), 2)
FROM fabricante;

-- 9  Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
SELECT nombre, ROUND(precio) 
FROM producto; 

-- 10 Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, ROUND(precio, 0)AS 'preu €' , ROUND((precio * 1.13)  , 0)AS 'preu USD'
FROM producto; 

!!!!!!!!!!!!!!!!
-- 11 Llista el codi dels fabricants que tenen productos en la taula producto.
SELECT codigo_fabricante 
FROM producto;
-- 12 Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante 
FROM producto;
-- 13 Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre
FROM fabricante
ORDER BY nombre ASC;
-- 14 Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre 
FROM fabricante 
ORDER BY nombre DESC;
-- 15 Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.

SELECT nombre, precio 
FROM producto 
ORDER BY nombre ASC , precio DESC;

-- 16 Retorna una llista amb les 5 primeres files de la taula fabricante.
SELECT nombre
FROM producto 
LIMIT 5;
-- 17 Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * 
FROM fabricante 
LIMIT 2 
OFFSET 3; 
-- 18 Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
 SELECT nombre , precio AS Precio_euro
 FROM producto 
 ORDER BY precio ASC 
 LIMIT 1;
 
 -- 19 Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
 SELECT nombre , precio AS Precio_euro
 FROM producto 
 ORDER BY precio DESC
 LIMIT 1;
-- 20 Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
SELECT codigo_fabricante , nombre 
FROM producto
WHERE codigo_fabricante = 2;
-- 21 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT producto.nombre AS nombre_producto , fabricante.nombre AS nombre_fabricante,precio 
FROM producto
JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante ;


-- 22 Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricant, per ordre alfabètic.
SELECT producto.nombre AS nombre_producto , fabricante.nombre AS nombre_fabricante,precio 
FROM producto
JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante 
ORDER BY fabricante.nombre ASC;

-- 23 Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
 SELECT producto.codigo, producto.nombre , fabricante.codigo, fabricante.nombre AS nombre_fabricante 
 FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante;
 
-- 24 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
 SELECT producto.nombre , producto.precio, fabricante.nombre AS nombre_abricante FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 ORDER BY precio ASC LIMIT 1;
-- 25 Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
 SELECT producto.nombre , producto.precio, fabricante.nombre AS nombre_fabricante FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 ORDER BY precio DESC  LIMIT 1;
-- 26 Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre , fabricante.nombre AS nombre_fabricante 
FROM producto
JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.codigo = 2;
-- 27 Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
SELECT producto.nombre , producto.precio , fabricante.nombre AS nombre_fabricante FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE fabricante.codigo = 6 AND precio > 200 ;
-- 28 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.

 SELECT producto.nombre , fabricante.nombre AS nombre_fabricante 
 FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE fabricante.codigo = 1
 OR fabricante.codigo = 3 OR fabricante.codigo = 5;
-- 29 Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
 SELECT producto.nombre , fabricante.nombre AS nombre_fabricante 
 FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE fabricante.codigo IN (1,3,5);
-- 30 Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
 SELECT producto.nombre , fabricante.nombre AS nombe_fabricante
 FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE fabricante.nombre
 LIKE '%e';
-- 31 Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
 SELECT producto.nombre , fabricante.nombre AS nombre_fabricante
 FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE fabricante.nombre
 LIKE '%w%';

 -- 32 Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
 SELECT producto.nombre , producto.precio , fabricante.nombre AS nombre_fabridante 
 FROM producto
 JOIN fabricante
 ON fabricante.codigo = producto.codigo_fabricante
 WHERE precio >= 180
 ORDER BY precio DESC , producto.nombre ASC;
 -- 33 Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
 SELECT DISTINCT fabricante.codigo , fabricante.nombre AS nombre_fabricante 
 FROM fabricante
 INNER JOIN producto
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE producto.codigo_fabricante;
 -- 34 Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
 SELECT DISTINCT fabricante.nombre AS nombre_fabricante , producto.nombre 
 FROM fabricante
 LEFT JOIN producto
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE fabricante.nombre
 like '%%';
 -- 35 Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
 SELECT fabricante.nombre 
 FROM fabricante
 JOIN producto
 ON producto.codigo_fabricante = fabricante.codigo
 WHERE producto.nombre IS NULL;
 -- 36 Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
 SELECT DISTINCT producto.nombre ,  fabricante.nombre AS nombre_fabridante 
 FROM fabricante
 JOIN producto
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE fabricante.codigo = 2;
 -- 37 Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense utilitzar INNER JOIN).
 SELECT producto.nombre ,  producto.precio , fabricante.nombre  AS nombre_fabridante 
 FROM fabricante
 RIGHT JOIN producto
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE precio = (
 SELECT  precio FROM producto 
 WHERE codigo_fabricante = 2
 ORDER BY precio DESC LIMIT 1
 ); 
 -- 38 Llista el nom del producte més car del fabricant Lenovo.
 SELECT  producto.nombre FROM producto 
 INNER JOIN fabricante
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE codigo_fabricante = 2
 ORDER BY precio DESC LIMIT 1;
 -- 39 Llista el nom del producte més barat del fabricant Hewlett-Packard.
 SELECT  producto.nombre 
 FROM producto 
 INNER JOIN fabricante
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE codigo_fabricante = 3
 ORDER BY precio ASC LIMIT 1;
 -- 40 Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
 SELECT  producto.nombre ,  producto.precio , fabricante.nombre  AS nombre_fabricante FROM fabricante
 RIGHT JOIN producto
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE precio >= (
 SELECT  precio FROM producto 
 WHERE codigo_fabricante = 2
 ORDER BY precio DESC LIMIT 1); 
 -- 41 Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.nombre , producto.precio, fabricante.nombre FROM producto
 INNER JOIN fabricante
 ON  producto.codigo_fabricante = fabricante.codigo
 WHERE fabricante.codigo = 1
 AND precio > (
 SELECT avg(all producto.precio) FROM producto
 WHERE codigo_fabricante = 1);
