CREATE TABLE IF NOT EXISTS Genre(
	genre_id SERIAL PRIMARY KEY, 
	name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Artist(
	artist_id SERIAL PRIMARY KEY, 
	nickname VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album(
	album_id SERIAL PRIMARY KEY, 
	title VARCHAR(80) NOT NULL,
	release_year INTEGER NOT NULL CHECK (release_year <= 2022)
);

CREATE TABLE IF NOT EXISTS Tracklist(
	tracklist_id SERIAL PRIMARY KEY, 
	album_id INTEGER NOT NULL REFERENCES Album(album_id),
	song_name VARCHAR(120) NOT NULL,
	length NUMERIC NOT NULL
);

CREATE TABLE IF NOT EXISTS Compilation(
	compilation_id SERIAL PRIMARY KEY, 
	name VARCHAR(80) NOT NULL,
	release_year INTEGER NOT NULL  CHECK (release_year <= 2022)
);

CREATE TABLE IF NOT EXISTS GenreToArtist(
	gentetoartist_id SERIAL PRIMARY KEY, 
	genre_id INTEGER NOT NULL REFERENCES Genre(genre_id),
	artist_id INTEGER NOT NULL REFERENCES Artist(artist_id)
);

CREATE TABLE IF NOT EXISTS ArtistToAlbum(
	artisttoalbum_id SERIAL PRIMARY KEY, 
	artist_id INTEGER NOT NULL REFERENCES Artist(artist_id),
	album_id INTEGER NOT NULL REFERENCES Album(album_id)	
);

CREATE TABLE IF NOT EXISTS CompilationToTracklist(
	compilationtotracklist_id SERIAL PRIMARY KEY, 
	compilation_id INTEGER NOT NULL REFERENCES Compilation(compilation_id),
	tracklist_id INTEGER NOT NULL REFERENCES Tracklist(tracklist_id)
);