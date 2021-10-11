[![Open in Gitpod](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/theodorosploumis/gitpod-drupal-workspace)

# Gitpod Drupal workspace
An opinionated Docker image you can use with [Gitpod.io](https://www.gitpod.io/).
Focused on **Drupal** 8+ development.

## Docker image
- [tplcom/gitpod-drupal-workspace](https://hub.docker.com/r/tplcom/gitpod-drupal-workspace)

## Usage

Simply, on your `.gitpod.yml` file use this image:

```Dockerfile
image: tplcom/gitpod-drupal-workspace
```

## Software installed

Docker environments:

- [ddev](https://ddev.readthedocs.io/en)
- [lando](https://docs.lando.dev)
- [tightenco/takeout](https://github.com/tighten/takeout)

PHP tools:

- [deployer](https://deployer.org)
- [phpbrew](https://github.com/phpbrew/phpbrew)
- [phpcbf.phar, phpcs.phar](https://github.com/squizlabs/PHP_CodeSniffer)
- [robo](https://robo.li)

Drupal related tools:

- [drush-code-generator (dcg)](https://github.com/Chi-teck/drupal-code-generator)
- [drush-launcher](https://github.com/drush-ops/drush-launcher)
- [drupalorg-cli](https://github.com/mglaman/drupalorg-cli)

Composer packages:

- [composer 2.x](https://getcomposer.org)
- [ergebnis/composer-normalize](https://github.com/ergebnis/composer-normalize)
- [szeidler/composer-patches-cli](https://github.com/szeidler/composer-patches-cli)

Nodejs packages:

- [artilleryio/artillery](https://github.com/artilleryio/artillery)
- [flood-io/element (cli)](https://github.com/flood-io/element)
- [grunt-cli](https://gruntjs.com)
- [gulp-cli](https://gulpjs.com)
- [typicode/husky](https://github.com/typicode/husky)
- [yeoman](https://yeoman.io)

Go packages:

- [grafana/k6 (load testing)](https://github.com/grafana/k6)
- [six-ddc/plow (load testing)](https://github.com/six-ddc/plow)
- [Blazemeter/taurus (load testing)](https://github.com/Blazemeter/taurus)
- [tsenart/vegeta (load testing)](https://github.com/tsenart/vegeta)

Other tools:

- [ansible](https://docs.ansible.com)
- [capistrano](https://capistranorb.com)
- [git-crypt](https://github.com/AGWA/git-crypt)
- [git-svn](https://git-scm.com/docs/git-svn)
- [remi/teamocil](https://github.com/remi/teamocil)
- [rsync](https://rsync.samba.org)
- [sass](https://sass-lang.com)
- [scmbreeze/scm_breeze](https://github.com/scmbreeze/scm_breeze)
- [screen](http://www.gnu.org/software/screen)
- [tmux/tmux](https://github.com/tmux/tmux)

## ToDo

Add aliases file for composer packages and commands.

## Licence

- [MIT](LICENSE) 2021 - https://www.TheodorosPloumis.com
