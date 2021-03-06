# Demo Guide

This is the guide showing you how to get the demo project up and running on the SIMATIC IOT2050. After working through this document you will know how to

- Get remote access to the SIMATIC IOT2050.
- Install Docker on the SIMATIC IOT2050.
- Host the application running in a Docker container.

## Prerequisites

- [7-Zip](https://www.7-zip.de/) to extract the example image.
- USB webcam working with Linux ([e.g. works without additional drivers](https://www.amazon.de/Jelly-Comb-Objektivdeckel-Video-Anrufe-Live-Streaming/dp/B0894RDBMJ/ref=sr_1_2_sspa?__mk_de_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=webcam+linux&qid=1611871231&sr=8-2-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExRDlDQThIREE5TFU3JmVuY3J5cHRlZElkPUEwMTA1ODU3MUowM0FEUjhLVU1JVyZlbmNyeXB0ZWRBZElkPUEwMjIxMzYwMkdNMkpIQUM0M0daSSZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=)).
- Additional software and hardware as described in the official
  [setup instructions](https://support.industry.siemens.com/tf/ww/en/posts/how-to-setup-the-iot2050/238945/?page=0&pageSize=10).

## Installing the SD-Card Example Image

1. Using [7-Zip](https://www.7-zip.de/) download and extract the pre-built image, which can be found in the downloads section of
   [the first release](https://github.com/JensD98/iot2050-demo-python/releases/tag/v1.0.0).
2. From here follow the
   [setup instructions](https://support.industry.siemens.com/tf/ww/en/posts/how-to-setup-the-iot2050/238945/?page=0&pageSize=10)
   to complete the installation. Note the instruction is using a different image which has some problems when trying to install Docker, make sure to use the
   **pre-build image** as shown in the previous step! Furthermore the example image starts with the IP 192.168.200.1 preconfigured on the first Ethernet interface, and use DHCP at another, which is the other way around as in the linked instruction.

## Running the application

If all went well, you should now be connected to the SIMATIC IOT2050 and logged in as root.

- Verify that the device is connected to the Internet by running

```bash
$ apt update && apt upgrade -y
```

to update the system.

- Install Git through the package manager:

```bash
$ apt install git
```

- Clone this repository to some location in the file system e.g. `/home`:

```bash
$ cd /home
$ git clone https://github.com/JensD98/iot2050-demo-python.git
```

- Install Docker by running

```bash
$ cd iot2050-demo-python
$ chmod +x install-docker remove-docker # make files executable
$ ./install-docker
```

or follow the instruction on the [docker docs](https://docs.docker.com/engine/install/debian/) website.

- Connect the webcam to the first USB Port.
- Run

```bash
$ make build # build the image
$ make start-app # start the container
```

which will build the Docker image and start the container. With no errors you should now be able open `http://<your-IP-address>:5000` in a web browser and
view the webcam footage :tada:. To stop the app and remove the container, write `make stop-app`.
