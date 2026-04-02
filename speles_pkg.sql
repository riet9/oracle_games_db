create
or replace PACKAGE SPELES_PKG IS
/* Web package
 - MENU, TEST
 - PLATFORMA_SRC(term): JSON for jQuery UI autocomplete
 - SPELE_LAB: minimal form (nosaukums + platforma via autocomplete + hidden id)
 */
PROCEDURE menu;

PROCEDURE test;

PROCEDURE spele_lab(
    p_spele_id IN NUMBER DEFAULT NULL,
    p_nosaukums IN VARCHAR2 DEFAULT NULL,
    p_izlaides_datums IN VARCHAR2 DEFAULT NULL,
    p_cena IN VARCHAR2 DEFAULT NULL,
    p_studija_id IN NUMBER DEFAULT NULL,
    p_studija_txt IN VARCHAR2 DEFAULT NULL,
    p_platforma_id IN NUMBER DEFAULT NULL,
    p_platforma_txt IN VARCHAR2 DEFAULT NULL,
    p_zanrs_id IN NUMBER DEFAULT NULL,
    p_zanrs_txt IN VARCHAR2 DEFAULT NULL,
    p_kategorija_id IN NUMBER DEFAULT NULL,
    p_kategorija_txt IN VARCHAR2 DEFAULT NULL,
    p_err IN VARCHAR2 DEFAULT NULL
);

PROCEDURE spele_save(
    p_spele_id IN NUMBER DEFAULT NULL,
    p_nosaukums IN VARCHAR2 DEFAULT NULL,
    p_izlaides_datums IN VARCHAR2 DEFAULT NULL,
    p_cena IN VARCHAR2 DEFAULT NULL,
    p_studija_id IN NUMBER DEFAULT NULL,
    p_studija_txt IN VARCHAR2 DEFAULT NULL,
    p_platforma_id IN NUMBER DEFAULT NULL,
    p_platforma_txt IN VARCHAR2 DEFAULT NULL,
    p_zanrs_id IN NUMBER DEFAULT NULL,
    p_zanrs_txt IN VARCHAR2 DEFAULT NULL,
    p_kategorija_id IN NUMBER DEFAULT NULL,
    p_kategorija_txt IN VARCHAR2 DEFAULT NULL
);

PROCEDURE spele_del_ask(p_spele_id IN NUMBER);

PROCEDURE spele_del_do(p_spele_id IN NUMBER);

PROCEDURE spele_src(term IN VARCHAR2 DEFAULT NULL);

PROCEDURE reitingi_list(
    p_spele_id_txt IN VARCHAR2 DEFAULT NULL,
    p_spele_txt IN VARCHAR2 DEFAULT NULL,
    p_v_min_txt IN VARCHAR2 DEFAULT NULL,
    p_v_max_txt IN VARCHAR2 DEFAULT NULL,
    p_date_from IN VARCHAR2 DEFAULT NULL,
    p_date_to IN VARCHAR2 DEFAULT NULL,
    p_sort IN VARCHAR2 DEFAULT NULL,
    p_dir IN VARCHAR2 DEFAULT NULL
);

PROCEDURE reitingi_lab(
    p_reitinga_id IN NUMBER DEFAULT NULL,
    p_spele_id IN NUMBER DEFAULT NULL,
    p_spele_txt IN VARCHAR2 DEFAULT NULL,
    p_vertejums IN VARCHAR2 DEFAULT NULL,
    p_reitinga_datums IN VARCHAR2 DEFAULT NULL,
    p_komentars IN VARCHAR2 DEFAULT NULL,
    p_err IN VARCHAR2 DEFAULT NULL
);

PROCEDURE reitingi_save(
    p_reitinga_id IN NUMBER DEFAULT NULL,
    p_spele_id IN NUMBER DEFAULT NULL,
    p_spele_txt IN VARCHAR2 DEFAULT NULL,
    p_vertejums IN VARCHAR2 DEFAULT NULL,
    p_reitinga_datums IN VARCHAR2 DEFAULT NULL,
    p_komentars IN VARCHAR2 DEFAULT NULL
);

PROCEDURE reitingi_del_ask(p_reitinga_id IN NUMBER);

PROCEDURE reitingi_del_do(p_reitinga_id IN NUMBER);

PROCEDURE platforma_src(term IN VARCHAR2 DEFAULT NULL);

PROCEDURE studija_src(term IN VARCHAR2 DEFAULT NULL);

PROCEDURE zanrs_src(term IN VARCHAR2 DEFAULT NULL);

PROCEDURE kategorija_src(term IN VARCHAR2 DEFAULT NULL);

PROCEDURE spele_list(
    p_q IN VARCHAR2 DEFAULT NULL,
    p_platforma_id_txt IN VARCHAR2 DEFAULT NULL,
    p_sort IN VARCHAR2 DEFAULT NULL,
    p_dir IN VARCHAR2 DEFAULT NULL
);

END SPELES_PKG;
