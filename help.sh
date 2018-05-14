#!/bin/bash

MAINTAINER="me@lehungio.com"

readonly NAME="liho"
readonly REPO_NAME="php-apache"
readonly REPO="https://github.com/lehungio/$REPO_NAME"
readonly FULL_PATH="$( cd "$( dirname "$0" )" && pwd )"
readonly LIHO_PATH="/code"
readonly PUBLIC_PATH="/code/public_html"
readonly LOCALHOST="127.0.0.1"

helps() {
	case $1 in
		all|*) allhelps ;;
	esac
}

allhelps() {
cat <<EOF
NAME: ${NAME}
PATH: ${FULL_PATH}
REPO: ${REPO}
MAINTAINER: ${MAINTAINER}

Usage: ./help.sh COMMAND
[help|usage|build|init|up|down|restart|status|logs|ssh]
[Commands]
  build        Build docker service
  up or start  Run docker-compose as daemon (or up)
  down or stop Terminate all docker containers run by docker-compose (or down)
  restart      Restart docker-compose containers
  status       View docker containers status
  logs         View docker containers logs
  ssh          ssh cli
EOF
}

# Usage
usage() {
	echo "Usage:"
	echo "${0} [help|usage|build|init|up|down|restart|status|logs|ssh]"
}

# Docker compose build
build() {
	docker-compose build
}

run_init() {
  case $1 in
    test)
      pwd;
      ls;
    ;;
    env|api)
      rsync -avz  ${FULL_PATH}/env ${FULL_PATH}/.env
      docker-compose build
      docker-compose up
      docker-compose ps
    ;;
    help|*)
      echo "Welcome to ${NAME}"
    ;;
	esac
}

# Docker compose up
start() {
	docker-compose up -d
}

# Docker compose down
stop() {
	docker-compose down
}

# Docker compose restart
restart() {
	docker-compose restart
}

# Docker compose status
status() {
	docker-compose ps
}

# Docker compose logs
logs() {
	case $1 in
		liho|*)  docker-compose logs ;;
	esac
}

# ssh cli
dockerssh() {
	case $1 in
		liho|*) docker-compose exec ${NAME} /bin/bash ;;
	esac
}

case $1 in
	init) run_init ${2:-help};;
	build) build ;;
	start|up) start ;;
	stop|down) stop ;;
	restart|reboot) restart ;;
	status|ps) status ;;
	logs) logs ${2:-all} ;;
	ssh) dockerssh ${2:-php} ;;
	*) helps ;;
esac
