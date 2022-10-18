--не менее 8 исполнителей;
INSERT INTO artist (nickname)
VALUES ('BrainStorm'),
('Madonna'),
('Charlie Puth'),
('Kety Perry'),
('Tame Impala'),
('Queen'),
('ABBA'),
('PRETTYMUCH');

--не менее 5 жанров;
INSERT INTO genre (name)
VALUES ('Popular'),
('Electronic'),
('Rock'),
('Hip hop'),
('Disco');

--не менее 8 альбомов;
INSERT INTO album (title, release_year)
VALUES ('Maybe', 2001),
('True Blue', 1986),
('Voicenotes', 2018),
('Smile', 2020),
('The Slow Rush', 2020),
('A Night At The Opera', 1975),
('Voulez-Vous', 1979 ),
('Phases', 2019),
('Все о Марте', 2016);

--не менее 15 треков;
INSERT INTO tracklist (album_id, song_name, length)
VALUES (1, 'На заре', 4.35),
(1, 'Моя луна', 4.06),
(2, 'La Isla Bonita', 4.02),
(2, 'Die Another Day', 4.39),
(3, 'I Warned Myself', 2.39),
(3, 'Attention', 3.28),
(4, 'Harleys In Hawaii', 3.05),
(4, 'Roar', 3.42),
(5, 'Borderline', 3.57),
(5, 'One More Hour', 7.12),
(6, 'Bohemian Rhapsody', 5.55),
(6, 'Love Of My Life', 3.37),
(7, 'Voulez-Vous', 5.06),
(7, 'Chiquitita', 5.25),
(8, 'Eyes Off You', 3.24),
(8, 'Love', 2.37)
(3, 'Left And Right', 4.35),
(9, 'О, Марфа!', 3.32);

--не менее 8 сборников.
INSERT INTO compilation (name, release_year)
VALUES ('Soft Gummies', 2015),
('Are you like Madonna?', 2009),
('Young Generation', 2022),
('Beauty of Music', 2011),
('Music for Party', 2020),
('Rock of the centuries', 2012),
('Do you wanna dance?', 2018 ),
('Young Adult', 2021);

--Внимание! Должны быть заполнены все поля каждой таблицы, в т.ч. таблицы связей 
--(исполнителей с жанрами, исполнителей с альбомами, сборников с треками).
INSERT INTO genretoartist (genre_id, artist_id)
VALUES (1, 3),
(1, 2),
(1, 7),
(1, 4),
(2, 6),
(2, 1),
(2, 5),
(3, 6),
(3, 1),
(4, 8),
(4, 4),
(5, 7);

INSERT INTO artisttoalbum (artist_id, album_id)
VALUES (1, 2),
(1, 3),
(1, 8),
(2, 5),
(2, 1),
(2, 7),
(3, 2),
(3, 4),
(4, 4),
(4, 1),
(6, 4),
(6, 1),
(7, 4),
(7, 8),
(8, 1);

INSERT INTO compilationtotracklist (compilation_id, tracklist_id)
VALUES (1, 7),
(1, 12),
(1, 7),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 15),
(3, 16),
(4, 1),
(4, 3),
(4, 1),
(4, 11),
(5, 8),
(5, 9),
(5, 16),
(6, 1),
(6, 11),
(6, 12),
(6, 2),
(7, 13),
(7, 14),
(7, 15),
(7, 6),
(8, 4),
(8, 5),
(8, 6),
(8, 7);