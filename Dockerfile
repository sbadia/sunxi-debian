FROM debian:wheezy
#FROM emile/wheezy
MAINTAINER Émile Morel

# U-boot part
RUN echo deb http://www.emdebian.org/debian unstable main > /etc/apt/sources.list.d/emdebian.list
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV LC_ALL C
ENV LANGUAGE C
ENV LANG C
RUN apt-get update
RUN apt-get install --force-yes -y emdebian-archive-keyring
RUN apt-get update

# Install packages for kernel and u-boot compilation
RUN apt-get install --force-yes -y gcc-4.7-arm-linux-gnueabihf ncurses-dev uboot-mkimage build-essential git vim libusb-1.0-0-dev pkg-config bc netpbm wget tar bzip2

RUN ln -s /usr/bin/arm-linux-gnueabihf-gcc-4.7 /usr/bin/arm-linux-gnueabihf-gcc

# Install packages for debootstrap
RUN apt-get install --force-yes -y debootstrap dpkg-dev qemu binfmt-support qemu-user-static dpkg-cross
