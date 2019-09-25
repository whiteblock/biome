#!/bin/bash

#INSTALL DOCKER CREDENTIALS

gcloud auth configure-docker
docker-credential-gcr configure-docker
