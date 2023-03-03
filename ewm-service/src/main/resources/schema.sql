DROP TABLE IF EXISTS users, categories, events, compilations, events_compilations, requests;

CREATE TABLE IF NOT EXISTS users
(
    id    BIGINT GENERATED BY DEFAULT AS IDENTITY,
    name  VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    
    CONSTRAINT pk_user PRIMARY KEY(id),
    CONSTRAINT UQ_USER_EMAIL UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS categories
(
    id   BIGINT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(128) NOT NULL UNIQUE,

    CONSTRAINT pk_categories PRIMARY KEY(id),
    CONSTRAINT UQ_CATEGORY_NAME UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS events
(
    id                 BIGINT GENERATED ALWAYS AS IDENTITY,
    annotation         VARCHAR(2000)               NOT NULL,
    category_id        BIGINT                      NOT NULL REFERENCES categories ON DELETE CASCADE,
    confirmed_requests BIGINT,
    created_on         TIMESTAMP WITHOUT TIME ZONE,
    description        VARCHAR(7000),
    event_date         TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    initiator_id       BIGINT                      NOT NULL REFERENCES users ON DELETE CASCADE,
    lat                REAL                        NOT NULL,
    lon                REAL                        NOT NULL,
    paid               BOOL                        NOT NULL,
    participant_limit  BIGINT,
    published_on       TIMESTAMP WITHOUT TIME ZONE,
    request_moderation BOOL,
    state              VARCHAR(64),
    title              VARCHAR(120)                NOT NULL,
    views              BIGINT,

    CONSTRAINT pk_events PRIMARY KEY (id),
    CONSTRAINT FK_EVENTS_ON_CAT FOREIGN KEY (category_id) REFERENCES categories (id),
    CONSTRAINT FK_EVENTS_ON_INITIATOR FOREIGN KEY (initiator_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS compilations
(
    id     BIGINT GENERATED ALWAYS AS IDENTITY,
    title  VARCHAR(120) NOT NULL UNIQUE,
    pinned BOOL         NOT NULL,

    CONSTRAINT pk_compilation PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS events_compilations
(
    event_id       BIGINT REFERENCES events (id) ON DELETE CASCADE,
    compilation_id BIGINT REFERENCES compilations (id) ON DELETE CASCADE,
    PRIMARY KEY (event_id, compilation_id),

    CONSTRAINT pk_compilation_of_events PRIMARY KEY (compilation_id, event_id),
    CONSTRAINT fk_comofeve_on_compilation FOREIGN KEY (compilation_id) REFERENCES compilations (id),
    CONSTRAINT fk_comofeve_on_event FOREIGN KEY (event_id) REFERENCES events (id)
);

CREATE TABLE IF NOT EXISTS requests
(
    id           BIGINT GENERATED ALWAYS AS IDENTITY,
    event_id     BIGINT NOT NULL REFERENCES events (id),
    requester_id BIGINT NOT NULL REFERENCES users (id),
    created      TIMESTAMP WITHOUT TIME ZONE,
    status       VARCHAR(10),
    UNIQUE (event_id, requester_id),

    CONSTRAINT pk_participation_requests PRIMARY KEY (id),
    CONSTRAINT FK_PARTICIPATION_REQUESTS_ON_EVENT FOREIGN KEY (event_id) REFERENCES events (id),
    CONSTRAINT FK_PARTICIPATION_REQUESTS_ON_REQUESTER FOREIGN KEY (requester_id) REFERENCES users (id),
    CONSTRAINT UQ_PARTICIPANT_PER_EVENT UNIQUE (requester_id, event_id)
);