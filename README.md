# 🎧✨ Spotify SQL Project ✨🎧 



![Spotify Logo]

## 📄 Overview
This repository presents a methodical, reproducible exercise in applied SQL using a Spotify dataset. It marries meticulous schema design with a curated progression of analytical problems and a compact, evidence-backed optimization vignette. The aim is twofold: to show practical SQL skills — from table design (DDL) to advanced queries (window functions and CTEs) — and to provide concrete deliverables (schema DDL and a curated query catalogue).

## 📌 Key Points
1. This project presents a denormalized real-world table and a clear migration path toward normalization, thereby illustrating schema reasoning and redundancy mitigation.
2. It showcases problem-solving breadth — from straightforward aggregation to advanced analytical patterns.
3. The result is a compact dossier that signals both technical competence and thoughtful engineering judgment.

## 📦 Dataset
*Source*: Kaggle — Netflix Dataset
*Download*: https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset

## 🗂️ Canonical Schema
The primary table coalesces audio descriptors, engagement data, and provenance flags — key information for descriptive analytics and performance-oriented queries.

```sql
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
```

This schema balances domain-relevant audio features (danceability, energy, tempo), engagement signals (views, likes, comments, streams), and boolean indicators (licensed, official_video) to enable both granular and aggregated inquiries.

# 🧩 Project Steps

## 1. Data Exploration📊
Prior to delving into SQL, a good understanding of the dataset is essential. It encompasses attributes like:  
- `Artist`: The performer of the track.
- `Track`: The name of the song.
- `Album`: The album to which the track belongs.
- `Album_type`: The type of album (e.g., single or album).
- Various metrics such as `danceability`, `energy`, `loudness`, `tempo`, and more.

## 2. Querying the Data🧑🏻‍💻
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into **easy**, **medium**, and **advanced** levels to elevate the challenge level of SQL practice.

### Easy Queries
1. Retrieve the names of all tracks that have more than 1 billion streams.
```sql
SELECT artist,
	   track, 
	   album,
	   stream
FROM spotify
WHERE stream > 1000000000;
```

2. List all albums along with their respective artists.
```sql
SELECT DISTINCT album,
	   			artist
FROM spotify
ORDER BY 1;
```

3. Get the total number of comments for tracks where `licensed = TRUE`.
```sql
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed IS TRUE;
```

4. Find all tracks that belong to the album type `single`.
```sql
SELECT track,
	   album,
	   album_type
FROM spotify
WHERE album_type = 'single';
```

5. Count the total number of tracks by each artist.
```sql
SELECT artist,
	   COUNT(track) AS total_tracks
FROM spotify
GROUP BY 1;
```

### Medium Queries
6. Calculate the average danceability of tracks in each album.
```sql
SELECT album, 
	   AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY 1;
```

7. Find the top 5 tracks with the highest energy values.
```sql
SELECT track,
	   MAX(energyliveness) AS enegry_value
FROM spotify
WHERE energyliveness IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

8. List all tracks along with their views and likes where `official_video = TRUE`.
```sql
SELECT track AS tracks_with_official_video,
	   views,
	   likes
FROM spotify
WHERE official_video IS TRUE;
```

9. For each album, calculate the total views of all associated tracks.
```sql
SELECT album,
	   SUM(views) AS total_views
FROM spotify
GROUP BY 1;
```

10. Retrieve the track names that have been streamed on Spotify more than YouTube.
```sql
SELECT track AS tracks_played_more_on_spotify_than_youtube,
	   album
FROM spotify
WHERE most_playedon = 'Spotify'; 
```

### Advanced Queries
11. Find the top 3 most-viewed tracks for each artist using window functions.
12. Write a query to find tracks where the liveness score is above the average.
13. Use a `WITH` clause to calculate the difference between the highest and lowest energy values for tracks in each album.
15. Find tracks where the energy-to-liveness ratio is greater than 1.2.
16. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.


## 🛠️ Technology Stack
- **Database**: PostgreSQL
- **Tools**: pgAdmin 4, PostgreSQL

## ❓ How to Run the Project
1. Install PostgreSQL and pgAdmin (if not already installed).
2. Set up the database schema and tables using the provided normalization structure.
3. Insert the sample data into the respective tables.
4. Execute SQL queries to solve the listed problems.
5. Explore query optimization techniques for large datasets.


# =Note on Completeness
This project is still in progress. I am plan to learn and plan to complete it by solving the above advanced problems and exploring query optimization with regards to this project.🚧
