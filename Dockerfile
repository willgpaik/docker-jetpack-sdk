FROM ubuntu:18.04

ARG USER_ID
ARG GROUP_ID

# Add user to sudoers
RUN apt-get update && apt-get install -y sudo
RUN apt update && apt install tzdata -y
ENV TZ="America/New_York"
RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN adduser user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

# Install SDK deps
RUN sudo apt-get update && sudo apt-get install -y \
    libgconf-2-4 \
    libcanberra-gtk-module \
    locales \
    netcat \
    openssh-server \
    usbutils \
    libgtk-3-0 \
    libx11-xcb-dev \
    libxss-dev \
    libnss3 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    nodejs \
    firefox \
    npm

COPY sdkmanager_1.8.0-10363_amd64.deb /
COPY entrypoint.sh /entrypoint.sh
RUN sudo apt-get install -y /sdkmanager_1.8.0-10363_amd64.deb

ENTRYPOINT [ "/entrypoint.sh" ]
