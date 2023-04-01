# base image
FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive

ENV CHROME_VERSION "111.0.5563.64"
ENV FIREFOX_VERSION "111.0.1"

# installing of work directory (by default) in image
WORKDIR /autotests

# installing of requirements
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
        software-properties-common \
        gnupg \
        ca-certificates \
	; \
    add-apt-repository --yes ppa:deadsnakes/ppa; \
    apt-get install -y --no-install-recommends \
        python3.11 \
        python3-pip \
        wget \
        curl \
        unzip \
    ; \
    apt-get purge -y firefox; \
    wget -O ~/FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-${FIREFOX_VERSION}&os=linux64"; \
    tar xjf ~/FirefoxSetup.tar.bz2; \
    ln -s .firefox/firefox /usr/lib/firefox/firefox; \
    wget --no-check-certificate https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb; \
    apt-get install -qqyf ./google-chrome-stable_${CHROME_VERSION}_amd64.deb; \
    rm google-chrome-stable_${CHROME_VERSION}_amd64.deb; \
    wget https://chromedriver.storage.googleapis.com/${CHROME_VERSION}/chromedriver_linux64.zip; \
    unzip chromedriver_linux64.zip; \
    mv /usr/bin/google-chrome-stable /usr/bin/google-chrome; \
    wget https://github.com/mozilla/geckodriver/releases/download/v0.32.2/geckodriver-v0.32.2-linux64.tar.gz; \
    tar -xvzf geckodriver*; \
    chmod +x geckodriver; \
    mv geckodriver /usr/local/bin/; \
	rm -rf /var/lib/apt/lists/*

# copying project to image
COPY . .

# installing requirements from pip
RUN pip3 install -r requirements.txt

# start script after container start
ENTRYPOINT ["python3", "app.py"]