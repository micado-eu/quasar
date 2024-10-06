# quasar
Quasar image for developing MICADO applications.

This is the repository where the artifacts, for building the image that enable all the development team that have to work on the frontend components to share the same development environment, are kept.

This image is linked with the dockerhub account and an continuous integration process is configured to have the image built in dockerhub and publicly available.

### Content
The image extend the node base image with the quasar framework.

### WARNING
The image is set to the latest version of the quasar framework compatible with the quasar-cli used in the MICADO project.  Since the VUE.JS version evolved to VUE 3 there is the need to stay on an older version of the quasar framework.
Consider carefully any update of the quasar framework.

### Usage
To use this image run the following command:

``
docker run -it -v <host_pat>:/code micadoproject/quasar:1.0.3 bash
``

### Funded by

![EU Logo](https://github.com/micado-eu/MICADO/blob/master/img/Flag_of_Europe.svg_.png)This project has received funding from the European Union’s H2020 Innovation Action under Grant Agreement No 822717.
