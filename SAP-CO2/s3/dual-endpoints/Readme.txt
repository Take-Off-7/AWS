## Creare a bucket

```sh
aws s3 mb s3://endpoint-test-tf123
```

## Upload a file to s3 using standard endpoint

```sh
touch standard.txt
aws s3 cp standard.txt s3://endpoint-test-tf123 --endpoint-url http://s3.us-east-1.amazonaws.com
```

## Upload a file to s3 using dualstack endpoint

```sh
touch dualstack.txt
aws s3 cp dualstack.txt s3://endpoint-test-tf123 --endpoint-url http://s3.dualstack.us-east-1.amazonaws.com
```

## Cleanup

```sh
aws s3 rm s3://endpoint-test-tf123/standard.txt
aws s3 rm s3://endpoint-test-tf123/dualstack.txt
aws s3 rb s3://endpoint-test-tf123
```