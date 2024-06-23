# React Tests CI Demo & Pipelines

This project is a demo of how to set up a CI pipeline for a React application using GitHub Actions. The pipeline runs tests on the application and builds a docker image of the application. The docker image is then pushed to either Google Cloud Registry or AWS Elastic Container Registry. (Work in progress).

The project is entirely dockerized and uses docker-compose to run the application locally and a test docker container to run the tests.

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Requirements
- Docker
- Docker Compose
- Node.js
- NPM Create React App
- Google Cloud SDK (optional)
- AWS CLI (optional)

## Local Development: Starting and Building the Application

To run the application locally, use the following commands:

```bash
docker-compose -f dev.docker-compose.yaml up
```

or

This command will build the docker image and run the application in a container.

```bash
docker-compose -f dev.docker-compose.yaml up --build
```

## Local Development: Stopping the Application

To stop the application, use the following command:

```bash
docker-compose -f dev.docker-compose.yaml down -v
```

The `-v` flag is used to remove the volumes associated with the containers.


## Local Development: Accessing the Application

The application will be available at `http://localhost:3000`.

## Running Tests: Locally

To run the tests, use the following command:

```bash
docker-compose -f test.docker-compose.yml up
```

## Running Tests: CI Pipeline (GitHub Actions)

### Secrets

You need to provide the authentication details for the container to push the docker image to Google Cloud Registry or AWS Elastic Container Registry. The authentication details should be stored in GitHub secrets.

*Local secrets* can be stored in a `.env` file in the root directory of the project. The `.env` file should not be committed to the repository.

### Environment Variables
Environment variables can be written directly into the environment section of the docker-compose file.

Some envriorment variables are required to be defined in the GitHub environment secrets.