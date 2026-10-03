INTERFACE zif_aff_view_v1
  PUBLIC.

  "! <p class="shorttext">Name</p>
  "! A dictionary name
  TYPES ty_name TYPE c LENGTH 30.

  "! <p class="shorttext">View Type</p>
  "! Type of the dictionary view
  "! $values {@link zif_aff_view_v1.data:co_view_type}
  TYPES ty_view_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">View Type</p>
    "! Type of the dictionary view
    BEGIN OF co_view_type,
      "! <p class="shorttext">Database View</p>
      "! Database view
      database    TYPE ty_view_type VALUE 'D',
      "! <p class="shorttext">Maintenance View</p>
      "! Maintenance view
      maintenance TYPE ty_view_type VALUE 'C',
      "! <p class="shorttext">Help View</p>
      "! Help view
      help        TYPE ty_view_type VALUE 'H',
      "! <p class="shorttext">Projection View</p>
      "! Projection view
      projection  TYPE ty_view_type VALUE 'P',
      "! <p class="shorttext">View Variant</p>
      "! View variant
      variant     TYPE ty_view_type VALUE 'V',
      "! <p class="shorttext">Append View</p>
      "! Append view
      append      TYPE ty_view_type VALUE 'A',
    END OF co_view_type.

  "! <p class="shorttext">Maintenance Status</p>
  "! Access the view allows: blank for read, change, delete and insert, R for read only, U for read
  "! and change, M for time-dependent views
  TYPES ty_maintenance_status TYPE c LENGTH 1.

  "! <p class="shorttext">Data Browser/Table View Maintenance</p>
  "! Display and maintenance in the data browser and table view maintenance: X allowed, blank allowed
  "! with restrictions, D display only, N not allowed
  TYPES ty_maintenance_flag TYPE c LENGTH 1.

  "! <p class="shorttext">Delivery Class</p>
  "! Delivery class of the view, as for a table (A, C, E, G, L, S, W)
  TYPES ty_delivery_class TYPE c LENGTH 1.

  "! <p class="shorttext">Maintenance Attribute</p>
  "! Maintenance attribute of a view field: blank normal, R read only, H not passed to the
  "! maintenance screens, S used to form subsets
  TYPES ty_field_attribute TYPE c LENGTH 1.

  "! <p class="shorttext">Foreign Key Direction</p>
  "! Direction of the foreign key dependency: I import, E export
  TYPES ty_foreign_key_direction TYPE c LENGTH 1.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">View Type</p>
      "! Type of the dictionary view
      "! $required
      view_type              TYPE ty_view_type,
      "! <p class="shorttext">Primary Table</p>
      "! Primary table of the view; for an append view, the view it extends
      root_table             TYPE ty_name,
      "! <p class="shorttext">Maintenance Status</p>
      "! Access the view allows: blank for read, change, delete and insert, R for read only, U for
      "! read and change, M for time-dependent views
      maintenance_status     TYPE ty_maintenance_status,
      "! <p class="shorttext">Data Browser/Table View Maintenance</p>
      "! Display and maintenance in the data browser and table view maintenance: X allowed, blank
      "! allowed with restrictions, D display only, N not allowed
      maintenance_flag       TYPE ty_maintenance_flag,
      "! <p class="shorttext">Delivery Class</p>
      "! Delivery class of the view, as for a table (A, C, E, G, L, S, W)
      delivery_class         TYPE ty_delivery_class,
      "! <p class="shorttext">Manual Key Maintenance</p>
      "! Whether the key flags of the view fields are maintained by hand instead of taken from the
      "! base tables
      manual_key_maintenance TYPE abap_bool,
      "! <p class="shorttext">Application Class</p>
      "! Application class of the view; no longer evaluated by the system
      application_class      TYPE c LENGTH 4,
      "! <p class="shorttext">Read-Only Flag</p>
      "! Legacy read-only flag of the view; the maintenance status is the current access setting
      read_only              TYPE abap_bool,
      "! <p class="shorttext">Authorization Group</p>
      "! Authorization group (authorization object S_TABU_DIS) that protects the view contents
      "! in table view maintenance and data browsing. Without a value the view is not assigned to
      "! an authorization group; &NC& is the group for objects that are not classified.
      authorization_group    TYPE c LENGTH 14,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Base Table</p>
    "! Base table of the view
    BEGIN OF ty_table,
      "! <p class="shorttext">Table Name</p>
      "! Name of the base table
      "! $required
      name                  TYPE ty_name,
      "! <p class="shorttext">Foreign Key Table</p>
      "! Table whose foreign key relationship links this base table into the view
      foreign_key_table     TYPE ty_name,
      "! <p class="shorttext">Foreign Key Field</p>
      "! Field of the foreign key relationship
      foreign_key_field     TYPE ty_name,
      "! <p class="shorttext">Foreign Key Direction</p>
      "! Direction of the foreign key dependency: I import, E export
      foreign_key_direction TYPE ty_foreign_key_direction,
    END OF ty_table,
    "! <p class="shorttext">Base Tables</p>
    "! Base tables of the view
    ty_tables TYPE STANDARD TABLE OF ty_table WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Join Condition</p>
    "! Condition joining two base tables
    BEGIN OF ty_join_condition,
      "! <p class="shorttext">Left Table</p>
      "! Table on the left side of the condition
      "! $required
      left_table            TYPE ty_name,
      "! <p class="shorttext">Left Field</p>
      "! Field on the left side of the condition
      "! $required
      left_field            TYPE ty_name,
      "! <p class="shorttext">Operator</p>
      "! Comparison operator of the condition (EQ, NE, LT, LE, GT, GE)
      operator              TYPE c LENGTH 2,
      "! <p class="shorttext">Right Table</p>
      "! Table on the right side of the condition
      "! $required
      right_table           TYPE ty_name,
      "! <p class="shorttext">Right Field</p>
      "! Field on the right side of the condition
      "! $required
      right_field           TYPE ty_name,
      "! <p class="shorttext">Source</p>
      "! Origin flag of the condition, as filled by the dictionary
      source                TYPE c LENGTH 1,
      "! <p class="shorttext">Foreign Key Table</p>
      "! Table of the foreign key relationship the condition is derived from
      foreign_key_table     TYPE ty_name,
      "! <p class="shorttext">Foreign Key Field</p>
      "! Field of the foreign key relationship the condition is derived from
      foreign_key_field     TYPE ty_name,
      "! <p class="shorttext">Foreign Key Direction</p>
      "! Direction of the foreign key dependency: I import, E export
      foreign_key_direction TYPE ty_foreign_key_direction,
      "! <p class="shorttext">View Operator</p>
      "! Comparison operator of the condition in its long form, for example = or LIKE
      view_operator         TYPE c LENGTH 8,
      "! <p class="shorttext">Join Operator</p>
      "! Join operator: IJ inner join, LOJ left outer join, ROJ right outer join, FJ full join
      join_operator         TYPE c LENGTH 5,
      "! <p class="shorttext">Join Constant</p>
      "! Literal compared in the ON condition
      join_constant         TYPE c LENGTH 250,
      "! <p class="shorttext">AND/OR</p>
      "! Link to the next condition: AND or OR
      and_or                TYPE c LENGTH 3,
      "! <p class="shorttext">Join Source</p>
      "! Source of the join operator: E explicit join, G generated from an association
      join_source           TYPE c LENGTH 1,
    END OF ty_join_condition,
    "! <p class="shorttext">Join Conditions</p>
    "! Conditions joining the base tables
    ty_join_conditions TYPE STANDARD TABLE OF ty_join_condition WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Selection Condition</p>
    "! Condition restricting the rows of the view
    BEGIN OF ty_selection_condition,
      "! <p class="shorttext">Condition Name</p>
      "! Identifier of the selection condition
      condition_name    TYPE c LENGTH 30,
      "! <p class="shorttext">Table</p>
      "! Table of the restricted field
      table             TYPE ty_name,
      "! <p class="shorttext">Field</p>
      "! Restricted field
      field             TYPE ty_name,
      "! <p class="shorttext">Negation</p>
      "! NOT to negate the condition
      negation          TYPE c LENGTH 3,
      "! <p class="shorttext">Operator</p>
      "! Comparison operator (EQ, NE, LT, LE, GT, GE, LK for a LIKE pattern)
      operator          TYPE c LENGTH 2,
      "! <p class="shorttext">Value</p>
      "! Compared value, a quoted literal or a field
      value             TYPE c LENGTH 38,
      "! <p class="shorttext">Continuation Line</p>
      "! X when the row continues the value of the previous row
      continuation_line TYPE c LENGTH 1,
      "! <p class="shorttext">AND/OR</p>
      "! Link to the next condition: AND or OR
      and_or            TYPE c LENGTH 3,
      "! <p class="shorttext">Offset</p>
      "! Offset within a matchcode field
      offset            TYPE n LENGTH 4,
      "! <p class="shorttext">Field Length</p>
      "! Field length within a matchcode ID
      field_length      TYPE n LENGTH 4,
      "! <p class="shorttext">Matchcode Field</p>
      "! Matchcode field name
      matchcode_field   TYPE ty_name,
      "! <p class="shorttext">Join Operator</p>
      "! Join operator: IJ inner join, LOJ left outer join, ROJ right outer join, FJ full join
      join_operator     TYPE c LENGTH 5,
      "! <p class="shorttext">Join Source</p>
      "! Source of the join operator: E explicit join, G generated from an association
      join_source       TYPE c LENGTH 1,
    END OF ty_selection_condition,
    "! <p class="shorttext">Selection Conditions</p>
    "! Conditions restricting the rows of the view
    ty_selection_conditions TYPE STANDARD TABLE OF ty_selection_condition WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Search Help Parameter Assignment</p>
    "! Assignment of a search help parameter to a field
    BEGIN OF ty_search_help_parameter,
      "! <p class="shorttext">Parameter</p>
      "! Name of the search help parameter
      "! $required
      name            TYPE ty_name,
      "! <p class="shorttext">Position</p>
      "! Position of the search help parameter
      position        TYPE n LENGTH 4,
      "! <p class="shorttext">Assignment Type</p>
      "! Type of the assignment: blank for a field, C for a constant, G for no assignment
      assignment_type TYPE c LENGTH 1,
      "! <p class="shorttext">Table</p>
      "! Table or structure of the assigned field
      table           TYPE ty_name,
      "! <p class="shorttext">Field</p>
      "! Assigned field, or the constant
      field           TYPE ty_name,
      "! <p class="shorttext">Import</p>
      "! Import parameter of the search help
      import          TYPE abap_bool,
      "! <p class="shorttext">Export</p>
      "! Export parameter of the search help
      export          TYPE abap_bool,
      "! <p class="shorttext">Data Element</p>
      "! Data element of the parameter
      data_element    TYPE ty_name,
      "! <p class="shorttext">Domain</p>
      "! Domain of the parameter
      domain          TYPE ty_name,
      "! <p class="shorttext">Data Type</p>
      "! Dictionary data type of the parameter
      datatype        TYPE c LENGTH 4,
      "! <p class="shorttext">Length</p>
      "! Length of the parameter in characters
      length          TYPE n LENGTH 6,
      "! <p class="shorttext">Decimals</p>
      "! Number of decimal places of the parameter
      decimals        TYPE n LENGTH 6,
      "! <p class="shorttext">Default Value</p>
      "! Default value of the parameter
      default_value   TYPE c LENGTH 21,
      "! <p class="shorttext">Default Type</p>
      "! Kind of the default value: blank none, L literal, S system variable, G GET parameter
      default_type    TYPE c LENGTH 1,
    END OF ty_search_help_parameter,
    "! <p class="shorttext">Search Help Parameter Assignments</p>
    "! Assignments of the search help parameters
    ty_search_help_parameters TYPE STANDARD TABLE OF ty_search_help_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Search Help Attachment</p>
    "! Search help attached to a view field
    BEGIN OF ty_search_help,
      "! <p class="shorttext">Search Help</p>
      "! Name of the search help
      name       TYPE ty_name,
      "! <p class="shorttext">Inherited</p>
      "! Whether the attachment is inherited from the base table
      inherited  TYPE abap_bool,
      "! <p class="shorttext">Parameters</p>
      "! Assignments of the search help parameters
      parameters TYPE ty_search_help_parameters,
    END OF ty_search_help.

  TYPES:
    "! <p class="shorttext">View Field</p>
    "! A field row as maintained in the dictionary: a named field, an all-fields row or an
    "! exclusion row
    BEGIN OF ty_field,
      "! <p class="shorttext">View Field Name</p>
      "! Name of the view field; "*" takes every field of the table, "-" excludes the named field
      "! of a table taken with "*"
      "! $required
      name         TYPE ty_name,
      "! <p class="shorttext">Base Table</p>
      "! Base table the field comes from
      "! $required
      table        TYPE ty_name,
      "! <p class="shorttext">Table Field</p>
      "! Field of the base table; "*" on an all-fields row
      "! $required
      field        TYPE ty_name,
      "! <p class="shorttext">Key Field</p>
      "! Whether the field belongs to the view key
      key          TYPE abap_bool,
      "! <p class="shorttext">Maintenance Attribute</p>
      "! Maintenance attribute of the field in a maintenance or help view: blank normal, R read
      "! only, H not passed to the maintenance screens, S used to form subsets
      attribute    TYPE ty_field_attribute,
      "! <p class="shorttext">Data Element Override</p>
      "! Data element that replaces the base field's own; empty keeps the base field's
      data_element TYPE ty_name,
      "! <p class="shorttext">Search Help</p>
      "! Search help attached to the view field
      search_help  TYPE ty_search_help,
    END OF ty_field,
    "! <p class="shorttext">View Fields</p>
    "! View fields
    ty_fields TYPE STANDARD TABLE OF ty_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Buffering</p>
    "! Technical buffering settings
    BEGIN OF ty_buffering,
      "! <p class="shorttext">Buffering Allowed</p>
      "! Buffering permission: N not allowed, A allowed but switched off, X switched on
      allowed    TYPE c LENGTH 1,
      "! <p class="shorttext">Buffering Type</p>
      "! Buffering type: P single records, G generic, X full
      type       TYPE c LENGTH 1,
      "! <p class="shorttext">Number of Key Fields</p>
      "! Number of key fields for generic buffering
      key_fields TYPE n LENGTH 3,
    END OF ty_buffering.

  TYPES:
    "! <p class="shorttext">Dictionary View</p>
    "! Classic dictionary view
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information  TYPE ty_general_information,
      "! <p class="shorttext">Base Tables</p>
      "! Base tables of the view in their order
      tables               TYPE ty_tables,
      "! <p class="shorttext">Join Conditions</p>
      "! Conditions joining the base tables
      join_conditions      TYPE ty_join_conditions,
      "! <p class="shorttext">Selection Conditions</p>
      "! Conditions restricting the rows of the view, in their order
      selection_conditions TYPE ty_selection_conditions,
      "! <p class="shorttext">View Fields</p>
      "! Field rows as maintained in the dictionary, in their order; the fields an all-fields row
      "! expands to and the fields of append views are derived, not listed here
      fields               TYPE ty_fields,
      "! <p class="shorttext">Buffering</p>
      "! Technical buffering settings, for database views only
      buffering            TYPE ty_buffering,
    END OF ty_main.

ENDINTERFACE.
