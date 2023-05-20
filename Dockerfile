FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    curl \
    libasound2-dev \
    libcurl4-openssl-dev \
    libdrm-dev \
    libglib2.0-dev \
    libgtk-3-dev \
    libnotify-dev \
    libssl-dev \
    libx11-dev \
    libxcomposite-dev \
    libxdamage-dev \
    libxext-dev \
    libxfixes-dev \
    libxft-dev \
    libxi-dev \
    libxinerama-dev \
    libxml2-dev \
    libxrandr-dev \
    libxrender-dev \
    pkg-config \
    xorg-dev \
    xvfb \
    gstreamer1.0-plugins-bad

# Install the surf browser
RUN curl -L https://surf.suckless.org/files/surf-2.1.tar.gz | tar zxv && cd surf-2.1 && make && make install

# Set up the browser
RUN mkdir -p /usr/local/bin
RUN echo "#!/bin/sh\nxvfb-run -a surf -p 8000 https://www.youtube.com/" > /usr/local/bin/start-browser
RUN chmod +x /usr/local/bin/start-browser

# Expose the browser port
EXPOSE 8000

# Start the browser on container launch
CMD ["/usr/local/bin/start-browser"]
