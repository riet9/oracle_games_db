ALTER TABLE spele ADD cena NUMBER(8,2);

ALTER TABLE spele
  ADD CONSTRAINT spele_cena_chk
  CHECK (cena IS NULL OR cena >= 0);
