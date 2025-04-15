USE esgf_2025_bd1;

-- 1. Nombre de titres de plus de 2h
SELECT COUNT(*) AS nb_titres_plus_de_2h
FROM imdb_title_basics
WHERE runtimeMinutes > 120;

-- 2. Moyenne des durées des titres contenant "world" (sans "underworld")
SELECT ROUND(AVG(runtimeMinutes), 2) AS duree_moyenne_world
FROM imdb_title_basics
WHERE primaryTitle RLIKE '\\bworld\\b';

-- 3. Moyenne des notes des comédies
SELECT ROUND(AVG(r.averageRating), 2) AS note_moyenne_comedies
FROM imdb_title_basics b
JOIN imdb_title_ratings r ON b.tconst = r.tconst
WHERE b.genres LIKE '%Comedy%';

-- 4. Moyenne des notes des non-comédies
SELECT ROUND(AVG(r.averageRating), 2) AS note_moyenne_non_comedies
FROM imdb_title_basics b
JOIN imdb_title_ratings r ON b.tconst = r.tconst
WHERE b.genres NOT LIKE '%Comedy%';

-- 5. Top 5 films de Quentin Tarantino
-- Étape 1 : retrouver le nconst
SELECT nconst
FROM imdb_name_basics
WHERE primaryName = 'Quentin Tarantino';

-- Étape 2 : sélectionner ses meilleurs films
SELECT b.primaryTitle, r.averageRating
FROM imdb_title_crew c
JOIN imdb_title_basics b ON c.tconst = b.tconst
JOIN imdb_title_ratings r ON b.tconst = r.tconst
WHERE c.directors LIKE '%nm0000233%'
ORDER BY r.averageRating DESC
LIMIT 5;
