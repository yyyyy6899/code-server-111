FROM lscr.io/linuxserver/code-server:latest

ENV TZ=Etc/UTC \
    DEFAULT_WORKSPACE=/config/workspace \
    PWA_APPNAME=code-server \
    PASSWORD=JGG8Z7se4!UM#c7R6Q#%#K#&^9isH$

USER root

# -------------------------
# Install required system dependencies
# -------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        wget \
        git \
        build-essential \
        python3 \
        python3-pip \
        python3-venv \
        nodejs \
        npm \
        ca-certificates \
        file \
        procps \
        sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# -------------------------
# Install Theme Extension
# -------------------------
RUN code-server --install-extension GoodM4ven.extension-vsc-community-material-theme-darker-high-contrast

# -------------------------
# Set Default Theme
# -------------------------
RUN mkdir -p /config/.config/Code/User && \
    echo '{ \
      "workbench.colorTheme": "Community Material Theme Darker High Contrast", \
      "editor.fontSize": 14 \
    }' > /config/.config/Code/User/settings.json

# -------------------------
# Install Linuxbrew (Homebrew for Linux)
# -------------------------
RUN git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew && \
    mkdir -p /home/linuxbrew/.linuxbrew/bin && \
    ln -s /home/linuxbrew/.linuxbrew/bin/brew /usr/local/bin/brew

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
