CREATE ROLE analyst;
CREATE ROLE tester;

CREATE ROLE fedor_serov LOGIN;
CREATE ROLE roman_belov LOGIN;
ALTER ROLE fedor_serov WITH PASSWORD 'fedorserov';
ALTER ROLE roman_belov WITH PASSWORD 'romanbelov';

GRANT analyst TO fedor_serov;
GRANT tester TO roman_belov;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO analyst;
GRANT ALL ON ALL TABLES IN SCHEMA public TO tester;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO tester;