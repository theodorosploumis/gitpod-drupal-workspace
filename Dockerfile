FROM gitpod/workspace-full

MAINTAINER Theodoros Ploumis - www.theodorosploumis.com

# Setup environment
ENV COMPOSER="2.1.9"
ENV	DRUPALORG_CLI="0.3.0"

SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update && sudo apt-get install -y \
	rsync \
	sass

# Install composer 2.x (replace existing)
RUN sudo wget -q https://getcomposer.org/download/${COMPOSER}/composer.phar && \
    sudo chmod +x composer.phar && \
    sudo mv composer.phar /usr/bin/composer

# Install scm_breeze
RUN git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze && \
    ~/.scm_breeze/install.sh && \
    source ~/.bashrc && \
    source ~/.zshrc

# Install robo
RUN sudo wget http://robo.li/robo.phar && \
    sudo chmod +x robo.phar && \
    sudo mv robo.phar /usr/bin/robo

# Install drush-lanucher
RUN sudo wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar && \
	sudo chmod +x drush.phar && \
	sudo mv drush.phar /usr/local/bin/drush

# Install drupalorg-cli
RUN sudo wget https://github.com/mglaman/drupalorg-cli/releases/download/${DRUPALORG_CLI}/drupalorg.phar && \
	sudo chmod +x drupalorg.phar && \
	sudo mv drupalorg.phar /usr/local/bin/drupalorg

# Install deployer
RUN sudo curl -LO https://deployer.org/deployer.phar && \
	sudo chmod +x deployer.phar && \
	sudo mv deployer.phar /usr/local/bin/dep

# Install several development tools
RUN npm install -g \
	husky

# Install composer global tools
RUN composer global require \
	szeidler/composer-patches-cli \
	ergebnis/composer-normalize \
	roave/security-advisories:dev-latest

# Install ddev
RUN brew update && brew install drud/ddev/ddev && mkcert -install

# Install lando
RUN sudo wget https://files.lando.dev/installer/lando-x64-stable.deb && \
	sudo dpkg -i --ignore-depends docker-ce,iptables lando-x64-stable.deb && \
	sudo rm -rf lando-x64-stable.deb && \
	mkdir -p ~/.lando && \
	echo "proxy: 'ON'\nproxyHttpPort: '8080'\nproxyHttpsPort: '4443'\nbindAddress: '0.0.0.0'\nproxyBindAddress: '0.0.0.0'" > ~/.lando/config.yml

