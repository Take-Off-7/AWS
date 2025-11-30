## Create bucket

```sh
aws s3 mb s3://metadata-fun-3210
```

## Create a new file

```sh
echo "Hello Mars" > hello.txt
```

## Upload file with metadata

```sh
aws s3api put-object \
--bucket metadata-fun-3210 \
--key hello.txt \
--body hello.txt \
--metadata Planet=Mars
```

## Get Metadata through head-object

```sh
aws s3api head-object \
--bucket metadata-fun-3210 \
--key hello.txt 
```