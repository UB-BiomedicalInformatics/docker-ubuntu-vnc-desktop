FROM dorowu/ubuntu-desktop-lxde-vnc as system



ENV DEBIAN_FRONTEND noninteractive
RUN apt update \
    && apt install -y --no-install-recommends --allow-unauthenticated \
        vim \
        p7zip-full \
        r-base \
        gdebi-core \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*
    
# install debs error if combine together
RUN apt update \
    && apt remove -y --no-install-recommends --allow-unauthenticated \
        firefox ttf-ubuntu-font-family ttf-wqy-zenhei  \
        google-chrome-stable
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*
