## o 1º passo após baixar os arquivos .CSV foi convertê-los de ISO-8859-1 para UTF-*
### Para isso foi utilizado o comando linux iconv, conforme a lista de comandos abaixo:
```
iconv -f ISO-8859-1 -t UTF8 1T2020.csv -o 1T2020_utf8.csv
iconv -f ISO-8859-1 -t UTF8 2T2020.csv -o 2T2020_utf8.csv
iconv -f ISO-8859-1 -t UTF8 3T2020.csv -o 3T2020_utf8.csv
iconv -f ISO-8859-1 -t UTF8 4T2020.csv -o 4T2020_utf8.csv
iconv -f ISO-8859-1 -t UTF8 1T2021.csv -o 1T2021_utf8.csv
iconv -f ISO-8859-1 -t UTF8 2T2021.csv -o 2T2021_utf8.csv
iconv -f ISO-8859-1 -t UTF8 3T2021.csv -o 3T2021_utf8.csv
```

## Com os arquivos convertidos no formato utf-8, foi realizados os comandos conforme consta o arquivo "Comandos.slq"