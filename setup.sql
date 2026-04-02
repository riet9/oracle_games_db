PROMPT ==========================================
PROMPT Setting up DBsp schema objects
PROMPT ==========================================

PROMPT Running schema.ddl ...
@@schema.ddl

PROMPT Loading demo data from insert.sql ...
PROMPT If you want a smaller dataset, edit setup.sql and replace insert.sql with short_insert.sql.
@@insert.sql

PROMPT Creating package spec ...
@@speles_pkg.sql

PROMPT Creating package body ...
@@speles_pkg_body.sql

PROMPT ==========================================
PROMPT Setup finished
PROMPT Open the package entry point through your PL/SQL web gateway:
PROMPT <CURRENT_SCHEMA>.SPELES_PKG.MENU
PROMPT ==========================================
