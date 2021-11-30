FROM gitpod/workspace-full

# Setup environment (software versions)
ENV BEHAT="v3.9.0"
ENV CAPTAINHOOK="5.10.4"
ENV COMPOSER="2.1.9"
ENV	COMPOSER_NORMALIZE="2.15.0"
ENV	DRUPALORG_CLI="0.3.2"
ENV	DRUPAL_CODE_GENERATOR="2.2.0"
ENV	GRUMPHP="v1.5.0"
ENV PHAN="5.2.1"
ENV PHPMETRICS="v2.7.3"
ENV ROBO="3.0.4"

ENV PHPBREW_SET_PROMPT=1

SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update && sudo apt-get install --no-install-recommends -y \
	ansible \
	rsync \
	git-svn \
	screen \
	tmux \
	sass \
	libzip-dev \
	libonig-dev \
	php-pear

# Install ruby gems
RUN gem install --user-install --quiet \
	teamocil \
	capistrano

# Add gem bin to path
RUN export GEM_HOME="$(ruby -e 'puts Gem.user_dir')" >>  ~/.bashrc && \
	export PATH="$PATH:$GEM_HOME/bin" >>  ~/.bashrc && \
	export GEM_HOME="$(ruby -e 'puts Gem.user_dir')" >>  ~/.zshrc && \
	export PATH="$PATH:$GEM_HOME/bin" >>  ~/.zshrc

# Install composer 2.x (replace existing)
RUN sudo wget --quiet -q https://getcomposer.org/download/${COMPOSER}/composer.phar && \
    sudo chmod +x composer.phar && \
    sudo mv composer.phar /usr/bin/composer && \
    echo "export PATH=\"\$HOME/.config/composer/vendor/bin:\$PATH\"" >>  ~/.bashrc && \
    echo "export PATH=\"\$HOME/.config/composer/vendor/bin:\$PATH\"" >>  ~/.zshrc

# Install global composer packages
RUN composer global require --quiet \
	szeidler/composer-patches-cli \
	tightenco/takeout \
	andres-montanez/magallanes \
	consolidation/cgr \
	mglaman/drupal-check

# Install behat
RUN sudo wget --quiet https://github.com/Behat/Behat/releases/download/${BEHAT}/behat.phar && \
	sudo chmod +x behat.phar && \
	sudo mv behat.phar /usr/local/bin/behat

# Install captainhook
RUN sudo wget --quiet https://github.com/captainhookphp/captainhook/releases/download/${CAPTAINHOOK}/captainhook.phar && \
	sudo chmod +x captainhook.phar && \
	sudo mv captainhook.phar /usr/local/bin/captainhook

# Install codeception
RUN sudo wget --quiet http://codeception.com/codecept.phar && \
	sudo chmod +x codecept.phar && \
	sudo mv codecept.phar /usr/local/bin/codecept

# Install drush-lanucher
RUN sudo wget --quiet -O drush.phar https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar && \
	sudo chmod +x drush.phar && \
	sudo mv drush.phar /usr/local/bin/drush

# Install drupalorg-cli
RUN sudo wget --quiet https://github.com/mglaman/drupalorg-cli/releases/download/${DRUPALORG_CLI}/drupalorg.phar && \
	sudo chmod +x drupalorg.phar && \
	sudo mv drupalorg.phar /usr/local/bin/drupalorg

# Install drupal-code-generator
RUN sudo wget --quiet https://github.com/Chi-teck/drupal-code-generator/releases/download/${DRUPAL_CODE_GENERATOR}/dcg.phar && \
	sudo chmod +x dcg.phar && \
	sudo mv dcg.phar /usr/local/bin/dcg

# Install deployer
RUN sudo wget --quiet https://deployer.org/deployer.phar && \
	sudo chmod +x deployer.phar && \
	sudo mv deployer.phar /usr/local/bin/dep

# Install grumphp
RUN sudo wget --quiet https://github.com/phpro/grumphp/releases/download/${GRUMPHP}/grumphp.phar && \
	sudo chmod +x grumphp.phar && \
	sudo mv grumphp.phar /usr/local/bin/grumphp

# Install phan
RUN sudo wget --quiet https://github.com/phan/phan/releases/download/${PHAN}/phan.phar && \
	sudo chmod +x phan.phar && \
	sudo mv phan.phar /usr/local/bin/phan

# Install phing
RUN sudo wget --quiet https://www.phing.info/get/phing-latest.phar && \
	sudo chmod +x phing-latest.phar && \
	sudo mv phing-latest.phar /usr/local/bin/phing

# Install phive
RUN sudo wget --quiet https://phar.io/releases/phive.phar && \
	sudo chmod +x phive.phar && \
	sudo mv phive.phar /usr/local/bin/phive

# Install phpmd
RUN sudo wget --quiet https://phpmd.org/static/latest/phpmd.phar && \
	sudo chmod +x phpmd.phar && \
	sudo mv phpmd.phar /usr/local/bin/phpmd

# Install phpcpd
RUN sudo wget --quiet https://phar.phpunit.de/phpcpd.phar && \
	sudo chmod +x phpcpd.phar && \
	sudo mv phpcpd.phar /usr/local/bin/phpcpd

# Install phpcs
RUN sudo wget --quiet https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    sudo chmod +x phpcs.phar && \
    sudo mv phpcs.phar /usr/local/bin/phpcs

# Install phpcbf
RUN sudo wget --quiet https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && \
    sudo chmod +x phpcbf.phar && \
    sudo mv phpcbf.phar /usr/local/bin/phpcbf

# Install phpmetrics
RUN sudo wget --quiet https://github.com/phpmetrics/PhpMetrics/releases/download/${PHPMETRICS}/phpmetrics.phar && \
	sudo chmod +x phpmetrics.phar && \
	sudo mv phpmetrics.phar /usr/local/bin/phpmetrics

# Install robo
RUN sudo wget --quiet https://github.com/consolidation/Robo/releases/download/${ROBO}/robo.phar && \
    sudo chmod +x robo.phar && \
    sudo mv robo.phar /usr/bin/robo

# Install security-checker
RUN sudo wget --quiet https://www.laravel-enlightn.com/security-checker.phar && \
	sudo chmod +x security-checker.phar && \
	sudo mv security-checker.phar /usr/local/bin/security-checker

# Install composer-normalize
RUN sudo wget --quiet https://github.com/ergebnis/composer-normalize/releases/download/${COMPOSER_NORMALIZE}/composer-normalize.phar && \
	sudo chmod +x composer-normalize.phar && \
	sudo mv composer-normalize.phar /usr/local/bin/composer-normalize

# Install phpbrew
RUN sudo wget --quiet https://github.com/phpbrew/phpbrew/releases/latest/download/phpbrew.phar && \
 	sudo chmod +x phpbrew.phar && \
	sudo mv phpbrew.phar /usr/bin/phpbrew && \
	echo -e "export PHPBREW_SET_PROMPT=0" >> ~/.bashrc && \
	echo -e "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" >> ~/.zshrc && \
	echo -e "export PHPBREW_SET_PROMPT=0" >> ~/.zshrc && \
	echo -e "[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc" >> ~/.zshrc

# Install php8 with phpbrew
RUN sudo mkdir -p /opt/phpbrew && sudo chmod -R 777 /opt/phpbrew && sudo chown gitpod /opt/phpbrew && \
	phpbrew init --root=/opt/phpbrew && \
	phpbrew install php-8.0.13 as php-8 +default +gd && \
	phpbrew install php-7.4.26 as php-7 +default +gd

# Install wp-cli
RUN sudo wget --quiet https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
 	sudo chmod +x wp-cli.phar && \
	sudo mv wp-cli.phar /usr/local/bin/wp

# Install npm packages
RUN npm install -g --quiet \
	husky \
	artillery \
	grunt-cli \
	gulp-cli \
	yo

# Install python packages
RUN sudo ~/.pyenv/shims/python -m pip install --quiet \
	bzt \
	droopescan

# Install scm_breeze
RUN git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze && \
    ~/.scm_breeze/install.sh && \
    source ~/.bashrc && \
    source ~/.zshrc

# Install rupa/z
RUN curl -o ~/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh && \
	chmod +x ~/z.sh && \
	echo -e ". ~/z.sh" >> ~/.bashrc && \
	echo -e ". ~/z.sh" >> .zshrc

# Install brew packages
RUN brew update && brew install \
	drud/ddev/ddev \
	k6

RUN mkcert -install

# Install lando
RUN sudo wget --quiet https://files.lando.dev/installer/lando-x64-stable.deb && \
	sudo dpkg -i --ignore-depends docker-ce,iptables lando-x64-stable.deb && \
	sudo rm -rf lando-x64-stable.deb && \
	mkdir -p ~/.lando && \
	echo -e "proxy: 'ON'\nproxyHttpPort: '8080'\nproxyHttpsPort: '4443'\nbindAddress: '0.0.0.0'\nproxyBindAddress: '0.0.0.0'" > ~/.lando/config.yml

# Copy files we need
ADD .bash_aliases commands.md /home/gitpod/
RUN sudo chmod 777 /home/gitpod/.bash_aliases && \
	sudo chown gitpod /home/gitpod/.bash_aliases
