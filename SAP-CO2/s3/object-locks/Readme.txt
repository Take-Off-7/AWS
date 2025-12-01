## Create a bucket

```sh
aws s3 mb s3://object-lock-fun-123
```

## Turn on S3 Versioning
```sh
aws s3api put-bucket-versioning --bucket object-lock-fun-123 --versioning-configuration Status=Enabled
```

## Turn on object locking

```sh
aws s3api put-object-lock-configuration \
--bucket object-lock-fun-123 \
--object-lock-configuration '{
  "ObjectLockEnabled": "Enabled",
  "Rule": {
    "DefaultRetention": {
      "Mode": "GOVERNANCE",
      "Days": 1
    }
  }
}'
```

## New file and upload
```sh
echo "This is the gov" > gov.txt
aws s3 cp gov.txt s3://object-lock-fun-123
```

## Delete the file
```sh
aws s3 rm s3://object-lock-fun-123/gov.txt
```

## List the versioned file
```sh
aws s3api list-object-versions --bucket object-lock-fun-123
```

## Delete the versioned file
```sh
aws s3api delete-object \
--bucket object-lock-fun-123 \
--key "gov.txt" \
--version-id="UsQC0VCMPkPjUOVupa2sxr6jd_0pEO0I" \
--bypass-governance-retention
```

## Use compliance mode for s3 object
```sh
aws s3api put-object \
  --bucket object-lock-fun-123 \
  --key compliance.txt \
  --body compliance.txt \
  --object-lock-mode COMPLIANCE \
  --object-lock-retain-until-date "2025-12-02T16:00:00Z"
```

## Delete the file
```sh
aws s3 rm s3://object-lock-fun-123/compliance.txt
```

## Try and delete specific version

```sh
aws s3api delete-object \
--bucket object-lock-fun-123 \
--key "compliance.txt" \
--version-id="VXqyFAJmjbMMiU8aCSJo62x9d9q0EAcV"
```

## New file (Legal Hold)

```sh
touch legal.txt

aws s3 cp legal.txt s3://object-lock-fun-123/legal.txt

aws s3api put-object-legal-hold --bucket object-lock-fun-123 --key legal.txt --legal-hold Status=ON

aws s3api list-object-versions --bucket object-lock-fun-123

aws s3api delete-object \
--bucket object-lock-fun-123 \
--key "legal.txt" \
--version-id="MiZcaTDy4GceX1Hdnxju32Ue7R5eHFJ."

aws s3api put-object-legal-hold \
--bucket object-lock-fun-123 \
--key legal.txt \
--version-id="MiZcaTDy4GceX1Hdnxju32Ue7R5eHFJ." \
--legal-hold Status=OFF

aws s3api delete-object \
--bucket object-lock-fun-123 \
--key "legal.txt" \
--version-id="MiZcaTDy4GceX1Hdnxju32Ue7R5eHFJ." \
--bypass-governance-retention
```
