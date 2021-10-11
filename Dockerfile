FROM gitpod/workspace-full

# Setup environment
ENV COMPOSER="2.1.9"
ENV	DRUPALORG_CLI="0.3.0"
ENV	DRUPAL_CODE_GENERATOR="2.1.1"

SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update && sudo apt-get install -y \
	rsync \
	git-svn \
	screen \
	tmux \
	sass

# Install ruby gems
RUN sudo gem install \
	teamocil \
	capistrano

# Install composer 2.x (replace existing)
RUN sudo wget -q https://getcomposer.org/download/${COMPOSER}/composer.phar && \
    sudo chmod +x composer.phar && \
    sudo mv composer.phar /usr/bin/composer && \
    echo "export PATH=\"\$HOME/.composer/vendor/bin:\$PATH\"" >>  ~/.bashrc && \
    echo "export PATH=\"\$HOME/.composer/vendor/bin:\$PATH\"" >>  ~/.zshrc

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

# Install drupal-code-generator
RUN sudo wget https://github.com/Chi-teck/drupal-code-generator/releases/download/${DRUPAL_CODE_GENERATOR}/dcg.phar && \
	sudo chmod +x dcg.phar && \
	sudo mv dcg.phar /usr/local/bin/dcg

# Install deployer
RUN sudo curl -LO https://deployer.org/deployer.phar && \
	sudo chmod +x deployer.phar && \
	sudo mv deployer.phar /usr/local/bin/dep

# Install phpbrew
RUN sudo curl -LO https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar && \
 	sudo chmod +x phpbrew.phar && \
	sudo mv phpbrew.phar /usr/local/bin/phpbrew && \
	echo -e "[[ -e ~/.phpbrew/bashrc ]]" >> ~/.bashrc && \
	echo -e "[[ -e ~/.phpbrew/zshrc ]]" >> .zshrc

# Install npm packages
RUN npm install -g \
	husky \
	artillery \
	grunt-cli \
	gulp-cli \
	yo

# Install python packages
# RUN sudo ~/.pyenv/shims/python -m pip install \
# 	ansible \
# 	bzt

# Install global composer packages
RUN composer global require \
	szeidler/composer-patches-cli \
	ergebnis/composer-normalize \
	tightenco/takeout

# Install phpcs
RUN sudo wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    sudo chmod +x phpcs.phar && \
    sudo mv phpcs.phar /usr/local/bin/phpcs

# Install phpcbf
RUN sudo wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && \
    sudo chmod +x phpcbf.phar && \
    sudo mv phpcbf.phar /usr/local/bin/phpcbf

# Install brew packages
RUN brew update && brew install \
	k6 \
	vegeta \
	plow \
	drud/ddev/ddev

RUN mkcert -install

# Install lando
RUN sudo wget https://files.lando.dev/installer/lando-x64-stable.deb && \
	sudo dpkg -i --ignore-depends docker-ce,iptables lando-x64-stable.deb && \
	sudo rm -rf lando-x64-stable.deb && \
	mkdir -p ~/.lando && \
	echo -e "proxy: 'ON'\nproxyHttpPort: '8080'\nproxyHttpsPort: '4443'\nbindAddress: '0.0.0.0'\nproxyBindAddress: '0.0.0.0'" > ~/.lando/config.yml

# ToDo: Add aliases file for composer packages and commands
