docker compose exec web composer create-project --prefer-dist "laravel/laravel=8.*" .
docker compose exec web php artisan key:generate
docker compose exec web php artisan storage:link
#docker compose exec web php artisan migrate:fresh --seed
docker compose cp docker/web/composer.json web:/work/backend/
docker compose cp docker/web/composer.lock web:/work/backend/
docker compose exec web composer install
docker compose cp docker/web/package.json web:/work/backend/
docker compose cp docker/web/package-lock.json web:/work/backend/
docker compose exec web npm install
