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

- [composer 2.x](https://getcomposer.org)
- [ddev](https://ddev.readthedocs.io/en)
- [lando](https://docs.lando.dev)
- [drush-launcher](https://github.com/drush-ops/drush-launcher)
- [deployer](https://deployer.org)
- [robo](https://robo.li)
- [phpcbf.phar, phpcs.phar](https://github.com/squizlabs/PHP_CodeSniffer)
- [drupalorg-cli](https://github.com/mglaman/drupalorg-cli)
- [scm_breeze](https://github.com/scmbreeze/scm_breeze)
- [husky](https://github.com/typicode/husky)
- [rsync](https://rsync.samba.org/)
- [sass](https://sass-lang.com/)
- [szeidler/composer-patches-cli](https://github.com/szeidler/composer-patches-cli)
- [ergebnis/composer-normalize](https://github.com/ergebnis/composer-normalize)
- [roave/security-advisories](https://github.com/Roave/SecurityAdvisories)


## Licence

- [MIT](LICENSE) 2021
