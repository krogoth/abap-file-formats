# Dictionary View File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
VIEW | Dictionary View | Dictionary

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.view.json` | 1 | [`zif_aff_view_v1.intf.abap`](./type/zif_aff_view_v1.intf.abap) | [`view-v1.json`](./view-v1.json) | [`z_aff_example_view.view.json`](./examples/z_aff_example_view.view.json)

---

**Note:**
The format covers the classic dictionary views maintained in transaction SE11 (database, maintenance, help and projection views, view variants and append views).
SQL views generated from CDS view definitions are part of the DDLS object and are not represented in this format.
