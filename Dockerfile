FROM php:8.0.7-cli-alpine3.13
RUN apk add composer
RUN docker-php-ext-install pdo_mysql
RUN apk add npm
WORKDIR /app
COPY ./src . 
RUN composer install
RUN npm install
RUN npm run dev
CMD ./artisan serve --host=0.0.0.0 --port=8000
