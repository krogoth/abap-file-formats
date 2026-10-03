# General Text File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
DOCT | General Text | Texts

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.doct.json` | 1 | [`zif_aff_doct_v1.intf.abap`](./type/zif_aff_doct_v1.intf.abap) | [`doct-v1.json`](./doct-v1.json) | [`z_aff_example_doct.doct.json`](./examples/z_aff_example_doct.doct.json)

---

**Note:**
A general text (transaction SE61, document class TX) has no short text, so the header carries the original language only.
The text lines reuse the long text line type of [`zif_aff_docu_v1.intf.abap`](../zif_aff_docu_v1.intf.abap): one entry per stored line, with its paragraph format.
