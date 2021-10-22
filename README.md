[![Open in Gitpod](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/theodorosploumis/gitpod-drupal-workspace)

# Gitpod Drupal workspace
An opinionated Docker image you can use with [Gitpod.io](https://www.gitpod.io) as also as any other Docker based development tool.
Focused on **Drupal** 8+ development.

## Source code
- [github.com/theodorosploumis/gitpod-drupal-workspace](https://github.com/theodorosploumis/gitpod-drupal-workspace)

## Docker image
- [tplcom/gitpod-drupal-workspace](https://hub.docker.com/r/tplcom/gitpod-drupal-workspace)

## Usage

Simply, on your `.gitpod.yml` file start from this image:

```Dockerfile
image: tplcom/gitpod-drupal-workspace
```

## Software installed

> Check the [commands.md](commands.md) file to get a summary of the installed tools.
> Inside docker image run `commands` to get the equivalent list.

Docker environments:

- [ddev](https://ddev.readthedocs.io/en)
- [lando](https://docs.lando.dev)

PHP tools:

- [deployer](https://deployer.org)
- [captainhook](https://github.com/captainhookphp/captainhook)
- [codeception](https://github.com/codeception/codeception)
- [GrumPHP](https://github.com/phpro/grumphp)
- [Magallanes](https://github.com/andres-montanez/Magallanes)
- [phan](https://github.com/phan/phan)
- [phive](https://github.com/phar-io/phive)
- [phing](https://www.phing.info)
- [phpbrew](https://github.com/phpbrew/phpbrew)
- [phpcbf, phpcs (PHP_CodeSniffer)](https://github.com/squizlabs/PHP_CodeSniffer)
- [phpcpd](https://github.com/sebastianbergmann/phpcpd)
- [phpmd](https://phpmd.org)
- [phpmetrics](https://github.com/phpmetrics/PhpMetrics)
- [robo](https://robo.li)
- [security-checker](https://github.com/enlightn/security-checker)
- [wp-cli](https://wp-cli.org/)

Drupal related tools:

- [drupal-code-generator (dcg)](https://github.com/Chi-teck/drupal-code-generator)
- [drush-launcher](https://github.com/drush-ops/drush-launcher)
- [drupalorg-cli](https://github.com/mglaman/drupalorg-cli)

Composer packages:

- [composer 2.x](https://getcomposer.org)
- [consolidation/cgr](https://github.com/consolidation/cgr)
- [ergebnis/composer-normalize](https://github.com/ergebnis/composer-normalize)
- [mglaman/drupal-check](https://github.com/mglaman/drupal-check)
- [szeidler/composer-patches-cli](https://github.com/szeidler/composer-patches-cli)
- [tightenco/takeout (docker scaffolding)](https://github.com/tighten/takeout)

Nodejs packages:

- [artilleryio/artillery (load testing)](https://github.com/artilleryio/artillery)
- [flood-io/element (load testing)](https://github.com/flood-io/element)
- [grunt-cli](https://gruntjs.com)
- [gulp-cli](https://gulpjs.com)
- [husky](https://github.com/typicode/husky)
- [yeoman](https://yeoman.io)

Python packages:

- [bzt (Taurus testing)](https://gettaurus.org)
- [SamJoan/droopescan](https://github.com/SamJoan/droopescan)

Other tools:

- [ansible](https://docs.ansible.com)
- [brew (inherited from base image)](https://brew.sh/)
- [capistrano](https://capistranorb.com)
- [git-crypt](https://github.com/AGWA/git-crypt)
- [git-svn](https://git-scm.com/docs/git-svn)
- [k6 (load testing)](https://github.com/grafana/k6)
- [remi/teamocil](https://github.com/remi/teamocil)
- [rsync](https://rsync.samba.org)
- [rupa/z](https://github.com/rupa/z)
- [sass](https://sass-lang.com)
- [scmbreeze/scm_breeze](https://github.com/scmbreeze/scm_breeze)
- [screen](http://www.gnu.org/software/screen)
- [tmux/tmux](https://github.com/tmux/tmux)

## Similar tools

Inspired by:

- https://github.com/shaal/DrupalPod
- https://github.com/hussainweb/drupalqa
- https://github.com/jakzal/phpqa/

## Licence

- [MIT](LICENSE) 2021 - https://www.TheodorosPloumis.com
