FROM python:3.7-slim

RUN pip install --upgrade pip \
        awscli 
        awsebcli

RUN mkdir ~/.aws
