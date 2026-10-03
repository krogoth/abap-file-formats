INTERFACE zif_aff_tabl_v1 PUBLIC.

  TYPES:
    "! <p class="shorttext">Table and Structure</p>
    "! Table and structure
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Authorization Group</p>
      "! Authorization group (authorization object S_TABU_DIS) that protects the table contents
      "! in table maintenance and data browsing. Without a value the table is not assigned to an
      "! authorization group; &NC& is the group for tables that are not classified.
      authorization_group TYPE c LENGTH 14,
    END OF ty_main.

ENDINTERFACE.
