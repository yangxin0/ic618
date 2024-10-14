FROM rockylinux:8.9.20231119

RUN yum makecache

RUN yum install -y ksh csh vim gcc make wget

RUN yum install -y \
    libXt.x86_64 \
    libXScrnSaver.x86_64 \
    mesa-libGL.x86_64 \
    mesa-libGLU.x86_64 \
    libnsl.x86_64 \
    redhat-lsb \
    mesa-dri-drivers.x86_64 \
    xorg-x11-fonts-100dpi \
    xorg-x11-fonts-75dpi \
    libxkbcommon.x86_64

RUN mkdir -p /eda/log && \
    mkdir -p /eda/license && \
    mkdir -p /eda/Tech

RUN cd /eda && \
    wget http://127.0.0.1:8000/IC618.tar.gz && \
    tar xzf IC618.tar.gz && \
    rm IC618.tar.gz

RUN cd /eda && \
    wget http://127.0.0.1:8000/SPECTRE181.tar.gz && \
    tar xzf SPECTRE181.tar.gz && \
    rm SPECTRE181.tar.gz

RUN cd /eda/Tech && \
    wget http://127.0.0.1:8000/TSMC65N.tar.gz && \
    tar xzf TSMC65N.tar.gz && \
    rm TSMC65N.tar.gz

COPY license.dat /eda/license
COPY source.sh /eda
COPY cds.lib /root
RUN echo "source /eda/source.sh" >> /root/.bashrc

# Fix cdnshelp
RUN cd /etc/pki/tls/ && mv openssl.cnf openssl.cnf.bak

WORKDIR /root
CMD ["/bin/bash"]
