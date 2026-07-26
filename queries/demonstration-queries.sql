/*
Sports League Database
Demonstration Queries

These queries were added later for the GitHub portfolio version
of this project. They demonstrate how the original database tables
can be joined, filtered, grouped, and sorted.
*/

USE cl_sports_league;

-- =========================================================
-- 1. Display each player with their team and position
-- =========================================================

SELECT
    p.PlayerID,
    CONCAT(p.First_Name, ' ', p.Last_Name) AS Player_Name,
    t.Team_Name,
    pos.Position_Name
FROM player AS p
JOIN team AS t
    ON p.TeamID = t.TeamID
JOIN position AS pos
    ON p.PositionID = pos.PositionID
ORDER BY
    t.Team_Name,
    p.Last_Name;


-- =========================================================
-- 2. Display player career statistics and per-game averages
-- =========================================================

SELECT
    CONCAT(p.First_Name, ' ', p.Last_Name) AS Player_Name,
    t.Team_Name,
    ps.Points,
    ps.Assists,
    ps.Steals,
    ps.Games_Played,
    ROUND(ps.Points / NULLIF(ps.Games_Played, 0), 2) AS Points_Per_Game,
    ROUND(ps.Assists / NULLIF(ps.Games_Played, 0), 2) AS Assists_Per_Game,
    ROUND(ps.Steals / NULLIF(ps.Games_Played, 0), 2) AS Steals_Per_Game
FROM player AS p
JOIN team AS t
    ON p.TeamID = t.TeamID
JOIN player_stats AS ps
    ON p.PlayerID = ps.PlayerID
ORDER BY
    Points_Per_Game DESC;


-- =========================================================
-- 3. Rank teams by calculated winning percentage
-- =========================================================

SELECT
    Team_Name,
    City_Name,
    Wins,
    Losses,
    Wins + Losses AS Recorded_Games,
    ROUND(
        Wins / NULLIF(Wins + Losses, 0),
        3
    ) AS Winning_Percentage
FROM team
ORDER BY
    Winning_Percentage DESC;


-- =========================================================
-- 4. Count how many players are assigned to each team
-- =========================================================

SELECT
    t.Team_Name,
    COUNT(p.PlayerID) AS Player_Count
FROM team AS t
LEFT JOIN player AS p
    ON t.TeamID = p.TeamID
GROUP BY
    t.TeamID,
    t.Team_Name
ORDER BY
    Player_Count DESC,
    t.Team_Name;


-- =========================================================
-- 5. Show the league hierarchy from division to team
-- =========================================================

SELECT
    d.Division_Name,
    c.Conference_Name,
    s.State_Name,
    t.City_Name,
    t.Team_Name
FROM division AS d
JOIN conference AS c
    ON d.DivisionID = c.DivisionID
JOIN state AS s
    ON c.ConferenceID = s.ConferenceID
JOIN team AS t
    ON s.StateID = t.StateID
ORDER BY
    d.Division_Name,
    c.Conference_Name,
    t.Team_Name;


-- =========================================================
-- 6. Find the five players with the most career points
-- =========================================================

SELECT
    CONCAT(p.First_Name, ' ', p.Last_Name) AS Player_Name,
    t.Team_Name,
    ps.Points,
    ps.Games_Played
FROM player AS p
JOIN team AS t
    ON p.TeamID = t.TeamID
JOIN player_stats AS ps
    ON p.PlayerID = ps.PlayerID
ORDER BY
    ps.Points DESC
LIMIT 5;


-- =========================================================
-- 7. Compare average player statistics by position
-- =========================================================

SELECT
    pos.Position_Name,
    COUNT(p.PlayerID) AS Player_Count,
    ROUND(AVG(ps.Points), 2) AS Average_Career_Points,
    ROUND(AVG(ps.Assists), 2) AS Average_Career_Assists,
    ROUND(AVG(ps.Steals), 2) AS Average_Career_Steals
FROM position AS pos
JOIN player AS p
    ON pos.PositionID = p.PositionID
JOIN player_stats AS ps
    ON p.PlayerID = ps.PlayerID
GROUP BY
    pos.PositionID,
    pos.Position_Name
ORDER BY
    Average_Career_Points DESC;


-- =========================================================
-- 8. Find players above the database average in career points
-- =========================================================

SELECT
    CONCAT(p.First_Name, ' ', p.Last_Name) AS Player_Name,
    t.Team_Name,
    ps.Points
FROM player AS p
JOIN team AS t
    ON p.TeamID = t.TeamID
JOIN player_stats AS ps
    ON p.PlayerID = ps.PlayerID
WHERE ps.Points > (
    SELECT AVG(Points)
    FROM player_stats
)
ORDER BY
    ps.Points DESC;
