##
# Command line knowledge management
#

init:
	test -h ".git/hooks/pre-commit" || ln -s ".githooks/pre-commit" ".git/hooks/pre-commit" # add .githooks folder to local hooks
	docker-compose build
	$(MAKE) reset

reset:
	docker-compose down --remove-orphans
	docker-compose up -d
	rm -f tmp/pids/server.pid
	@echo "[Sleeping 2 secondes]"
	sleep 2
	docker-compose build
	$(MAKE) bundle-install
	@echo "[Sleeping 12 secondes]"
	@sleep 12
	$(MAKE) initdb
	$(MAKE) ps

initdb:
	docker-compose run web rake db:create # run the db creation
	docker-compose run web rake db:migrate # run the db creation
	docker-compose run web rake db:seed # seed the db

resetdb:
	docker-compose run web rake db:drop
	$(MAKE) initdb

rails_new:
	rails new . # create a new ruby inside the container

run:
	docker-compose up -d # detached mode

start:
	$(MAKE) run

ps:
	 docker-compose ps

down:
	docker-compose down

test_curl_localhost:
	curl localhost:3000

build:
	docker-compose build # build the stack :worker:

bundle-install:
	docker-compose exec web bundle install

brew-bundle:
	brew bundle --verbose # use the Brewfile

makefile_linter:
	make -n Makefile

restart_web:
	docker-compose stop web
	docker-compose start web
	docker-compose ps

routes:
	docker-compose exec web bin/rails routes

tests:
	docker-compose exec web bundle exec rails test