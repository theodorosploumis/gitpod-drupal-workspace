source

# Basic aliases
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias autoremove="sudo apt-get autoremove"
alias fix-broken="sudo apt --fix-broken install"
alias package-reconfigure="sudo dpkg --configure -a"

# Utilities
alias ssh-show="cat ~/.ssh/id_rsa.pub"
alias untar="tar -xvzf"
alias ls-only-files="ls -p | grep -v /"
alias ls-mod="stat -c '%A %a %U:%G %s %n' *"

# Lando related commands
alias lad="lando drush"
alias lac="lando composer"

# ddev related commands
alias dvd="ddev drush"
alias dvc="ddev composer"

# Composer packages commands
alias cgr="~/.config/composer/vendor/bin/cgr"
alias takeout="~/.config/composer/vendor/bin/takeout"
alias mage="~/.config/composer/vendor/bin/mage"
alias dgc="~/.config/composer/vendor/bin/dcg"
alias drupal-check="~/.config/composer/vendor/bin/drupal-check"
alias phpstan"~/.config/composer/vendor/bin/phpstan"

# Aliases Git
alias st="gs"
alias git-undo="git reset --soft HEAD^"
alias git-reset="git reset --hard"
alias git-unstage="git reset HEAD --"
alias gac="git add --all && git commit -am 'Git auto commit' && git push"
alias git-graph='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'
alias git-remove-local-tags="git tag | xargs git tag -d"
alias git-remove-remote-tags="git tag -l | xargs -n 1 git push --delete origin"
alias git-inline-diff="git diff --ignore-all-space --word-diff=color  --unified=0 HEAD^1..HEAD"
alias git-inline-diff-unstaged="git diff --ignore-all-space --word-diff=color  --unified=0"

# Other functions
function show-exif() {
	identify -verbose $@ | grep "exif:"
}

function tmux-session() {
	tmux new-session -d 'teamocil "$@"' \; attach
}

# creates a directory and cds into it
function din() {
	mkdir -p "$@" && cd "$@"
}

# php built-in server on current directory. Port as an argument.
function php-server() {
	php -S localhost:${1}
}

# SSH login shortcut
# $ ssh-login [USER] [SERVER] [DOMAIN] [SUBDOMAIN]
function ssh-login() {
	ssh ${1}@${2} -t "cd ~/${3}/${4}; bash"
}

#######################

# Docker
alias dimages="docker images | less -S"
alias dimages-repo="docker images | sort -k 1 | less -S"
alias dimages-date="docker images | sort -s -n -k 5,5 | less -S"
alias dimages-size="docker images | sort -s -n -k 7,7 | less -S"

function dimg-name {
  docker images --format 'table {{.Repository}}\t{{.Tag}}\t{{.Size}}' | awk '{print $1 " " $2 " " $3 $4 }' | sort -n -k1,1
}

function dimg {
  docker images $@ |
    sed "s/  \+/;/g" |
    column -s\; -t |
    sed "1s/.*/\x1B[1m&\x1B[m/"
}

function docker-images-size {
  docker images $@ |
  sed "s/  \+/;/g" |
  column -s\; -t |
  sed "1s/.*/\x1B[1m&\x1B[m/" |
  awk '{ sum += $7 } END { print "Docker images total: " sum " MB"}'
}

# Remove all networks
function docker-rm-network() {
  docker network rm $(docker network ls --format '{{.Name}}')
}

# Show running container
function docker-count() {
  docker ps -q $1 | wc -l
}

# Remove all unamed images
alias docker-rm-volumes="docker volume prune"

function docker-rm-none(){
  echo -n "Removing <none> images...\n"
  docker rmi $(docker images | grep '<none>' | awk '{print $3}')
}

# Remove all stopped containers
function docker-rm-stopped() {
  echo -n "Removing stopped containers...\n"
  docker rm -v $(docker ps -a -q -f status=exited)
}

# Stop and remove ALL containers!
function docker-rma() {
  echo -n "Stopping all containers..."
  docker stop $(docker ps -aq)
  echo -n "Removing all containers..."
  docker rm $(docker ps -aq)
}

# /bin/sh into a docker container
function docker-sh() {
  echo -n "/bin/sh into container $@\n"
  docker exec -it "$@" /bin/sh
}

# /bin/bash into a docker container
function docker-bash() {
  echo -n "/bin/bash into container $@\n"
  docker exec -it "$@" /bin/bash
}

# Pull all images
function docker-pull-all(){
  echo -n "Pulling all images... That may need time.\n"
  docker images | awk '(NR>1) && ($2!~/none/) {print $1":"$2}' | xargs -L1 docker pull
}

################

# Commands to help with CI/CD
alias ci-build="docker build . -t tplcom/gitpod-drupal-workspace"
alias ci-ssh="docker run -ti tplcom/gitpod-drupal-workspace bash"
alias ci-push="docker push tplcom/gitpod-drupal-workspace:latest"

function commands(){
  for line in $(cat ~/commands.md)
  do
    echo -e $line
  done
}
