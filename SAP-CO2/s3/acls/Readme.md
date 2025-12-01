## Create a bucket

```sh
aws s3api create-bucket --bucket acl-example-tf123 --region us-east-1
```

## Turn off block public access for acls

```sh
aws s3api put-public-access-block \
--bucket acl-example-tf123 \
--public-access-block-configuration '{
  "BlockPublicAcls": false,
  "IgnorePublicAcls": false,
  "BlockPublicPolicy": true,
  "RestrictPublicBuckets": true
}'
```

## Get public access

```sh
aws s3api get-public-access-block --bucket acl-example-tf123
```

```sh
aws s3api put-bucket-ownership-controls \
--bucket acl-example-tf123 \
--ownership-controls '{
  "Rules": [
    {
      "ObjectOwnership": "BucketOwnerPreferred"
    }
  ]
}'
```

## Change acls to allow for a user in another account

```sh
aws s3api put-bucket-acl \
--bucket acl-example-tf123 \
--access-control-policy '{
  "Grants": [
    {
      "Grantee": {
        "DisplayName": "KodeKloud",
        "ID": "32f0327c25de9366b19c427ff43ceaaac37c38f2047ea90cdd93662b65b2466e",
        "Type": "CanonicalUser"
      },
      "Permission": "FULL_CONTROL"
    }
  ],
  "Owner": {
    "DisplayName": "TakeOff",
    "ID": "27148241c3b77b940c4516d610ad2700e3bfcf94e4a8bb23051e07b902be6624"
  }
}'
```

## Access bucket from other account

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-tf123
aws s3 ls s3://acl-example-tf123
```

## Clean up

```sh
aws s3 rm s3://acl-example-tf123/bootcamp.txt
aws s3 rb s3://acl-example-tf123
```
