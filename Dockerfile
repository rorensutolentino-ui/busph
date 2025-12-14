# Use PHP 8.2 as base image
FROM php:8.2-cli

# Install system dependencies (zip, unzip, git, and libzip-dev for PHP extension)
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP zip extension
RUN docker-php-ext-install zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy composer files
COPY composer.json composer.lock ./

# Install dependencies (ignore platform requirements for PHP version compatibility)
RUN composer install --no-dev --optimize-autoloader --no-interaction --ignore-platform-reqs

# Copy application files
COPY . .

# Make startup script executable
RUN chmod +x start.sh

# Expose port (Railway will set PORT env variable)
EXPOSE 8080

# Start PHP built-in server using startup script
CMD ["./start.sh"]

