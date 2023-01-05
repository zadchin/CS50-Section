-- 1.sql 
-- All songs in the database.
SELECT name
FROM songs;

-- 2.sql 
-- All songs in increasing order of tempo.
SELECT name
FROM songs
ORDER BY tempo;

-- 3.sql 
-- The names of the top 5 longest songs, in descending order of length.
SELECT name
FROM songs 
ORDER BY duration_ms
DESC LIMIT 5;

-- 4.sql
-- The names of any songs that have danceability, energy, and valence greater than 0.75.
SELECT name 
FROM songs 
WHERE danceability > 0.75 AND energy > 0.75 AND valence > 0.75;

-- 5.sql
-- The average energy of all the songs.
SELECT AVG(energy)
FROM songs

-- 6.sql
-- The names of songs that are by Post Malone.
-- Using nested SELECTs
SELECT name
FROM songs
WHERE artist_id =
(
    SELECT id
    FROM artists
    WHERE name = 'Post Malone'
);

-- Using JOIN
SELECT songs.name
FROM songs
JOIN artists ON songs.artist_id = artists.id
WHERE artists.name = 'Post Malone';

-- 7.sql
-- The average energy of songs that are by Drake
-- Using nested SELECTs
SELECT AVG(energy) 
FROM songs 
WHERE artist_id = 
(
    SELECT id 
    FROM artists 
    WHERE name = 'Drake'
);

-- Using JOIN
SELECT AVG(songs.energy)
FROM songs
JOIN artists ON songs.artist_id = artists.id
WHERE artists.name = 'Drake';

-- 8.sql
-- The names of songs that feature other artists.
SELECT name 
FROM songs 
WHERE name LIKE '%feat.%';