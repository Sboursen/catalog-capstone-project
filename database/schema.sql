CREATE TABLE label(
  ID                      SERIAL PRIMARY KEY,
  TITLE                   VARCHAR(100) NOT NULL,
  COLOR                   VARCHAR(100) NOT NULL
);

CREATE TABLE book(
  ID                      SERIAL PRIMARY KEY,
  LABEL_ID                INT,
  PUBLISH_DATE            DATE NOT NULL,
  ARCHIVED                BOOLEAN NOT NULL,
  PUBLISHER               VARCHAR(100) NOT NULL,
  COVER_STATE             VARCHAR(100) NOT NULL,
  FOREIGN KEY (LABEL_ID) REFERENCES label(ID)
);
