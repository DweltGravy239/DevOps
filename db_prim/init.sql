CREATE TABLE email ( id serial PRIMARY KEY, email VARCHAR(255) );
CREATE TABLE phone ( id serial PRIMARY KEY, phonenumber VARCHAR(255) );
INSERT INTO email (email) VALUES ('babusha@mail.ru'), ('PTSTART@mail.ru');
INSERT INTO phone (phonenumber) VALUES ('89263270367'), ('88005553535');

CREATE TABLE hba ( lines text );
COPY hba FROM '/var/lib/postgresql/data/pg_hba.conf';
INSERT INTO hba (lines) VALUES ('host replication all 0.0.0.0/0 md5');
COPY hba TO '/var/lib/postgresql/data/pg_hba.conf';
SELECT pg_reload_conf();

CREATE USER repl_user WITH REPLICATION ENCRYPTED PASSWORD 'Qq12345' LOGIN;
SELECT pg_create_physical_replication_slot('replication_slot');

