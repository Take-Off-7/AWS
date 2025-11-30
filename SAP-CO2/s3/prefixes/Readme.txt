## Create bucket

```sh
aws s3 mb s3://prefixes-fun-tf-123
```

## Create folder

```sh
aws s3api put-object --bucket prefixes-fun-tf-123 --key="hello/"
```

## Create many folders

```sh
aws s3api put-object \
--bucket="prefixes-fun-tf-123" \
--key="Whatisorem/Ipype/and/scrambled/it/to/make/a/type/specimen/book/It/has/survived/not/only/five/centuries/but/also/the/leap/into/electronic/typesetting/remaining/essentially/unchanged/It/was/popularised/in/the/1960s/with/the/release/of/Letraset/sheets/containing/Lorem/Ipsum/passages/and/more/recently/with/desktop/publishing/software/like/Aldus/PageMaker/including/versions/of/Lorem/IpsumWhy/do/we/use/it/It/is/a/long/established/fact/that/a/reader/will/be/distracted/by/the/readable/content/of/a/page/when/looking/at/its/layout/The/point/of/using/Lorem/Ipsum/is/that/it/has/a/more-or-less/normal/distribution/of/letters/as/opposed/to/using/Content/here/content/here/making/it/look/like/readable/English/Many/desktop/publishing/packages/and/web/page/editors/now/use/Lorem/Ipsum/as/their/default/model/text/and/a/search/for/lorem/ipsum/will/uncover/many/web/sites/still/in/their/infancy/Various/the/years/sometimes/by/accident/sometimes/on/purpose/injected/humour/and/the/like/"
```

## Try and break the 1024 limit

```sh
aws s3api put-object \
    --bucket prefixes-fun-tf-123 \
    --key Whatisorem/Ipype/and/scrambled/it/to/make/a/type/specimenhsgiygweief/igqyirqgiugriqrf/qywfiuqhwvdyiqvwhd//book/It/has/survived/not/only/five/centuries/but/also/the/leap/into/electronic/typesetting/remaining/essentially/unchanged/It/was/popularised/in/the/1960s/with/the/release/of/Letraset/sheets/containing/Lorem/Ipsum/passages/and/more/recently/with/desktop/publishing/software/like/Aldus/PageMaker/including/versions/of/Lorem/IpsumWhy/do/we/use/it/It/is/a/long/established/fact/that/a/reader/will/be/distracted/by/the/readable/content/of/a/page/when/looking/at/its/layout/The/point/of/using/Lorem/Ipsum/is/that/it/has/a/more-or-less/normal/distribution/of/letters/as/opposed/to/using/Content/here/content/here/making/it/look/like/readable/English/Many/desktop/publishing/packages/and/web/page/editors/now/use/Lorem/Ipsum/as/their/default/model/text/and/a/search/for/lorem/ipsum/will/uncover/many/web/sites/still/in/their/infancy/Various/the/years/sometimes/by/accidenthsuaydsbkjADD/VUAYDYAV/SUGIYAudjb/sometimes/on/purpose/injected/humour/and/the/like/hello.txt \
    --body hello.txt
```

