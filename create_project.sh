docker compose up -d
docker compose exec web composer create-project --prefer-dist "laravel/laravel=8.*" .
docker compose exec web php artisan key:generate
docker compose exec web php artisan storage:link
docker compose exec web php artisan migrate:fresh --seed
sudo cp docker/web/composer.json backend/
sudo cp docker/web/composer.lock backend/
docker compose exec web composer install
sudo cp docker/web/package.json backend/
sudo cp docker/web/package-lock.json backend/
docker compose exec web npm install
