CREATE TABLE pitstats (
  ID int NOT NULL AUTO_INCREMENT,
  player_id int NOT NULL,
  game_id int NOT NULL,
  season_id int NOT NULL,
  outs_recorded double DEFAULT 0.0,
  hits double DEFAULT 0.0,
  runs double DEFAULT 0.0,
  earned_runs double DEFAULT 0.0,
  walks double DEFAULT 0.0,
  strikeouts double DEFAULT 0.0,
  homeruns double DEFAULT 0.0,
  win_game int DEFAULT 0,
  loss_game int DEFAULT 0,
  save_game int DEFAULT 0,
  earned_run_average double AS ((27.0 * earned_runs) / outs_recorded),
  whip double AS ((walks + hits) / (outs_recorded / 3.0)),
  hits_per_nine double AS (hits / (outs_recorded / 27.0)),
  walks_per_nine double AS (walks / (outs_recorded / 27.0)),
  strikeouts_per_nine double AS (strikeouts / (outs_recorded/ 27.0)), 
  PRIMARY KEY (ID)
);
