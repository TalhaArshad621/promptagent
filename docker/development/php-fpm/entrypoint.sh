#!/bin/bash
set -e

# Change to working directory
cd /var/www

# Ensure correct permissions for Laravel storage & cache (dev-friendly)
chown -R www:www storage bootstrap/cache || true
chmod -R 775 storage bootstrap/cache || true

# If any arguments are passed, execute them
# This allows Docker CMD ["php-fpm"] to work
exec "$@"
