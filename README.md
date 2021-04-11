# AWS CLI Tool Set 

Docker container with serveral AWS CLI tools sets.

List of tools

- AWS CLI
- AWS EB CLI
- CLI53

## Running in shell 

To from a shell use docker or podman framework.

```
docker run -it -w /work -v $PWD:/work gonzaloacosta/awscli-tools eb --version
docker run -it gonzaloacosta/awscli-tools aws --version
docker run -it -w /work -v $PWD:/work gonzaloacosta/awscli-tools eb create test-app-${BUILD_NUMBER}
docker run -i gonzaloacosta/awscli-tools aws ec2 describe-instances --region=us-east-1
```

To provide credentials, you have 2 options:

1. Use -e to export all your AWS Secret Key and AWS Access Key like var envs
2. Mount your ~/.aws directory to the docker container

```
docker run -i -w /work -v $PWD:/work -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN gonzaloacosta/awscli-tools eb status
```

Example with mounting ~/.aws

```
docker run -i -w /work -v $PWD:/work -v ~/.aws:/Users/gonza/.aws/.aws gonzaloacosta/awscli-tools eb status
```

## Running in a Jenkinsfile

Use in a Jenkinsfile with docker workflow plugin:

```
docker.image('gonzaloacosta/awscli-tools').inside('-u root:root') {
    sh 'eb create test-app-${BUILD_NUMBER}'
}
```
# awscli-tools
