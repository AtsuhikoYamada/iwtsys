up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
laravel-install:
	docker-compose exec web composer create-project --prefer-dist "laravel/laravel=8.*" .
create-project:
	@make build
	@make up
	@make laravel-install
	docker-compose exec web php artisan key:generate
	docker-compose exec web php artisan storage:link
	@make fresh
fresh:
	docker-compose exec web php artisan migrate:fresh --seed
composer-install:
	sudo cp ./docker/php/composer.json ./backend/
	sudo cp ./docker/php/composer.lock ./backend/
	docker-compose exec web composer install
stop:
	docker-compose stop
down:
	docker-compose down --remove-orphans
destroy:
	docker-compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker-compose down --volumes --remove-orphans
logs:
	docker-compose logs
log-web:
	docker-compose logs web
log-db:
	docker-compose logs db
web:
	docker-compose exec web bash
npm-install:
	sudo cp ./docker/php/package.json ./backend/
	sudo cp ./docker/php/package-lock.json ./backend/
	docker-compose exec web npm install
db:
	docker-compose exec db bash
sql:
	docker-compose exec db bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD $$MYSQL_DATABASE'
mysql:
	mysql -u root -ptebasaki -h 127.0.0.1
chmod:
	sudo chmod 777 ./backend/storage/logs
	sudo chmod 777 ./backend/storage/framework/sessions
	sudo chmod 777 ./backend/storage/framework/views
