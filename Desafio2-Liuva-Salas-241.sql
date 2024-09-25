-- Crear Base de Datos
CREATE DATABASE desafio2_liuva_salas_241;

-- Conectarse a la Base de Datos
\c desafio2_liuva_salas_241;

-- Crear tabla con datos otorgados en el desafio
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- Consultar la tabla creada
SELECT *FROM inscritos;

-- 1. ¿Cuántos registros hay?
SELECT COUNT(*) FROM inscritos; -- 16

-- 2. ¿Cuántos inscritos hay en total?
SELECT SUM(inscritos.cantidad) as "Numero de personas inscritas" FROM inscritos; -- 774

-- 3. ¿Cuál o cuales son los registros de mayor antigüedad?
SELECT *FROM inscritos
WHERE inscritos.fecha = (
SELECT MIN(inscritos.fecha) FROM inscritos); 
-- 2 Registros
-- 44|2021-01-01|Blog
-- 56|2021-01-01|Pagina

-- 4. ¿Cuántos inscritos hay por dia?
SELECT fecha, SUM(inscritos.cantidad) as "Inscritos por dia" FROM inscritos
GROUP BY fecha
ORDER BY fecha ASC;

-- fecha| Inscritos por dia
-- 2021-01-01 | 100
-- 2021-02-01 | 120
-- 2021-03-01 | 103
-- 2021-04-01 | 93
-- 2021-05-01 | 88
-- 2021-06-01 | 30
-- 2021-07-01 | 58
-- 2021-08-01 | 182

-- 5. ¿Que dia se insribieron la mayor cantidad de personas y cuantas personas se inscribieronese dia?
SELECT fecha, SUM(inscritos.cantidad) as "Inscritos" FROM inscritos
GROUP BY fecha
ORDER BY SUM(inscritos.cantidad) DESC
LIMIT 1;

-- 2021-08-01| 182




