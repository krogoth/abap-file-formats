# Table and Structure File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
TABL  | Table and Structure | Dictionary

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.tabl.json` | 1 | [`zif_aff_tabl_v1.intf.abap`](./type/zif_aff_tabl_v1.intf.abap) | [`tabl-v1.json`](./tabl-v1.json) | [`zaffexample.tabl.json`](./examples/zaffexample.tabl.json)
`<name>.tabl.ddic` | 1 | | | [`zaffexample.tabl.ddic`](./examples/zaffexample.tabl.ddic)
`<name>.tabl.settings.json` | 0..1 | [`zif_aff_tabt_v1.intf.abap`](./type/zif_aff_tabt_v1.intf.abap) | [`tabt-v1.json`](./tabt-v1.json) | [`zaffexample.tabl.settings.json`](./examples/zaffexample.tabl.settings.json)
`<name>.tabl.<index>.indx.json` | 0..n | [`zif_aff_indx_v1.intf.abap`](./type/zif_aff_indx_v1.intf.abap) | [`indx-v1.json`](./indx-v1.json) | [`zaffexample.tabl.001.indx.json`](./examples/zaffexample.tabl.001.indx.json)

A secondary index is stored in its own file per index, named after the index (`<index>` in lower case, for example `001`).
Extension indexes (object type XINX) are not part of the table's files.
