SELECT *
FROM stream
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;

SELECT DISTINCT (game)
FROM stream;

SELECT DISTINCT (channel)
FROM stream;

SELECT game,
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

SELECT country,
  COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

SELECT player,
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

SELECT game AS 'Game',
  COUNT (*) AS 'Count',
  CASE
    WHEN game = 'League of Legends'
      THEN 'MOBA'
    WHEN game = 'Dota 2'
      THEN 'MOBA'
    WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'Genre'
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

SELECT time
FROM stream
LIMIT 10;

SELECT time,
   strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20;

SELECT strftime('%H', time),
  COUNT(*)
FROM stream
WHERE country = 'RU'
GROUP BY 1
ORDER BY 2 DESC;

SELECT *
FROM stream
LEFT JOIN chat
  ON
  stream.device_id = chat.device_id
LIMIT 10;

SELECT channel,
  game,
  COUNT (DISTINCT login) AS all_viewers,
  COUNT (DISTINCT CASE
   WHEN subscriber = 'True'
   THEN  login
   END) AS subscribers,
   COUNT (DISTINCT CASE
   WHEN subscriber = 'False'
   THEN login
   END) AS non_subscribers,
   COUNT (DISTINCT CASE
   WHEN subscriber IS NULL
   THEN login
   END) AS NA
FROM stream
GROUP BY 1
ORDER BY 3 DESC;

WITH funnel AS (
  SELECT channel,
  game,
  COUNT (DISTINCT login) AS all_viewers,
  COUNT (DISTINCT CASE
   WHEN subscriber = 'True'
   THEN  login
   END) AS subscribers,
   COUNT (DISTINCT CASE
   WHEN subscriber = 'False'
   THEN login
   END) AS non_subscribers,
   COUNT (DISTINCT CASE
   WHEN subscriber IS NULL
   THEN login
   END) AS NA
FROM stream
GROUP BY 1
ORDER BY 3 DESC)
SELECT channel,
  game,
  ROUND (1.0 * subscribers / all_viewers * 100, 2) AS subscriber_fraction,
  ROUND (1.0 * non_subscribers / all_viewers * 100, 2) AS non_subscriber_fraction,
  ROUND (1.0 * NA / all_viewers * 100, 2) AS NA_fraction
FROM funnel
ORDER BY 4 DESC;
