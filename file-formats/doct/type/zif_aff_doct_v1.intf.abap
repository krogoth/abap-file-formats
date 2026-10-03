INTERFACE zif_aff_doct_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header</p>
    "! Header without description; a general text has no short text
    BEGIN OF ty_header_without_description,
      "! $required
      original_language TYPE zif_aff_types_v1=>ty_original_language,
    END OF ty_header_without_description.

  TYPES:
    "! <p class="shorttext">General Text</p>
    "! General text (document class TX)
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header_without_description,
      "! <p class="shorttext">Lines</p>
      "! The text in its original language, one entry per stored line: paragraph format and at most
      "! 72 characters
      lines          TYPE zif_aff_docu_v1=>ty_lines,
    END OF ty_main.

ENDINTERFACE.
