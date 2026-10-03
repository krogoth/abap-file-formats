# Search Help File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
SHLP | Search Help | Dictionary

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.shlp.json` | 1 | [`zif_aff_shlp_v1.intf.abap`](./type/zif_aff_shlp_v1.intf.abap) | [`shlp-v1.json`](./shlp-v1.json) | [`z_aff_example_shlp.shlp.json`](./examples/z_aff_example_shlp.shlp.json)

---

**Note:**
The file holds what is maintained for the search help.
Information the dictionary derives on activation is not part of the file: the text table of the selection method, the type information of the parameters (table, field, length, decimals, conversion routine, domain), and the parameters and assignments of search helps that are only included indirectly.
