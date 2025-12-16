# Fix: Missing vendor directory

The error occurs because Railway CLI needs the local project to have dependencies installed.

## Solution: Install Composer Dependencies

Run this in PowerShell:

```powershell
composer install
```

**Note:** If you don't have Composer installed:
1. Download Composer from: https://getcomposer.org/download/
2. Or if you have XAMPP, Composer might already be available
3. Try: `php composer.phar install` if you downloaded composer.phar

After `composer install` completes, then run:

```powershell
railway run php artisan migrate --force
```

## Alternative: Run Migrations via Railway Dashboard

If Composer installation takes too long, you can also add migrations to your deployment process by updating `railway.json` to run migrations automatically on deploy.

