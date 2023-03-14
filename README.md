# **Project: Gaming Trends with Twitch**
## Project on practicing SQL skills and visualization

### Project Objectives:
*1. Analyze Twitch Gaming Data (Using SQL)*
*2. Visualize Twitch Gaming Data (Using Matplotlib)*

### Technologies used:
```
DB Browser for SQLite
Jupyter Notebook
```

### Dataset used:
```
- [x] [`stream.csv`](stream.csv)
- [x] [`chat.csv`](chat.csv)

```

The `stream.csv` has the following fields:

Headers | Description |
--- | --- |
`time` | date and time (YYYY-MM-DD HH:MM:SS)
`device_id` | device ID
`login` | login ID
`channel` | streamer name
`country` | country name abbreviation
`player` | streamed device
`game` | game name
`stream_format` | stream quality
`subscriber` | is the viewer a subscriber? (true/false)

The `chat.csv` has the following fields:

Headers | Description |
--- | --- |
`time` | date and time (YYYY-MM-DD HH:MM:SS)
`device_id` | device ID
`login` | login ID
`channel` | streamer name
`country` | country name abbreviation
`player` | chat device
`game` | game name

---

### External Resources:
```
https://www.codecademy.com/journeys/data-scientist-aly/paths/dsalycj-22-advanced-databases/tracks/dsalycj-22-advanced-sql-for-data-science/modules/dacp-twitch-1483744c-9211-4ded-ba31-b038ded6e1b8/articles/twitch-project
```

### How to use ###
- [x] Import datasets from csv using DB Browser for SQLite
- [x] Get the key statistics of the datasets using aggregate functions
- [x] Visualize the data using matplotlib library

## *Observations* ##
1. League of Legends, Dota 2 and Counter-Strike: Global Offensive are the most popular games;
2. The most visitors are from US, Germany and Canada;
3. The users usually use these platforms when visiting Twitch: site, iphone_t, android;
4. 12 a.m. and 1 p.m. are the most popular visiting time;
5. The fraction of subscribers are very low for all games and channels.
6. The most viewers of League of Legends live in US.
