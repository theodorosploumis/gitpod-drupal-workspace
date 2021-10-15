FROM gitpod/workspace-full

# Setup environment (software versions)
ENV COMPOSER="2.1.9"
ENV ROBO="3.0.4"
ENV	DRUPALORG_CLI="0.3.0"
ENV	DRUPAL_CODE_GENERATOR="2.1.1"
ENV	GRUMPHP="v1.5.0"
ENV	COMPOSER_NORMALIZE="2.15.0"

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

# Install global composer packages
RUN composer global require \
	szeidler/composer-patches-cli \
	tightenco/takeout \
	andres-montanez/magallanes

# Install robo
RUN sudo wget https://github.com/consolidation/Robo/releases/download/${ROBO}/robo.phar && \
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

# Install phpcs
RUN sudo wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    sudo chmod +x phpcs.phar && \
    sudo mv phpcs.phar /usr/local/bin/phpcs

# Install phpcbf
RUN sudo wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && \
    sudo chmod +x phpcbf.phar && \
    sudo mv phpcbf.phar /usr/local/bin/phpcbf

# Install phive
RUN sudo wget https://phar.io/releases/phive.phar && \
	sudo chmod +x phive.phar && \
	sudo mv phive.phar /usr/local/bin/phive

# Install phing
RUN sudo wget https://www.phing.info/get/phing-latest.phar && \
	sudo chmod +x phing-latest.phar && \
	sudo mv phing-latest.phar /usr/local/bin/phing

# Install phpmd
RUN sudo wget https://phpmd.org/static/latest/phpmd.phar && \
	sudo chmod +x phpmd.phar && \
	sudo mv phpmd.phar /usr/local/bin/phpmd

# Install grumphp
RUN sudo wget https://github.com/phpro/grumphp/releases/download/${GRUMPHP}/grumphp.phar && \
	sudo chmod +x grumphp.phar && \
	sudo mv grumphp.phar /usr/local/bin/grumphp

# Install composer-normalize
RUN sudo wget https://github.com/ergebnis/composer-normalize/releases/download/${COMPOSER_NORMALIZE}/composer-normalize.phar && \
	sudo chmod +x composer-normalize.phar && \
	sudo mv composer-normalize.phar /usr/local/bin/composer-normalize

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
RUN sudo ~/.pyenv/shims/python -m pip install \
	ansible \
	bzt

# Install scm_breeze
RUN git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze && \
    ~/.scm_breeze/install.sh && \
    source ~/.bashrc && \
    source ~/.zshrc

# Install brew packages
RUN brew update && brew install \
	drud/ddev/ddev \
	k6

RUN mkcert -install

# Install lando
RUN sudo wget https://files.lando.dev/installer/lando-x64-stable.deb && \
	sudo dpkg -i --ignore-depends docker-ce,iptables lando-x64-stable.deb && \
	sudo rm -rf lando-x64-stable.deb && \
	mkdir -p ~/.lando && \
	echo -e "proxy: 'ON'\nproxyHttpPort: '8080'\nproxyHttpsPort: '4443'\nbindAddress: '0.0.0.0'\nproxyBindAddress: '0.0.0.0'" > ~/.lando/config.yml

# Add aliases
ADD .bash_aliases /home/gitpod
