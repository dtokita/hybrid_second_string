CREATE TABLE players (
  ID int NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  jersey_number int NOT NULL,
  bats VARCHAR(1) NOT NULL,
  throws VARCHAR(1) NOT NULL,
  game_team_player_awards int DEFAULT 0,
  game_mvp_awards int DEFAULT 0,
  season_cy_young_awards int DEFAULT 0,
  season_silver_slugger_awards int DEFAULT 0,
  season_gold_glove_awards int DEFAULT 0,
  season_team_player_awards int DEFAULT 0,
  season_mvp_awards int DEFAULT 0,
  lifetime_hall_of_fame int DEFAULT 0,
  PRIMARY KEY (ID) 
);
