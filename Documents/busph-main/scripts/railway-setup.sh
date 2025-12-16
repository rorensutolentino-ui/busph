#!/bin/bash

# Railway Setup Script for Laravel Application
# This script can be run manually or as a deploy hook

set -e

echo "🚀 Starting Railway setup..."

# Run migrations
echo "📦 Running database migrations..."
php artisan migrate --force

# Cache configuration for better performance
echo "⚡ Caching configuration..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Create storage link if it doesn't exist
echo "🔗 Creating storage link..."
php artisan storage:link || true

echo "✅ Setup complete!"

