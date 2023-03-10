DROP TABLE IF EXISTS hit;

CREATE TABLE IF NOT EXISTS hit
(
    id        BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL PRIMARY KEY,
    app       VARCHAR(32)                             NOT NULL,
    uri       VARCHAR(128)                            NOT NULL,
    ip        VARCHAR(16)                             NOT NULL,
    timestamp timestamp WITHOUT TIME ZONE             NOT NULL
);