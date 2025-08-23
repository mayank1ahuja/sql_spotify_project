--SPOTIFY PROJECT
CREATE TABLE spotify 
(
			  Artist 			VARCHAR (255),	
			  Track 			VARCHAR (255),	
			  Album 			VARCHAR (255),	
			  Album_type 		VARCHAR (50),	
			  Danceability 		FLOAT,	
			  Energy 			FLOAT,	
			  Loudness 			FLOAT,	
			  Speechiness 		FLOAT,	
			  Acousticness 		FLOAT,	
			  Instrumentalness 	FLOAT,	
			  Liveness 			FLOAT,
			  Valence 			FLOAT,
			  Tempo 			FLOAT,
			  Duration_min 		FLOAT,
			  Title 			VARCHAR (255),
			  Channel 			VARCHAR (255),
			  Views 			BIGINT,
			  Likes 			BIGINT,
			  Comments 			BIGINT,
			  Licensed 			BOOLEAN,
			  official_video 	BOOLEAN,
			  Stream 			BIGINT,
			  EnergyLiveness 	FLOAT,
			  most_playedon 	VARCHAR (50)
);

--Practice Questions
--Easy Level
--1. Retrieve the names of all tracks that have more than 1 billion streams.
SELECT artist,
	   track, 
	   album,
	   stream
FROM spotify
WHERE stream > 1000000000;

--2. List all albums along with their respective artists.
SELECT DISTINCT album,
	   			artist
FROM spotify
ORDER BY 1;

--3. Get the total number of comments for tracks where licensed = TRUE.
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed IS TRUE;

--4. Find all tracks that belong to the album type single.
SELECT track,
	   album,
	   album_type
FROM spotify
WHERE album_type = 'single';

--5. Count the total number of tracks by each artist.
SELECT artist,
	   COUNT(track) AS total_tracks
FROM spotify
GROUP BY 1;

--Medium Level
--6. Calculate the average danceability of tracks in each album.
SELECT album, 
	   AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY 1;

--7. Find the top 5 tracks with the highest energy values.
SELECT track,
	   MAX(energyliveness) AS enegry_value
FROM spotify
WHERE energyliveness IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--8. List all tracks along with their views and likes where official_video = TRUE.
SELECT track AS tracks_with_official_video,
	   views,
	   likes
FROM spotify
WHERE official_video IS TRUE;

--9. For each album, calculate the total views of all associated tracks.
SELECT album,
	   SUM(views) AS total_views
FROM spotify
GROUP BY 1;

--10. Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT track AS tracks_played_more_on_spotify_than_youtube,
	   album
FROM spotify
WHERE most_playedon = 'Spotify'; 

