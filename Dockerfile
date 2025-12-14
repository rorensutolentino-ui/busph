# Use PHP 8.2 as base image
FROM php:8.2-cli

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy composer files
COPY composer.json composer.lock ./

# Install dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Copy application files
COPY . .

# Expose port (Railway will set PORT env variable)
EXPOSE 8080

# Start PHP built-in server
CMD php -S 0.0.0.0:${PORT:-8080} -t public

