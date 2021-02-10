# Demo Guide

This is the guide showing you how to get demo project up and running. After working though document you will know how to

- Get remote access to the SIMATIC IOT2050.
- Install Docker on the SIMATIC IOT2050.
- Host the Python application running in a Docker container, which will use a USB webcam connected to the SIMATIC IOT2050 and stream the captured video
  to a web page/web browser.

## Prerequisites

- [7-Zip](https://www.7-zip.de/) to extract the example image.
- Additional software and hardware as described in the official
  [setup instructions](https://support.industry.siemens.com/tf/ww/en/posts/how-to-setup-the-iot2050/238945/?page=0&pageSize=10).

## Installing the SD-Card Example Image

1. Using [7-Zip](https://www.7-zip.de/) download and extract the pre-built image, which can found in the downloads section of
   [the first release](https://github.com/JensD98/iot2050-demo-python/releases/tag/untagged-a8cfe2056ca56095a4a4).
2. From here follow the
   [setup instructions](https://support.industry.siemens.com/tf/ww/en/posts/how-to-setup-the-iot2050/238945/?page=0&pageSize=10)
   to complete the installation. Note the instruction is using a different image which has some problems when trying to install Docker, make sure to use the **pre-built image** provided in the previous step!
