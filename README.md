# ci-oracle-sqlplus

A Docker base image containing SQL\*Plus (sqlplus), to run SQL commands against an Oracle database.

This image ships with both `sh` and `bash` and also `jq` and other utilities.
In particular:
`jq` was added because `sqlplus` doesn't support native JSON exports.
`diffutils` was added to have `diff`
`util-linux`, was added to have `column`

## SQL\*Plus vs Oracle SQLcl (SQL Command Line)

SQLcl (sql) would be a better alternative _(since it supports JSON exports and it's also already provided by Oracle: `container-registry.oracle.com/database/sqlcl`)_ but the image size is significantly larger:

```bash
doker images | grep sql
oraclelinux9-sqlplus                              latest         a80ff714d54f   3 hours ago     549MB
container-registry.oracle.com/database/sqlcl      latest         0bc1f2f753f4   3 weeks ago     1.64GB
```
