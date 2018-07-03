CREATE TABLE seasons (
  ID int NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,
  wins int DEFAULT 0,
  losses int DEFAULT 0,
  ties int DEFAULT 0,
  cy_young VARCHAR(100),
  silver_slugger VARCHAR(100),
  gold_glove VARCHAR(100),
  team_player VARCHAR(100),
  mvp VARCHAR(100),
  playoff VARCHAR(256),
  PRIMARY KEY (ID)
);
