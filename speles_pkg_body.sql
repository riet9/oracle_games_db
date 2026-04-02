create
or replace PACKAGE BODY SPELES_PKG IS

FUNCTION app_schema RETURN VARCHAR2 IS
BEGIN
  RETURN sys_context('USERENV', 'CURRENT_SCHEMA');
END;

FUNCTION route(
  p_proc IN VARCHAR2,
  p_query IN VARCHAR2 DEFAULT NULL
) RETURN VARCHAR2 IS
BEGIN
  RETURN app_schema || '.SPELES_PKG.' || p_proc || nvl(p_query, '');
END;

PROCEDURE page_head(p_title IN VARCHAR2) IS BEGIN owa_util.mime_header('text/html', FALSE, 'utf-8');

htp.p('Cache-Control: no-cache');

owa_util.http_header_close;

htp.p('<!DOCTYPE html>');

htp.p('<html><head><meta charset="utf-8">');

htp.p('<title>' || htf.escape_sc(p_title) || '</title>');

htp.p(
  '<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css">'
);

htp.p(
  '<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>'
);

htp.p(
  '<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>'
);

htp.p('<style>');

-- Base
htp.p(
  'body{font-family:Arial, sans-serif; background:#f4f6fb; margin:20px; color:#1f2937;}'
);

htp.p(
  'hr{border:none; border-top:1px solid #e5e7eb; margin:12px 0;}'
);

-- Topbar
htp.p(
  '.topbar{display:flex; align-items:center; gap:12px; background:#fff; border:1px solid #e5e7eb; border-radius:10px; padding:10px 12px; box-shadow:0 2px 10px rgba(0,0,0,.05);}'
);

htp.p(
  '.brand{font-weight:bold; color:#111827; text-decoration:none; white-space:nowrap;}'
);

htp.p('.brand:visited{color:#111827;}');

htp.p('.brand:hover{text-decoration:underline;}');

htp.p(
  '.nav-center{flex:1; display:flex; justify-content:center; gap:10px; flex-wrap:wrap;}'
);

htp.p(
  '.nav-center a{display:inline-block; padding:7px 12px; border-radius:999px; text-decoration:none; color:#1f2937; background:#f3f4f6; border:1px solid #e5e7eb;}'
);

htp.p('.nav-center a:hover{background:#e5e7eb;}');

htp.p(
  '.nav-center a.active{background:#111827; border-color:#111827; color:#fff;}'
);

htp.p(
  '.nav-center a.active:hover{background:#000; border-color:#000;}'
);

-- Tables
htp.p(
  'table{border-collapse:collapse; margin-top:8px; background:#fff;}'
);

htp.p(
  'th,td{border:1px solid #e5e7eb; padding:6px 8px; vertical-align:top;}'
);

htp.p(
  'th{background:#fff7cc; position:sticky; top:0; z-index:1;}'
);

htp.p('tr:nth-child(even) td{background:#fafafa;}');

htp.p('tr:hover td{background:#fff3bf;}');

-- Home tiles
htp.p('.home{max-width:900px; margin:30px auto;}');

htp.p('.home h3{margin:0 0 14px 0;}');

htp.p(
  '.tiles{display:flex; gap:14px; flex-wrap:wrap; justify-content:center;}'
);

htp.p(
  '.tile{display:block; width:260px; max-width:92vw; padding:16px 16px; border-radius:14px; background:#fff; border:1px solid #e5e7eb; text-decoration:none; color:#111827; box-shadow:0 2px 12px rgba(0,0,0,.06);}'
);

htp.p(
  '.tile:hover{transform:translateY(-1px); box-shadow:0 8px 20px rgba(0,0,0,.10);}'
);

htp.p('.tile:visited{color:#111827;}');

htp.p(
  '.tile .t{font-size:16px; font-weight:bold; margin-bottom:6px;}'
);

htp.p(
  '.tile .d{font-size:13px; color:#4b5563; line-height:1.35;}'
);

htp.p('</style>');

htp.p('</head><body>');

END;

PROCEDURE page_foot IS BEGIN htp.p('</body></html>');

END;

PROCEDURE menu_bar(p_active IN VARCHAR2 DEFAULT NULL) IS FUNCTION cls(p_name VARCHAR2) RETURN VARCHAR2 IS BEGIN RETURN CASE
  WHEN p_active = p_name THEN ' class="active"'
  ELSE NULL
END;

END;

BEGIN htp.p('<div class="topbar">');

htp.p(
  '<a class="brand" href="' || route('MENU') || '">' || htf.escape_sc(app_schema) || '</a>'
);

htp.p('<div class="nav-center">');

htp.p(
  htf.anchor(
    route('MENU'),
    'Menu',
    cls('MENU')
  )
);

htp.p(
  htf.anchor(
    route('SPELE_LIST'),
    'Spēles',
    cls('SPELE_LIST')
  )
);

htp.p(
  htf.anchor(
    route('SPELE_LAB'),
    'Pievienot/Labot spēli',
    cls('SPELE_LAB')
  )
);

htp.p(
  htf.anchor(
    route('REITINGI_LIST'),
    'Reitingi',
    cls('REITINGI_LIST')
  )
);

htp.p(
  htf.anchor(
    route('REITINGI_LAB'),
    'Piev/Lab reitingu',
    cls('REITINGI_LAB')
  )
);

htp.p(
  htf.anchor(
    route('TEST'),
    'Test',
    cls('TEST')
  )
);

htp.p('</div>');

htp.p('</div><hr>');

END;

PROCEDURE menu IS BEGIN page_head('Menu');

menu_bar('MENU');

htp.p('<div class="home">');

htp.p('<h3>' || htf.escape_sc(app_schema) || ' Speļu DB</h3>');

htp.p('<div class="tiles">');

htp.p(
  '<a class="tile" href="' || route('SPELE_LIST') || '">'
);

htp.p('<div class="t">Spēļu saraksts</div>');

htp.p(
  '<div class="d">Skatīt, filtrēt un pārvaldīt spēles.</div>'
);

htp.p('</a>');

htp.p(
  '<a class="tile" href="' || route('SPELE_LAB') || '">'
);

htp.p('<div class="t">Pievienot / Labot spēli</div>');

htp.p(
  '<div class="d">Forma spēles ievadei un labošanai.</div>'
);

htp.p('</a>');

htp.p(
  '<a class="tile" href="' || route('REITINGI_LIST') || '">'
);

htp.p('<div class="t">Reitingu saraksts</div>');

htp.p(
  '<div class="d">Skatīt reitingus, filtrēt pēc datuma/vērtējuma.</div>'
);

htp.p('</a>');

htp.p(
  '<a class="tile" href="' || route('REITINGI_LAB') || '">'
);

htp.p(
  '<div class="t">Pievienot / Labot reitingu</div>'
);

htp.p(
  '<div class="d">Forma reitingu ievadei un labošanai.</div>'
);

htp.p('</a>');

-- опционально: Test как плитка
htp.p(
  '<a class="tile" href="' || route('TEST') || '">'
);

htp.p('<div class="t">Test</div>');

htp.p('<div class="d">Pārbaude: package strādā.</div>');

htp.p('</a>');

htp.p('</div></div>');

page_foot;

END;

PROCEDURE test IS BEGIN page_head('Tests');

menu_bar('TEST');

htp.p('<p>OK: package strādā, URL atveras.</p>');

page_foot;

END;

PROCEDURE json_src_start IS BEGIN owa_util.mime_header('application/json', FALSE);

htp.p('Cache-Control: no-cache');

owa_util.http_header_close;

htp.p('[');

END;

PROCEDURE json_src_end IS BEGIN htp.p(']');

END;

-- JSON endpoint for autocomplete: [{"label":"PC","value":1}, ...]
PROCEDURE platforma_src(term IN VARCHAR2 DEFAULT NULL) IS v_first BOOLEAN := TRUE;

BEGIN owa_util.mime_header('application/json', FALSE);

htp.p('Cache-Control: no-cache');

owa_util.http_header_close;

htp.p('[');

FOR r IN (
  SELECT
    platforma_id,
    nosaukums
  FROM
    platforma
  WHERE
    term IS NULL
    OR lower(nosaukums) LIKE lower(term) || '%'
  ORDER BY
    nosaukums
) LOOP IF NOT v_first THEN htp.p(',');

END IF;

v_first := FALSE;

htp.p(
  '{"label":"' || replace(r.nosaukums, '"', '\"') || '","value":' || r.platforma_id || '}'
);

END LOOP;

htp.p(']');

END;

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
) IS v_nos spele.nosaukums % TYPE;

v_dat DATE;

v_cena spele.cena % TYPE;

v_sid spele.studija_id % TYPE;

v_pid spele.platforma_id % TYPE;

v_zid spele.zanrs_id % TYPE;

v_kid spele.kategorija_id % TYPE;

v_stxt studija.nosaukums % TYPE;

v_ptxt platforma.nosaukums % TYPE;

v_ztxt zanrs.nosaukums % TYPE;

v_ktxt kategorija.nosaukums % TYPE;

BEGIN -- Edit GET: ja atnāk tikai p_spele_id, ielādējam datus no DB
IF p_spele_id IS NOT NULL
AND p_nosaukums IS NULL
AND p_platforma_id IS NULL
AND p_studija_id IS NULL
AND p_zanrs_id IS NULL
AND p_kategorija_id IS NULL THEN
SELECT
  s.nosaukums,
  s.izlaides_datums,
  s.cena,
  s.studija_id,
  st.nosaukums,
  s.platforma_id,
  p.nosaukums,
  s.zanrs_id,
  z.nosaukums,
  s.kategorija_id,
  k.nosaukums INTO v_nos,
  v_dat,
  v_cena,
  v_sid,
  v_stxt,
  v_pid,
  v_ptxt,
  v_zid,
  v_ztxt,
  v_kid,
  v_ktxt
FROM
  spele s
  JOIN studija st ON st.studija_id = s.studija_id
  JOIN platforma p ON p.platforma_id = s.platforma_id
  JOIN zanrs z ON z.zanrs_id = s.zanrs_id
  JOIN kategorija k ON k.kategorija_id = s.kategorija_id
WHERE
  s.spele_id = p_spele_id;

ELSE -- Pēc submit ar kļūdu: ņemam no parametriem
v_nos := p_nosaukums;

IF p_izlaides_datums IS NOT NULL THEN BEGIN v_dat := to_date(p_izlaides_datums, 'DD.MM.YYYY');

EXCEPTION
WHEN OTHERS THEN v_dat := NULL;

END;

END IF;

IF trim(p_cena) IS NOT NULL THEN BEGIN v_cena := to_number(replace(trim(p_cena), ',', '.'));

EXCEPTION
WHEN OTHERS THEN v_cena := NULL;

END;

END IF;

v_sid := p_studija_id;

v_stxt := p_studija_txt;

v_pid := p_platforma_id;

v_ptxt := p_platforma_txt;

v_zid := p_zanrs_id;

v_ztxt := p_zanrs_txt;

v_kid := p_kategorija_id;

v_ktxt := p_kategorija_txt;

END IF;

page_head('Spēļu labošana');

menu_bar('SPELE_LAB');

IF p_err IS NOT NULL THEN htp.p(
  '<p style="color:#b00020;"><b>Kļūda:</b> ' || htf.escape_sc(p_err) || '</p>'
);

END IF;

htp.p('<h3>Spēle</h3>');

htp.formOpen(route('SPELE_SAVE'), 'post');

htp.formHidden('p_spele_id', nvl(to_char(p_spele_id), ''));

htp.p('<p><label>Nosaukums:</label>');

htp.p(
  '<input type="text" name="p_nosaukums" size="50" value="' || htf.escape_sc(nvl(v_nos, '')) || '"></p>'
);

htp.p('<p><label>Izlaides datums:</label>');

htp.p(
  '<input type="text" name="p_izlaides_datums" id="p_izlaides_datums" size="12" value="' || htf.escape_sc(
    nvl(
      to_char(v_dat, 'DD.MM.YYYY'),
      nvl(p_izlaides_datums, '')
    )
  ) || '" placeholder="DD.MM.YYYY"></p>'
);

htp.p('<p><label>Cena:</label>');

htp.p(
  '<input type="text" name="p_cena" size="10" value="' || htf.escape_sc(nvl(to_char(v_cena), nvl(p_cena, ''))) || '" placeholder="59.99"></p>'
);

-- studija
htp.formHidden('p_studija_id', nvl(to_char(v_sid), ''));

htp.p('<p><label>Studija:</label>');

htp.p(
  '<input type="text" name="p_studija_txt" id="p_studija_txt" size="30" value="' || htf.escape_sc(nvl(v_stxt, '')) || '"></p>'
);

-- platforma
htp.formHidden('p_platforma_id', nvl(to_char(v_pid), ''));

htp.p('<p><label>Platforma:</label>');

htp.p(
  '<input type="text" name="p_platforma_txt" id="p_platforma_txt" size="30" value="' || htf.escape_sc(nvl(v_ptxt, '')) || '"></p>'
);

-- zanrs
htp.formHidden('p_zanrs_id', nvl(to_char(v_zid), ''));

htp.p('<p><label>Žanrs:</label>');

htp.p(
  '<input type="text" name="p_zanrs_txt" id="p_zanrs_txt" size="30" value="' || htf.escape_sc(nvl(v_ztxt, '')) || '"></p>'
);

-- kategorija
htp.formHidden('p_kategorija_id', nvl(to_char(v_kid), ''));

htp.p('<p><label>Kategorija:</label>');

htp.p(
  '<input type="text" name="p_kategorija_txt" id="p_kategorija_txt" size="30" value="' || htf.escape_sc(nvl(v_ktxt, '')) || '"></p>'
);

htp.p(
  q '[
<script>
$(function(){
  $("#p_izlaides_datums").datepicker({ dateFormat: "dd.mm.yy" });

  function bind_ac(txtId, hiddenName, srcUrl){
    $(txtId).autocomplete({
      source: srcUrl,
      minLength: 0,
      select: function(event, ui){
        $(txtId).val(ui.item.label);
        $("input[name="+hiddenName+"]").val(ui.item.value);
        return false;
      }
    }).focus(function(){ $(this).autocomplete("search",""); })
      .on("change", function(){ $("input[name="+hiddenName+"]").val(""); });
  }

  bind_ac("#p_platforma_txt",  "p_platforma_id",  "]' || route('PLATFORMA_SRC') || q'[");
  bind_ac("#p_studija_txt",    "p_studija_id",    "]' || route('STUDIJA_SRC') || q'[");
  bind_ac("#p_zanrs_txt",      "p_zanrs_id",      "]' || route('ZANRS_SRC') || q'[");
  bind_ac("#p_kategorija_txt", "p_kategorija_id", "]' || route('KATEGORIJA_SRC') || q'[");
});
</script>
]'
);

htp.formSubmit(NULL, 'Saglabāt');

htp.formClose;

page_foot;

END;

--SAVE TUT
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
) IS v_err VARCHAR2(4000);

v_dat DATE;

v_cena NUMBER;

BEGIN IF trim(p_nosaukums) IS NULL THEN v_err := 'Nosaukums ir obligāts.';

END IF;

IF v_err IS NULL THEN BEGIN v_dat := to_date(p_izlaides_datums, 'DD.MM.YYYY');

EXCEPTION
WHEN OTHERS THEN v_err := 'Nederīgs datums (DD.MM.YYYY).';

END;

END IF;

IF v_err IS NULL
AND p_studija_id IS NULL THEN v_err := 'Izvēlies studiju no saraksta.';

END IF;

IF v_err IS NULL
AND p_platforma_id IS NULL THEN v_err := 'Izvēlies platformu no saraksta.';

END IF;

IF v_err IS NULL
AND p_zanrs_id IS NULL THEN v_err := 'Izvēlies žanru no saraksta.';

END IF;

IF v_err IS NULL
AND p_kategorija_id IS NULL THEN v_err := 'Izvēlies kategoriju no saraksta.';

END IF;

IF v_err IS NULL
AND trim(p_cena) IS NOT NULL THEN BEGIN v_cena := to_number(replace(trim(p_cena), ',', '.'));

IF v_cena < 0 THEN v_err := 'Cena nevar būt negatīva.';

END IF;

EXCEPTION
WHEN OTHERS THEN v_err := 'Nederīga cena (piem. 59.99).';

END;

END IF;

IF v_err IS NOT NULL THEN spele_lab(
  p_spele_id => p_spele_id,
  p_nosaukums => p_nosaukums,
  p_izlaides_datums => p_izlaides_datums,
  p_cena => p_cena,
  p_studija_id => p_studija_id,
  p_studija_txt => p_studija_txt,
  p_platforma_id => p_platforma_id,
  p_platforma_txt => p_platforma_txt,
  p_zanrs_id => p_zanrs_id,
  p_zanrs_txt => p_zanrs_txt,
  p_kategorija_id => p_kategorija_id,
  p_kategorija_txt => p_kategorija_txt,
  p_err => v_err
);

RETURN;

END IF;

IF p_spele_id IS NULL THEN
INSERT INTO
  spele (
    nosaukums,
    izlaides_datums,
    cena,
    studija_id,
    platforma_id,
    zanrs_id,
    kategorija_id
  )
VALUES
  (
    p_nosaukums,
    v_dat,
    v_cena,
    p_studija_id,
    p_platforma_id,
    p_zanrs_id,
    p_kategorija_id
  );

ELSE
UPDATE
  spele
SET
  nosaukums = p_nosaukums,
  izlaides_datums = v_dat,
  cena = v_cena,
  studija_id = p_studija_id,
  platforma_id = p_platforma_id,
  zanrs_id = p_zanrs_id,
  kategorija_id = p_kategorija_id
WHERE
  spele_id = p_spele_id;

END IF;

COMMIT;

page_head('Saglabāts');

menu_bar;

htp.p('<p style="color:green;"><b>Saglabāts!</b></p>');

htp.p(
  '<p>' || htf.anchor(
    route('SPELE_LIST'),
    'Uz spēļu sarakstu'
  ) || '</p>'
);

page_foot;

END;

PROCEDURE studija_src(term IN VARCHAR2 DEFAULT NULL) IS v_first BOOLEAN := TRUE;

BEGIN owa_util.mime_header('application/json', FALSE);

htp.p('Cache-Control: no-cache');

owa_util.http_header_close;

htp.p('[');

FOR r IN (
  SELECT
    studija_id,
    nosaukums
  FROM
    studija
  WHERE
    term IS NULL
    OR lower(nosaukums) LIKE lower(term) || '%'
  ORDER BY
    nosaukums
) LOOP IF NOT v_first THEN htp.p(',');

END IF;

v_first := FALSE;

htp.p(
  '{"label":"' || replace(r.nosaukums, '"', '\"') || '","value":' || r.studija_id || '}'
);

END LOOP;

htp.p(']');

END;

PROCEDURE zanrs_src(term IN VARCHAR2 DEFAULT NULL) IS v_first BOOLEAN := TRUE;

BEGIN owa_util.mime_header('application/json', FALSE);

htp.p('Cache-Control: no-cache');

owa_util.http_header_close;

htp.p('[');

FOR r IN (
  SELECT
    zanrs_id,
    nosaukums
  FROM
    zanrs
  WHERE
    term IS NULL
    OR lower(nosaukums) LIKE lower(term) || '%'
  ORDER BY
    nosaukums
) LOOP IF NOT v_first THEN htp.p(',');

END IF;

v_first := FALSE;

htp.p(
  '{"label":"' || replace(r.nosaukums, '"', '\"') || '","value":' || r.zanrs_id || '}'
);

END LOOP;

htp.p(']');

END;

PROCEDURE kategorija_src(term IN VARCHAR2 DEFAULT NULL) IS v_first BOOLEAN := TRUE;

BEGIN owa_util.mime_header('application/json', FALSE);

htp.p('Cache-Control: no-cache');

owa_util.http_header_close;

htp.p('[');

FOR r IN (
  SELECT
    kategorija_id,
    nosaukums
  FROM
    kategorija
  WHERE
    term IS NULL
    OR lower(nosaukums) LIKE lower(term) || '%'
  ORDER BY
    nosaukums
) LOOP IF NOT v_first THEN htp.p(',');

END IF;

v_first := FALSE;

htp.p(
  '{"label":"' || replace(r.nosaukums, '"', '\"') || '","value":' || r.kategorija_id || '}'
);

END LOOP;

htp.p(']');

END;

PROCEDURE spele_list(
  p_q IN VARCHAR2 DEFAULT NULL,
  p_platforma_id_txt IN VARCHAR2 DEFAULT NULL,
  p_sort IN VARCHAR2 DEFAULT NULL,
  p_dir IN VARCHAR2 DEFAULT NULL
) IS v_platforma_id NUMBER;

v_dir VARCHAR2(4) := lower(nvl(p_dir, 'desc'));

v_sort VARCHAR2(10) := lower(nvl(p_sort, 'id'));

BEGIN IF v_dir NOT IN ('asc', 'desc') THEN v_dir := 'desc';

END IF;

IF v_sort NOT IN ('id', 'name', 'rating', 'count', 'date', 'price') THEN v_sort := 'id';

END IF;

-- страховка platforma_id
IF trim(p_platforma_id_txt) IS NOT NULL THEN BEGIN v_platforma_id := to_number(trim(p_platforma_id_txt));

EXCEPTION
WHEN OTHERS THEN v_platforma_id := NULL;

END;

END IF;

page_head('Spēļu saraksts');

menu_bar('SPELE_LIST');

htp.p('<h3>Spēles</h3>');

-- filter form (GET)
htp.formOpen(route('SPELE_LIST'), 'get');

htp.p('<p>');

htp.p('<label>Meklēt nosaukumā:</label>');

htp.p(
  '<input type="text" name="p_q" size="25" value="' || htf.escape_sc(nvl(p_q, '')) || '"> '
);

htp.p('<label>Platforma:</label>');

htp.p('<select name="p_platforma_id_txt">');

htp.p(
  '<option value="" ' || CASE
    WHEN v_platforma_id IS NULL THEN 'selected'
  END || '>--- visas ---</option>'
);

FOR pl IN (
  SELECT
    platforma_id,
    nosaukums
  FROM
    platforma
  ORDER BY
    nosaukums
) LOOP htp.p(
  '<option value="' || pl.platforma_id || '" ' || CASE
    WHEN v_platforma_id = pl.platforma_id THEN 'selected'
  END || '>' || htf.escape_sc(pl.nosaukums) || '</option>'
);

END LOOP;

htp.p('</select> ');

-- sort controls
htp.p('<label>Sort:</label>');

htp.p('<select name="p_sort">');

htp.p(
  '<option value="id" ' ||CASE
    WHEN v_sort = 'id' THEN 'selected'
  END || '>ID</option>'
);

htp.p(
  '<option value="name" ' ||CASE
    WHEN v_sort = 'name' THEN 'selected'
  END || '>Nosaukums</option>'
);

htp.p(
  '<option value="rating" ' ||CASE
    WHEN v_sort = 'rating' THEN 'selected'
  END || '>Vidējais</option>'
);

htp.p(
  '<option value="count" ' ||CASE
    WHEN v_sort = 'count' THEN 'selected'
  END || '>Reitingi</option>'
);

htp.p(
  '<option value="date" ' ||CASE
    WHEN v_sort = 'date' THEN 'selected'
  END || '>Datums</option>'
);

htp.p(
  '<option value="price" ' ||CASE
    WHEN v_sort = 'price' THEN 'selected'
  END || '>Cena</option>'
);

htp.p('</select> ');

htp.p('<select name="p_dir">');

htp.p(
  '<option value="desc" ' ||CASE
    WHEN v_dir = 'desc' THEN 'selected'
  END || '>DESC</option>'
);

htp.p(
  '<option value="asc" ' ||CASE
    WHEN v_dir = 'asc' THEN 'selected'
  END || '>ASC</option>'
);

htp.p('</select> ');

htp.formSubmit(NULL, 'Filtrēt');

htp.p(
  ' ' || htf.anchor(route('SPELE_LIST'), 'Notīrīt')
);

htp.p('</p>');

htp.formClose;

htp.p(
  '<p>' || htf.anchor(
    route('SPELE_LAB'),
    '+ Pievienot jaunu'
  ) || '</p>'
);

htp.p('<table>');

htp.p(
  '<tr><th>ID</th><th>Nosaukums</th><th>Platforma</th><th>Studija</th><th>Žanrs</th><th>Kategorija</th><th>Datums</th><th>Cena</th><th>Reitingi</th><th>Vidējais</th><th>Darbības</th></tr>'
);

FOR r IN (
  SELECT
    s.spele_id,
    s.nosaukums,
    to_char(s.izlaides_datums, 'DD.MM.YYYY') AS izlaides_datums,
    s.izlaides_datums AS izlaides_datums_raw,
    s.cena,
    p.nosaukums AS platforma,
    st.nosaukums AS studija,
    z.nosaukums AS zanrs,
    k.nosaukums AS kategorija,
    COUNT(rtg.reitinga_id) AS reitingu_sk,
    ROUND(AVG(rtg.vertejums), 2) AS videjais
  FROM
    spele s
    JOIN platforma p ON p.platforma_id = s.platforma_id
    JOIN studija st ON st.studija_id = s.studija_id
    JOIN zanrs z ON z.zanrs_id = s.zanrs_id
    JOIN kategorija k ON k.kategorija_id = s.kategorija_id
    LEFT JOIN reitingi rtg ON rtg.spele_id = s.spele_id
  WHERE
    (
      p_q IS NULL
      OR lower(s.nosaukums) LIKE '%' || lower(p_q) || '%'
    )
    AND (
      v_platforma_id IS NULL
      OR s.platforma_id = v_platforma_id
    )
  GROUP BY
    s.spele_id,
    s.nosaukums,
    s.izlaides_datums,
    s.cena,
    p.nosaukums,
    st.nosaukums,
    z.nosaukums,
    k.nosaukums
  ORDER BY
    CASE
      WHEN v_sort = 'id'
      AND v_dir = 'asc' THEN s.spele_id
    END ASC,
    CASE
      WHEN v_sort = 'id'
      AND v_dir = 'desc' THEN s.spele_id
    END DESC,
    CASE
      WHEN v_sort = 'name'
      AND v_dir = 'asc' THEN lower(s.nosaukums)
    END ASC,
    CASE
      WHEN v_sort = 'name'
      AND v_dir = 'desc' THEN lower(s.nosaukums)
    END DESC,
    CASE
      WHEN v_sort = 'rating'
      AND v_dir = 'asc' THEN AVG(rtg.vertejums)
    END ASC NULLS LAST,
    CASE
      WHEN v_sort = 'rating'
      AND v_dir = 'desc' THEN AVG(rtg.vertejums)
    END DESC NULLS LAST,
    CASE
      WHEN v_sort = 'count'
      AND v_dir = 'asc' THEN COUNT(rtg.reitinga_id)
    END ASC,
    CASE
      WHEN v_sort = 'count'
      AND v_dir = 'desc' THEN COUNT(rtg.reitinga_id)
    END DESC,
    CASE
      WHEN v_sort = 'date'
      AND v_dir = 'asc' THEN s.izlaides_datums
    END ASC NULLS LAST,
    CASE
      WHEN v_sort = 'date'
      AND v_dir = 'desc' THEN s.izlaides_datums
    END DESC NULLS LAST,
    CASE
      WHEN v_sort = 'price'
      AND v_dir = 'asc' THEN s.cena
    END ASC NULLS LAST,
    CASE
      WHEN v_sort = 'price'
      AND v_dir = 'desc' THEN s.cena
    END DESC NULLS LAST
) LOOP htp.p('<tr>');

htp.p('<td>' || r.spele_id || '</td>');

htp.p('<td>' || htf.escape_sc(r.nosaukums) || '</td>');

htp.p('<td>' || htf.escape_sc(r.platforma) || '</td>');

htp.p('<td>' || htf.escape_sc(r.studija) || '</td>');

htp.p('<td>' || htf.escape_sc(r.zanrs) || '</td>');

htp.p('<td>' || htf.escape_sc(r.kategorija) || '</td>');

htp.p('<td>' || r.izlaides_datums || '</td>');

htp.p(
  '<td>' ||CASE
    WHEN r.cena IS NULL THEN ''
    ELSE to_char(r.cena, 'FM9999990D00')
  END || '</td>'
);

htp.p('<td>' || r.reitingu_sk || '</td>');

htp.p(
  '<td>' || CASE
    WHEN r.videjais IS NULL THEN ''
    ELSE to_char(r.videjais, 'FM990D00')
  END || '</td>'
);

htp.p(
  '<td>' || htf.anchor(
    route('SPELE_LAB', '?p_spele_id=' || r.spele_id),
    'Labot'
  ) || ' ' || htf.anchor(
    route('SPELE_DEL_ASK', '?p_spele_id=' || r.spele_id),
    'Dzēst'
  ) || '</td>'
);

htp.p('</tr>');

END LOOP;

htp.p('</table>');

page_foot;

END;

PROCEDURE spele_del_ask(p_spele_id IN NUMBER) IS v_name spele.nosaukums % TYPE;

BEGIN
SELECT
  nosaukums INTO v_name
FROM
  spele
WHERE
  spele_id = p_spele_id;

page_head('Dzēst?');

menu_bar('SPELE_LIST');

htp.p('<h3>Dzēst spēli</h3>');

htp.p(
  '<p>Vai tiešām dzēst: <b>' || htf.escape_sc(v_name) || '</b> (ID=' || p_spele_id || ')?</p>'
);

htp.p(
  '<p>' || htf.anchor(
    route('SPELE_DEL_DO', '?p_spele_id=' || p_spele_id),
    'Jā, dzēst'
  ) || ' | ' || htf.anchor(route('SPELE_LIST'), 'Atcelt') || '</p>'
);

htp.p(
  '<p><i>Piezīme: reitingi tiks dzēsti automātiski (ON DELETE CASCADE).</i></p>'
);

page_foot;

EXCEPTION
WHEN NO_DATA_FOUND THEN page_head('Nav atrasts');

menu_bar;

htp.p(
  '<p class="err">Spēle ar ID=' || p_spele_id || ' nav atrasta.</p>'
);

htp.p(
  '<p>' || htf.anchor(
    route('SPELE_LIST'),
    'Atpakaļ uz sarakstu'
  ) || '</p>'
);

page_foot;

END;

PROCEDURE spele_del_do(p_spele_id IN NUMBER) IS BEGIN
DELETE FROM
  spele
WHERE
  spele_id = p_spele_id;

COMMIT;

page_head('Dzēsts');

menu_bar;

htp.p(
  '<p class="ok"><b>Dzēsts!</b> ID=' || p_spele_id || '</p>'
);

htp.p(
  '<p>' || htf.anchor(
    route('SPELE_LIST'),
    'Atpakaļ uz sarakstu'
  ) || '</p>'
);

page_foot;

END;

PROCEDURE spele_src(term IN VARCHAR2 DEFAULT NULL) IS v_first BOOLEAN := TRUE;

BEGIN json_src_start;

FOR r IN (
  SELECT
    s.spele_id,
    s.nosaukums || ' (' || p.nosaukums || ')' AS label
  FROM
    spele s
    JOIN platforma p ON p.platforma_id = s.platforma_id
  WHERE
    term IS NULL
    OR lower(s.nosaukums) LIKE lower(term) || '%'
  ORDER BY
    s.nosaukums,
    p.nosaukums
) LOOP IF NOT v_first THEN htp.p(',');

END IF;

v_first := FALSE;

htp.p(
  '{"label":"' || replace(r.label, '"', '\"') || '","value":' || r.spele_id || '}'
);

END LOOP;

json_src_end;

END;

PROCEDURE reitingi_list(
  p_spele_id_txt IN VARCHAR2 DEFAULT NULL,
  p_spele_txt IN VARCHAR2 DEFAULT NULL,
  p_v_min_txt IN VARCHAR2 DEFAULT NULL,
  p_v_max_txt IN VARCHAR2 DEFAULT NULL,
  p_date_from IN VARCHAR2 DEFAULT NULL,
  p_date_to IN VARCHAR2 DEFAULT NULL,
  p_sort IN VARCHAR2 DEFAULT NULL,
  -- id/game/score/date
  p_dir IN VARCHAR2 DEFAULT NULL -- asc/desc
) IS v_spele_id NUMBER;

v_v_min NUMBER;

v_v_max NUMBER;

v_d_from DATE;

v_d_to DATE;

v_dir VARCHAR2(4) := lower(nvl(p_dir, 'desc'));

v_sort VARCHAR2(10) := lower(nvl(p_sort, 'id'));

BEGIN IF v_dir NOT IN ('asc', 'desc') THEN v_dir := 'desc';

END IF;

IF v_sort NOT IN ('id', 'game', 'score', 'date') THEN v_sort := 'id';

END IF;

-- страховки конвертации
IF trim(p_spele_id_txt) IS NOT NULL THEN BEGIN v_spele_id := to_number(trim(p_spele_id_txt));

EXCEPTION
WHEN OTHERS THEN v_spele_id := NULL;

END;

END IF;

IF trim(p_v_min_txt) IS NOT NULL THEN BEGIN v_v_min := to_number(trim(p_v_min_txt));

EXCEPTION
WHEN OTHERS THEN v_v_min := NULL;

END;

END IF;

IF trim(p_v_max_txt) IS NOT NULL THEN BEGIN v_v_max := to_number(trim(p_v_max_txt));

EXCEPTION
WHEN OTHERS THEN v_v_max := NULL;

END;

END IF;

IF trim(p_date_from) IS NOT NULL THEN BEGIN v_d_from := to_date(trim(p_date_from), 'DD.MM.YYYY');

EXCEPTION
WHEN OTHERS THEN v_d_from := NULL;

END;

END IF;

IF trim(p_date_to) IS NOT NULL THEN BEGIN v_d_to := to_date(trim(p_date_to), 'DD.MM.YYYY');

EXCEPTION
WHEN OTHERS THEN v_d_to := NULL;

END;

END IF;

page_head('Reitingi');

menu_bar('REITINGI_LIST');

htp.p('<h3>Reitingi</h3>');

-- filter form (GET)
htp.formOpen(route('REITINGI_LIST'), 'get');

htp.p('<p>');

-- game autocomplete: hidden id + visible text
htp.p('<label>Spēle:</label>');

htp.p(
  '<input type="hidden" name="p_spele_id_txt" value="' || htf.escape_sc(nvl(p_spele_id_txt, '')) || '">'
);

htp.p(
  '<input type="text" name="p_spele_txt" id="p_spele_txt" size="35" value="' || htf.escape_sc(nvl(p_spele_txt, '')) || '"> '
);

htp.p('<label>Vērtējums no:</label>');

htp.p(
  '<input type="text" name="p_v_min_txt" size="3" value="' || htf.escape_sc(nvl(p_v_min_txt, '')) || '"> '
);

htp.p('<label>līdz:</label>');

htp.p(
  '<input type="text" name="p_v_max_txt" size="3" value="' || htf.escape_sc(nvl(p_v_max_txt, '')) || '"> '
);

htp.p('<label>Datums no:</label>');

htp.p(
  '<input type="text" name="p_date_from" id="p_date_from" size="10" value="' || htf.escape_sc(nvl(p_date_from, '')) || '" placeholder="DD.MM.YYYY"> '
);

htp.p('<label>līdz:</label>');

htp.p(
  '<input type="text" name="p_date_to" id="p_date_to" size="10" value="' || htf.escape_sc(nvl(p_date_to, '')) || '" placeholder="DD.MM.YYYY"> '
);

-- sort controls
htp.p('<label>Sort:</label>');

htp.p('<select name="p_sort">');

htp.p(
  '<option value="id" ' ||CASE
    WHEN v_sort = 'id' THEN 'selected'
  END || '>ID</option>'
);

htp.p(
  '<option value="game" ' ||CASE
    WHEN v_sort = 'game' THEN 'selected'
  END || '>Spēle</option>'
);

htp.p(
  '<option value="score" ' ||CASE
    WHEN v_sort = 'score' THEN 'selected'
  END || '>Vērtējums</option>'
);

htp.p(
  '<option value="date" ' ||CASE
    WHEN v_sort = 'date' THEN 'selected'
  END || '>Datums</option>'
);

htp.p('</select> ');

htp.p('<select name="p_dir">');

htp.p(
  '<option value="desc" ' ||CASE
    WHEN v_dir = 'desc' THEN 'selected'
  END || '>DESC</option>'
);

htp.p(
  '<option value="asc" ' ||CASE
    WHEN v_dir = 'asc' THEN 'selected'
  END || '>ASC</option>'
);

htp.p('</select> ');

htp.formSubmit(NULL, 'Filtrēt');

htp.p(
  ' ' || htf.anchor(route('REITINGI_LIST'), 'Notīrīt')
);

htp.p('</p>');

htp.formClose;

-- JS: datepicker + autocomplete
htp.p(
  q '[
<script>
$(function(){
  $("#p_date_from").datepicker({ dateFormat: "dd.mm.yy" });
  $("#p_date_to").datepicker({ dateFormat: "dd.mm.yy" });

  $("#p_spele_txt").autocomplete({
    source: "]' || route('SPELE_SRC') || q'[",
    minLength: 0,
    select: function(event, ui){
      $("#p_spele_txt").val(ui.item.label);
      $("input[name=p_spele_id_txt]").val(ui.item.value);
      return false;
    }
  }).focus(function(){ $(this).autocomplete("search",""); })
    .on("change", function(){
      $("input[name=p_spele_id_txt]").val("");
    });
});
</script>
]'
);

htp.p(
  '<p>' || htf.anchor(
    route('REITINGI_LAB'),
    '+ Pievienot reitingu'
  ) || '</p>'
);

htp.p('<table>');

htp.p(
  '<tr><th>ID</th><th>Spēle</th><th>Vērtējums</th><th>Datums</th><th>Komentārs</th><th>Darbības</th></tr>'
);

FOR r IN (
  SELECT
    r.reitinga_id,
    r.vertejums,
    r.reitinga_datums,
    to_char(r.reitinga_datums, 'DD.MM.YYYY') AS reitinga_datums_txt,
    r.komentars,
    s.nosaukums,
    p.nosaukums AS platforma,
    s.nosaukums || ' (' || p.nosaukums || ')' AS spele_label
  FROM
    reitingi r
    JOIN spele s ON s.spele_id = r.spele_id
    JOIN platforma p ON p.platforma_id = s.platforma_id
  WHERE
    (
      v_spele_id IS NULL
      OR r.spele_id = v_spele_id
    )
    AND (
      v_v_min IS NULL
      OR r.vertejums >= v_v_min
    )
    AND (
      v_v_max IS NULL
      OR r.vertejums <= v_v_max
    )
    AND (
      v_d_from IS NULL
      OR r.reitinga_datums >= v_d_from
    )
    AND (
      v_d_to IS NULL
      OR r.reitinga_datums <= v_d_to
    )
  ORDER BY
    CASE
      WHEN v_sort = 'id'
      AND v_dir = 'asc' THEN r.reitinga_id
    END ASC,
    CASE
      WHEN v_sort = 'id'
      AND v_dir = 'desc' THEN r.reitinga_id
    END DESC,
    CASE
      WHEN v_sort = 'score'
      AND v_dir = 'asc' THEN r.vertejums
    END ASC,
    CASE
      WHEN v_sort = 'score'
      AND v_dir = 'desc' THEN r.vertejums
    END DESC,
    CASE
      WHEN v_sort = 'date'
      AND v_dir = 'asc' THEN r.reitinga_datums
    END ASC NULLS LAST,
    CASE
      WHEN v_sort = 'date'
      AND v_dir = 'desc' THEN r.reitinga_datums
    END DESC NULLS LAST,
    CASE
      WHEN v_sort = 'game'
      AND v_dir = 'asc' THEN lower(s.nosaukums)
    END ASC,
    CASE
      WHEN v_sort = 'game'
      AND v_dir = 'desc' THEN lower(s.nosaukums)
    END DESC,
    r.reitinga_id DESC
) LOOP htp.p('<tr>');

htp.p('<td>' || r.reitinga_id || '</td>');

htp.p('<td>' || htf.escape_sc(r.spele_label) || '</td>');

htp.p('<td>' || r.vertejums || '</td>');

htp.p('<td>' || r.reitinga_datums_txt || '</td>');

htp.p(
  '<td>' || htf.escape_sc(nvl(r.komentars, '')) || '</td>'
);

htp.p(
  '<td>' || htf.anchor(
    route('REITINGI_LAB', '?p_reitinga_id=' || r.reitinga_id),
    'Labot'
  ) || ' ' || htf.anchor(
    route('REITINGI_DEL_ASK', '?p_reitinga_id=' || r.reitinga_id),
    'Dzēst'
  ) || '</td>'
);

htp.p('</tr>');

END LOOP;

htp.p('</table>');

page_foot;

END;

PROCEDURE reitingi_lab(
  p_reitinga_id IN NUMBER DEFAULT NULL,
  p_spele_id IN NUMBER DEFAULT NULL,
  p_spele_txt IN VARCHAR2 DEFAULT NULL,
  p_vertejums IN VARCHAR2 DEFAULT NULL,
  p_reitinga_datums IN VARCHAR2 DEFAULT NULL,
  p_komentars IN VARCHAR2 DEFAULT NULL,
  p_err IN VARCHAR2 DEFAULT NULL
) IS v_spele_id reitingi.spele_id % TYPE;

v_label VARCHAR2(300);

v_v reitingi.vertejums % TYPE;

v_d DATE;

v_k reitingi.komentars % TYPE;

BEGIN -- edit GET: load from DB if only id provided
IF p_reitinga_id IS NOT NULL
AND p_spele_id IS NULL
AND p_vertejums IS NULL THEN
SELECT
  r.spele_id,
  s.nosaukums || ' (' || p.nosaukums || ')',
  r.vertejums,
  r.reitinga_datums,
  r.komentars INTO v_spele_id,
  v_label,
  v_v,
  v_d,
  v_k
FROM
  reitingi r
  JOIN spele s ON s.spele_id = r.spele_id
  JOIN platforma p ON p.platforma_id = s.platforma_id
WHERE
  r.reitinga_id = p_reitinga_id;

ELSE v_spele_id := p_spele_id;

v_label := p_spele_txt;

IF trim(p_vertejums) IS NOT NULL THEN BEGIN v_v := to_number(trim(p_vertejums));

EXCEPTION
WHEN OTHERS THEN v_v := NULL;

END;

END IF;

IF p_reitinga_datums IS NOT NULL THEN BEGIN v_d := to_date(p_reitinga_datums, 'DD.MM.YYYY');

EXCEPTION
WHEN OTHERS THEN v_d := NULL;

END;

END IF;

v_k := p_komentars;

END IF;

page_head('Reitingu labošana');

menu_bar('REITINGI_LAB');

IF p_err IS NOT NULL THEN htp.p(
  '<p class="err"><b>Kļūda:</b> ' || htf.escape_sc(p_err) || '</p>'
);

END IF;

htp.p('<h3>Reitings</h3>');

htp.formOpen(route('REITINGI_SAVE'), 'post');

htp.formHidden('p_reitinga_id', nvl(to_char(p_reitinga_id), ''));

htp.formHidden('p_spele_id', nvl(to_char(v_spele_id), ''));

htp.p('<p><label>Spēle:</label>');

htp.p(
  '<input type="text" name="p_spele_txt" id="p_spele_txt" size="50" value="' || htf.escape_sc(nvl(v_label, '')) || '"></p>'
);

htp.p('<p><label>Vērtējums (1-10):</label>');

htp.p(
  '<input type="text" name="p_vertejums" size="5" value="' || htf.escape_sc(nvl(to_char(v_v), nvl(p_vertejums, ''))) || '"></p>'
);

htp.p('<p><label>Datums:</label>');

htp.p(
  '<input type="text" name="p_reitinga_datums" id="p_reitinga_datums" size="12" value="' || htf.escape_sc(
    nvl(to_char(v_d, 'DD.MM.YYYY'), p_reitinga_datums)
  ) || '" placeholder="DD.MM.YYYY"></p>'
);

htp.p('<p><label>Komentārs:</label>');

htp.p(
  '<input type="text" name="p_komentars" size="60" value="' || htf.escape_sc(nvl(v_k, '')) || '"></p>'
);

htp.p(
  q '[
<script>
$(function(){
  $("#p_reitinga_datums").datepicker({ dateFormat: "dd.mm.yy" });

  $("#p_spele_txt").autocomplete({
    source: "]' || route('SPELE_SRC') || q'[",
    minLength: 0,
    select: function(event, ui){
      $("#p_spele_txt").val(ui.item.label);
      $("input[name=p_spele_id]").val(ui.item.value);
      return false;
    }
  }).focus(function(){ $(this).autocomplete("search",""); })
    .on("change", function(){ $("input[name=p_spele_id]").val(""); });
});
</script>
]'
);

htp.formSubmit(NULL, 'Saglabāt');

htp.formClose;

page_foot;

END;

PROCEDURE reitingi_save(
  p_reitinga_id IN NUMBER DEFAULT NULL,
  p_spele_id IN NUMBER DEFAULT NULL,
  p_spele_txt IN VARCHAR2 DEFAULT NULL,
  p_vertejums IN VARCHAR2 DEFAULT NULL,
  p_reitinga_datums IN VARCHAR2 DEFAULT NULL,
  p_komentars IN VARCHAR2 DEFAULT NULL
) IS v_err VARCHAR2(4000);

v_v NUMBER;

v_d DATE;

BEGIN IF p_spele_id IS NULL THEN v_err := 'Izvēlies spēli no saraksta.';

END IF;

IF v_err IS NULL THEN BEGIN v_v := to_number(trim(p_vertejums));

IF v_v < 1
OR v_v > 10 THEN v_err := 'Vērtējumam jābūt 1..10.';

END IF;

EXCEPTION
WHEN OTHERS THEN v_err := 'Nederīgs vērtējums (ievadi skaitli 1..10).';

END;

END IF;

IF v_err IS NULL THEN BEGIN v_d := to_date(p_reitinga_datums, 'DD.MM.YYYY');

EXCEPTION
WHEN OTHERS THEN v_err := 'Nederīgs datums (DD.MM.YYYY).';

END;

END IF;

IF v_err IS NOT NULL THEN reitingi_lab(
  p_reitinga_id => p_reitinga_id,
  p_spele_id => p_spele_id,
  p_spele_txt => p_spele_txt,
  p_vertejums => p_vertejums,
  p_reitinga_datums => p_reitinga_datums,
  p_komentars => p_komentars,
  p_err => v_err
);

RETURN;

END IF;

IF p_reitinga_id IS NULL THEN
INSERT INTO
  reitingi(spele_id, vertejums, reitinga_datums, komentars)
VALUES
  (p_spele_id, v_v, v_d, p_komentars);

ELSE
UPDATE
  reitingi
SET
  spele_id = p_spele_id,
  vertejums = v_v,
  reitinga_datums = v_d,
  komentars = p_komentars
WHERE
  reitinga_id = p_reitinga_id;

END IF;

COMMIT;

page_head('Saglabāts');

menu_bar('REITINGI_LIST');

-- или 'SPELE_LAB', но логичнее список
htp.p('<p class="ok"><b>Saglabāts!</b></p>');

htp.p(
  '<p>' || htf.anchor(
    route('REITINGI_LIST'),
    'Uz reitingu sarakstu'
  ) || '</p>'
);

page_foot;

END;

PROCEDURE reitingi_del_ask(p_reitinga_id IN NUMBER) IS v_label VARCHAR2(300);

BEGIN
SELECT
  s.nosaukums || ' (' || p.nosaukums || ')' INTO v_label
FROM
  reitingi r
  JOIN spele s ON s.spele_id = r.spele_id
  JOIN platforma p ON p.platforma_id = s.platforma_id
WHERE
  r.reitinga_id = p_reitinga_id;

page_head('Dzēst reitingu?');

menu_bar;

htp.p('<h3>Dzēst reitingu</h3>');

htp.p(
  '<p>Dzēst reitingu ID=' || p_reitinga_id || ' spēlei: <b>' || htf.escape_sc(v_label) || '</b> ?</p>'
);

htp.p(
  '<p>' || htf.anchor(
    route('REITINGI_DEL_DO', '?p_reitinga_id=' || p_reitinga_id),
    'Jā, dzēst'
  ) || ' | ' || htf.anchor(route('REITINGI_LIST'), 'Atcelt') || '</p>'
);

page_foot;

EXCEPTION
WHEN NO_DATA_FOUND THEN page_head('Nav atrasts');

menu_bar;

htp.p('<p class="err">Reitings nav atrasts.</p>');

htp.p(
  '<p>' || htf.anchor(route('REITINGI_LIST'), 'Atpakaļ') || '</p>'
);

page_foot;

END;

PROCEDURE reitingi_del_do(p_reitinga_id IN NUMBER) IS BEGIN
DELETE FROM
  reitingi
WHERE
  reitinga_id = p_reitinga_id;

COMMIT;

page_head('Dzēsts');

menu_bar;

htp.p(
  '<p class="ok"><b>Dzēsts!</b> ID=' || p_reitinga_id || '</p>'
);

htp.p(
  '<p>' || htf.anchor(
    route('REITINGI_LIST'),
    'Atpakaļ uz sarakstu'
  ) || '</p>'
);

page_foot;

END;

END SPELES_PKG;
