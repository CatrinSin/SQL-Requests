--название и год выхода альбомов, вышедших в 2018 году;
SELECT title, release_year FROM album
WHERE release_year = 2018;

--название и продолжительность самого длительного трека;
SELECT song_name, length FROM tracklist
ORDER BY length DESC
LIMIT 1;

--название треков, продолжительность которых не менее 3,5 минуты;
SELECT song_name FROM tracklist
WHERE length >= 3.5;

--названия сборников, вышедших в период с 2018 по 2020 год включительно;
SELECT name FROM compilation
WHERE release_year BETWEEN 2018 AND 2020;

--исполнители, чье имя состоит из 1 слова;
SELECT nickname FROM artist
WHERE nickname NOT LIKE '% %';

--название треков, которые содержат слово "мой"/"my".
SELECT song_name FROM tracklist
WHERE song_name LIKE '%My%' OR song_name LIKE '%Моя%';


--Part2
--количество исполнителей в каждом жанре;
SELECT genre.name, COUNT(artist.nickname)  FROM genretoartist 
JOIN artist ON artist.artist_id = genretoartist.artist_id
JOIN genre ON genre.genre_id = genretoartist.artist_id
GROUP BY genre.name;

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT album.release_year, COUNT(tracklist.song_name)  FROM tracklist 
JOIN album ON album.album_id = tracklist.album_id 
WHERE release_year >= 2019 AND release_year <= 2020
GROUP BY release_year;

--средняя продолжительность треков по каждому альбому;
SELECT album.title, AVG(tracklist.length)  FROM tracklist 
JOIN album ON album.album_id = tracklist.album_id 
GROUP BY album.title;

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT artist.nickname FROM artist 
JOIN artisttoalbum ON artist.artist_id = artisttoalbum.artist_id 
JOIN album ON album.album_id = artisttoalbum.album_id 
WHERE release_year != 2020
GROUP BY artist.nickname;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT compilation.name FROM compilation
JOIN compilationtotracklist ON compilation.compilation_id = compilationtotracklist.compilation_id
JOIN tracklist ON tracklist.tracklist_id = compilationtotracklist.tracklist_id
JOIN album ON album.album_id = tracklist.album_id 
JOIN artisttoalbum ON album.album_id = artisttoalbum.album_id 
JOIN artist ON artist.artist_id = artisttoalbum.artist_id 
WHERE artist.nickname LIKE '%Queen%'
GROUP BY compilation.name;

--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT album.title, COUNT(genre.name)  FROM album
JOIN artisttoalbum ON album.album_id = artisttoalbum.album_id 
JOIN artist ON artist.artist_id = artisttoalbum.artist_id
JOIN genretoartist ON artist.artist_id = genretoartist.artist_id 
JOIN genre ON genre.genre_id = genretoartist.genre_id
GROUP BY album.title
HAVING COUNT(genre.name) > 1;

--наименование треков, которые не входят в сборники;
SELECT tracklist.song_name FROM tracklist
LEFT JOIN compilationtotracklist ON tracklist.tracklist_id = compilationtotracklist.tracklist_id
LEFT JOIN compilation ON compilation.compilation_id = compilationtotracklist.compilation_id 
WHERE compilation.name IS NULL
GROUP BY tracklist.song_name;


--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT artist.nickname, MIN(tracklist.length) FROM artist 
JOIN artisttoalbum ON artist.artist_id = artisttoalbum.artist_id 
JOIN album ON album.album_id = artisttoalbum.album_id 
JOIN tracklist ON  album.album_id = tracklist.tracklist_id
WHERE tracklist.length <= (SELECT AVG(tracklist.length) FROM tracklist)
GROUP BY artist.nickname
ORDER BY MIN(tracklist.length);

--название альбомов, содержащих наименьшее количество треков.
--SELECT album.title, COUNT(tracklist.song_name) FROM album
--CROSS JOIN tracklist  ON album.album_id = tracklist.tracklist_id
--GROUP BY album.title
--ORDER BY COUNT(tracklist.song_name);
SELECT title,release_year, song_name, length FROM album
JOIN tracklist ON album.album_id = tracklist.tracklist_id










