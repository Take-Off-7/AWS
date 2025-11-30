## Create bucket

```sh
aws s3 mb s3://checksums-examples-tf-123
```

## Create file

```sh
echo "Hello Mars" > myfile.txt
```

## Optional: local CRC32 checksum

```sh
cksum myfile.txt
```

## Upload with CRC32

```sh
aws s3api put-object \
    --bucket checksums-examples-tf-123 \
    --key myfile.txt \
    --body myfile.txt \
    --checksum-algorithm CRC32
```

## Verify stored CRC32

```sh
aws s3api get-object \
    --bucket checksums-examples-tf-123 \
    --key myfile.txt \
    myfile_downloaded.txt \
    --checksum-mode ENABLED
```
