FROM lscr.io/linuxserver/code-server:latest

ENV TZ=Etc/UTC \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server \
    PASSWORD=JGG8Z7se4!UM#c7R6Q#%#K#&^9isH$

USER root

# Install required system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        wget \
        git \
        build-essential \
        python3 \
        python3-pip \
        python3-venv \
        ca-certificates \
        file \
        procps \
        sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# -------------------------
# Install Node.js 20 and npm
# -------------------------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# -------------------------
# Install Linuxbrew (Homebrew for Linux)
# -------------------------
RUN git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew && \
    mkdir -p /home/linuxbrew/.linuxbrew/bin && \
    ln -s /home/linuxbrew/.linuxbrew/bin/brew /usr/local/bin/brew

# Add Brew to PATH
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

# -------------------------
# Verify installations
# -------------------------
RUN node -v && \
    npm -v && \
    python3 --version && \
    pip3 --version && \
    brew --version

EXPOSE 8443
VOLUME ["/config"]
