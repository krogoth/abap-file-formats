INTERFACE zif_aff_shlp_v1
  PUBLIC.

  "! <p class="shorttext">Name</p>
  "! A dictionary name
  TYPES ty_name TYPE c LENGTH 30.

  "! <p class="shorttext">Category</p>
  "! Category of the search help
  "! $values {@link zif_aff_shlp_v1.data:co_category}
  TYPES ty_category TYPE c LENGTH 10.

  CONSTANTS:
    "! <p class="shorttext">Category</p>
    "! Category of the search help
    BEGIN OF co_category,
      "! <p class="shorttext">Elementary</p>
      "! Elementary search help: selects values through its selection method
      elementary TYPE ty_category VALUE 'elementary',
      "! <p class="shorttext">Collective</p>
      "! Collective search help: offers the search helps it includes
      collective TYPE ty_category VALUE 'collective',
      "! <p class="shorttext">Append</p>
      "! Append search help: adds its inclusions to the collective search help it appends to
      append     TYPE ty_category VALUE 'append',
    END OF co_category.

  "! <p class="shorttext">Method Type</p>
  "! Kind of the selection method
  "! $values {@link zif_aff_shlp_v1.data:co_method_type}
  TYPES ty_method_type TYPE c LENGTH 18.

  CONSTANTS:
    "! <p class="shorttext">Method Type</p>
    "! Kind of the selection method
    BEGIN OF co_method_type,
      "! <p class="shorttext">Table</p>
      "! Select from table
      table                 TYPE ty_method_type VALUE 'table',
      "! <p class="shorttext">Table with Text Table</p>
      "! Select from table with text table
      table_with_text_table TYPE ty_method_type VALUE 'tableWithTextTable',
      "! <p class="shorttext">View</p>
      "! Select from database view or projection view
      view                  TYPE ty_method_type VALUE 'view',
      "! <p class="shorttext">Help View</p>
      "! Select by help view
      help_view             TYPE ty_method_type VALUE 'helpView',
      "! <p class="shorttext">Function Module</p>
      "! Select by function module
      function_module       TYPE ty_method_type VALUE 'functionModule',
      "! <p class="shorttext">CDS View</p>
      "! Select from CDS view
      cds_view              TYPE ty_method_type VALUE 'cdsView',
    END OF co_method_type.

  "! <p class="shorttext">Dialog Type</p>
  "! How the values are offered
  "! $values {@link zif_aff_shlp_v1.data:co_dialog_type}
  TYPES ty_dialog_type TYPE c LENGTH 24.

  CONSTANTS:
    "! <p class="shorttext">Dialog Type</p>
    "! How the values are offered
    BEGIN OF co_dialog_type,
      "! <p class="shorttext">Display Values Immediately</p>
      "! Display values immediately
      display_values_immediately TYPE ty_dialog_type VALUE 'displayValuesImmediately',
      "! <p class="shorttext">Dialog with Value Restriction</p>
      "! Dialog with value restriction
      with_value_restriction     TYPE ty_dialog_type VALUE 'withValueRestriction',
      "! <p class="shorttext">Dialog Depends on Set of Values</p>
      "! Dialog depends on set of values
      depends_on_set_of_values   TYPE ty_dialog_type VALUE 'dependsOnSetOfValues',
    END OF co_dialog_type.

  "! <p class="shorttext">Type-Ahead</p>
  "! Type-ahead (search-as-you-type) input help
  "! $values {@link zif_aff_shlp_v1.data:co_autosuggest}
  "! $default {@link zif_aff_shlp_v1.data:co_autosuggest.off}
  TYPES ty_autosuggest TYPE c LENGTH 15.

  CONSTANTS:
    "! <p class="shorttext">Type-Ahead</p>
    "! Type-ahead (search-as-you-type) input help
    BEGIN OF co_autosuggest,
      "! <p class="shorttext">Off</p>
      "! Off
      off              TYPE ty_autosuggest VALUE 'off',
      "! <p class="shorttext">On</p>
      "! On
      on               TYPE ty_autosuggest VALUE 'on',
      "! <p class="shorttext">Multiple Columns</p>
      "! On, across multiple columns
      multiple_columns TYPE ty_autosuggest VALUE 'multipleColumns',
    END OF co_autosuggest.

  "! <p class="shorttext">Default Type</p>
  "! Kind of the default value
  "! $values {@link zif_aff_shlp_v1.data:co_default_type}
  TYPES ty_default_type TYPE c LENGTH 15.

  CONSTANTS:
    "! <p class="shorttext">Default Type</p>
    "! Kind of the default value
    BEGIN OF co_default_type,
      "! <p class="shorttext">Literal</p>
      "! Literal
      literal         TYPE ty_default_type VALUE 'literal',
      "! <p class="shorttext">System Variable</p>
      "! System variable (a component of SY)
      system_variable TYPE ty_default_type VALUE 'systemVariable',
      "! <p class="shorttext">GET Parameter</p>
      "! SET/GET parameter
      get_parameter   TYPE ty_default_type VALUE 'getParameter',
    END OF co_default_type.

  TYPES:
    "! <p class="shorttext">Selection</p>
    "! Selection of an elementary search help
    BEGIN OF ty_selection,
      "! <p class="shorttext">Selection Method</p>
      "! Table, view, CDS view or function module the values are selected from
      "! $required
      method           TYPE ty_name,
      "! <p class="shorttext">Method Type</p>
      "! Kind of the selection method
      "! $required
      method_type      TYPE ty_method_type,
      "! <p class="shorttext">Dialog Type</p>
      "! How the values are offered
      "! $required
      dialog_type      TYPE ty_dialog_type,
      "! <p class="shorttext">Hot Key</p>
      "! Hot key of the search help
      hot_key          TYPE c LENGTH 1,
      "! <p class="shorttext">Type-Ahead</p>
      "! Type-ahead (search-as-you-type) input help
      autosuggest      TYPE ty_autosuggest,
      "! <p class="shorttext">Fuzzy Search</p>
      "! Full-text fuzzy search in the type-ahead
      fuzzy_search     TYPE abap_bool,
      "! <p class="shorttext">Fuzzy Similarity</p>
      "! Accuracy of the fuzzy search
      "! $minimum 0
      "! $maximum 1
      fuzzy_similarity TYPE p LENGTH 2 DECIMALS 1,
    END OF ty_selection.

  TYPES:
    "! <p class="shorttext">Parameter</p>
    "! Search help parameter
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Name</p>
      "! Name of the parameter
      "! $required
      name                   TYPE ty_name,
      "! <p class="shorttext">Import</p>
      "! Import parameter
      import                 TYPE abap_bool,
      "! <p class="shorttext">Export</p>
      "! Export parameter
      export                 TYPE abap_bool,
      "! <p class="shorttext">Selection Position</p>
      "! Position on the selection screen
      "! $minimum 0
      "! $maximum 99
      selection_position     TYPE i,
      "! <p class="shorttext">List Position</p>
      "! Position in the hit list
      "! $minimum 0
      "! $maximum 99
      list_position          TYPE i,
      "! <p class="shorttext">Display Only</p>
      "! Display only on the selection screen
      selection_display_only TYPE abap_bool,
      "! <p class="shorttext">Data Element</p>
      "! Data element of the parameter
      "! $required
      data_element           TYPE ty_name,
      "! <p class="shorttext">Data Element Uncoupled</p>
      "! Data element uncoupled from the field of the selection method
      data_element_modified  TYPE abap_bool,
      "! <p class="shorttext">Default Value</p>
      "! Default value
      default_value          TYPE c LENGTH 21,
      "! <p class="shorttext">Default Type</p>
      "! Kind of the default value
      default_type           TYPE ty_default_type,
    END OF ty_parameter,
    "! <p class="shorttext">Parameters</p>
    "! Search help parameters
    ty_parameters TYPE STANDARD TABLE OF ty_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Inclusion</p>
    "! Search help included in a collective or append search help
    BEGIN OF ty_inclusion,
      "! <p class="shorttext">Search Help</p>
      "! Included search help
      "! $required
      search_help TYPE ty_name,
      "! <p class="shorttext">Hidden</p>
      "! Inclusion hidden
      hidden      TYPE abap_bool,
    END OF ty_inclusion,
    "! <p class="shorttext">Inclusions</p>
    "! Included search helps
    ty_inclusions TYPE STANDARD TABLE OF ty_inclusion WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Parameter Assignment</p>
    "! Assignment of a parameter to a parameter of an included search help
    BEGIN OF ty_assignment,
      "! <p class="shorttext">Parameter</p>
      "! Parameter of this search help
      "! $required
      parameter             TYPE ty_name,
      "! <p class="shorttext">Search Help</p>
      "! Included search help
      "! $required
      search_help           TYPE ty_name,
      "! <p class="shorttext">Search Help Parameter</p>
      "! Parameter of the included search help
      "! $required
      search_help_parameter TYPE ty_name,
    END OF ty_assignment,
    "! <p class="shorttext">Parameter Assignments</p>
    "! Parameter assignments
    ty_assignments TYPE STANDARD TABLE OF ty_assignment WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Category</p>
      "! Category of the search help
      "! $required
      category   TYPE ty_category,
      "! <p class="shorttext">Appends To</p>
      "! Collective search help an append search help appends to
      appends_to TYPE ty_name,
      "! <p class="shorttext">Search Help Exit</p>
      "! Function module called at the events of the search help
      exit       TYPE ty_name,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Search Help</p>
    "! Search help
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information   TYPE ty_general_information,
      "! <p class="shorttext">Selection</p>
      "! Selection of an elementary search help
      selection             TYPE ty_selection,
      "! <p class="shorttext">Parameters</p>
      "! Search help parameters
      parameters            TYPE ty_parameters,
      "! <p class="shorttext">Inclusions</p>
      "! Included search helps
      inclusions            TYPE ty_inclusions,
      "! <p class="shorttext">Parameter Assignments</p>
      "! Parameter assignments of the included search helps
      parameter_assignments TYPE ty_assignments,
    END OF ty_main.

ENDINTERFACE.
