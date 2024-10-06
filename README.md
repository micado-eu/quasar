# quasar
Quasar image for developing MICADO applications.

This is the repository where the artifacts, for building the image that enable all the development team that have to work on the frontend components to share the same development environment, are kept.

This image is linked with the dockerhub account and an continuous integration process is configured to have the image built in dockerhub and publicly available.

### Content
The image extend the node base image with the quasar framework.

### WARNING
The image is set to the latest version of the quasar framework compatible with the quasar-cli used in the MICADO project.  Since the VUE.JS version evolved to VUE 3 there is the need to stay on an older version of the quasar framework.
Consider carefully any update of the quasar framework.

### Build
**Workflow Name:**

Create and publish a Docker image
__Trigger Conditions:__

    The workflow runs when:
        A push is made to the master or 2024 branch.
        A tag is created that starts with v, such as v1.0, v2.0, etc.

**Environment Variables:**

    REGISTRY: The domain for the container registry, set to GitHub Container Registry (ghcr.io).
    IMAGE_NAME: Dynamically set to the GitHub repository name, which will be used for the Docker image name.

**Jobs:**

There is one job in this workflow:
1. Job Name: build-and-push-image

    Runs-on: ubuntu-latest, which is the environment where the job runs.
    Permissions:
        The job is granted permissions to:
            read contents of the repository.
            write packages to the GitHub Packages (container registry).

Steps in the Job:

    Checkout repository:
        Uses the action actions/checkout@v4 to clone the repository’s code into the workflow environment, allowing subsequent steps to use the repository's files.

    Log in to the Container registry:
        Uses the action docker/login-action@v3 to authenticate to the GitHub Container Registry (ghcr.io).
        It uses the GitHub actor (the user or bot running the workflow) as the username and the GITHUB_TOKEN secret as the password.

    Extract metadata (tags, labels) for Docker:
        Uses the docker/metadata-action@v5 to extract metadata such as tags and labels from the repository.
        The extracted tags and labels will be used to tag the Docker image correctly.
        The output from this step is stored under the id: meta, which can be referenced later.

    Build and push Docker image:
        Uses the action docker/build-push-action@v5 to:
            Build the Docker image based on the Dockerfile in the repository.
            Push the built image to the GitHub Container Registry (ghcr.io).
        It uses the metadata (tags and labels) from the previous step to properly tag and label the image.
        The context is set to the current directory (.), meaning it will use the files in the root of the repository for building the Docker image.

**Summary:**

This workflow automates the Docker build and push process. It triggers on pushes to specific branches or new tags, builds a Docker image from the repository’s code, tags and labels it with relevant metadata, and pushes the image to GitHub's Container Registry.

### Usage
To use this image run the following command:

``
docker run -it -v <host_pat>:/code ghcr.io/micado-eu/quasar:v2.5 bash
``

### Funded by

![EU Logo](https://github.com/micado-eu/MICADO/blob/master/img/Flag_of_Europe.svg_.png)This project has received funding from the European Union’s H2020 Innovation Action under Grant Agreement No 822717.
