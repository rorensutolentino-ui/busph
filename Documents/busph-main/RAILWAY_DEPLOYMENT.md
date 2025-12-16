# Railway Deployment Guide - MySQL Setup

This guide will help you deploy your Laravel bus booking application to Railway with MySQL database.

## Prerequisites

- A Railway account (sign up at [railway.app](https://railway.app))
- Your GitHub repository connected to Railway
- Basic understanding of Laravel environment variables

## Step 1: Create MySQL Database on Railway

1. **Log in to Railway Dashboard**
   - Go to [railway.app](https://railway.app) and log in

2. **Create a New Project** (if you haven't already)
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository

3. **Add MySQL Database Service**
   - In your Railway project, click "+ New"
   - Select "Database" → "Add MySQL"
   - Railway will automatically create a MySQL database instance
   - Wait for the database to be provisioned (usually takes 1-2 minutes)

4. **Get Database Connection Details**
   - Click on your MySQL service
   - Go to the "Variables" tab
   - You'll see the following variables automatically created:
     - `MYSQLDATABASE` - Database name
     - `MYSQLUSER` - Database username
     - `MYSQLPASSWORD` - Database password
     - `MYSQLHOST` - Database host
     - `MYSQLPORT` - Database port (usually 3306)
     - `MYSQL_URL` - Full connection URL

## Step 2: Configure Your Laravel Application Service

1. **Add Your Laravel Application** (if not already added)
   - In your Railway project, click "+ New"
   - Select "GitHub Repo"
   - Choose your repository

2. **Set Environment Variables**
   - Click on your Laravel application service
   - Go to the "Variables" tab
   - Add the following environment variables:

### Required Environment Variables

```bash
# Application
APP_NAME="BusPH"
APP_ENV=production
APP_KEY=base64:YOUR_APP_KEY_HERE
APP_DEBUG=false
APP_URL=https://your-app-name.up.railway.app

# Database Connection (from MySQL service)
DB_CONNECTION=mysql
DB_HOST=${{MySQL.MYSQLHOST}}
DB_PORT=${{MySQL.MYSQLPORT}}
DB_DATABASE=${{MySQL.MYSQLDATABASE}}
DB_USERNAME=${{MySQL.MYSQLUSER}}
DB_PASSWORD=${{MySQL.MYSQLPASSWORD}}

# Session & Cache (use database for production)
SESSION_DRIVER=database
CACHE_DRIVER=database
QUEUE_CONNECTION=database

# Mail Configuration (update with your mail service)
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=your_mail_username
MAIL_PASSWORD=your_mail_password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@yourdomain.com
MAIL_FROM_NAME="${APP_NAME}"
```

### Important Notes:

- **Database Variables**: Railway automatically provides database connection variables. Use the `${{MySQL.VARIABLE_NAME}}` syntax to reference them from your MySQL service.
- **APP_KEY**: Generate a new application key by running `php artisan key:generate` locally, then copy the key from your `.env` file.
- **APP_URL**: Update this with your actual Railway app URL (you'll get this after deployment).

## Step 3: Configure Build Settings

Railway should automatically detect your Laravel application. The `railway.json` file in your repository configures:

- **Build Command**: Installs dependencies and builds assets
- **Start Command**: Starts the Laravel server

If you need to customize, you can modify `railway.json`:

```json
{
  "$schema": "https://railway.app/railway.schema.json",
  "build": {
    "builder": "NIXPACKS",
    "buildCommand": "composer install --no-dev --optimize-autoloader && php artisan config:cache && php artisan route:cache && php artisan view:cache && npm ci && npm run build"
  },
  "deploy": {
    "startCommand": "php artisan serve --host=0.0.0.0 --port=$PORT",
    "restartPolicyType": "ON_FAILURE",
    "restartPolicyMaxRetries": 10
  }
}
```

## Step 4: Run Database Migrations

After your application is deployed, you need to run migrations to set up your database tables.

### Option 1: Using Railway CLI (Recommended)

1. **Install Railway CLI**
   ```bash
   npm install -g @railway/cli
   ```

2. **Login to Railway**
   ```bash
   railway login
   ```

3. **Link to your project**
   ```bash
   railway link
   ```

4. **Run migrations**
   ```bash
   railway run php artisan migrate --force
   ```

### Option 2: Using Railway Dashboard

1. Go to your Laravel application service in Railway
2. Click on the "Deployments" tab
3. Click on the latest deployment
4. Open the "Logs" tab
5. Use the "Run Command" feature (if available) to execute:
   ```bash
   php artisan migrate --force
   ```

### Option 3: Using Railway Shell

1. In your Railway dashboard, go to your Laravel service
2. Click on "Settings" → "Generate Shell"
3. Connect to the shell and run:
   ```bash
   php artisan migrate --force
   ```

## Step 5: Verify Database Setup

After running migrations, verify that your database is set up correctly:

1. **Check Migration Status**
   ```bash
   railway run php artisan migrate:status
   ```

2. **Verify Tables**
   - Go to your MySQL service in Railway
   - Click on "Data" tab (if available) or use a MySQL client
   - You should see tables: `users`, `buses`, `routes`, `schedules`, `reservations`, `schedule_templates`, etc.

## Step 6: Set Up Storage Link (if needed)

If your application uses file storage (like user uploads), create a storage link:

```bash
railway run php artisan storage:link
```

## Step 7: Seed Initial Data (Optional)

If you have seeders, you can run them:

```bash
railway run php artisan db:seed
```

## Troubleshooting

### Database Connection Errors

If you're getting database connection errors:

1. **Verify Environment Variables**
   - Make sure all database variables are set correctly
   - Check that you're using the `${{MySQL.VARIABLE_NAME}}` syntax

2. **Check Database Service Status**
   - Ensure MySQL service is running and healthy
   - Check the MySQL service logs for any errors

3. **Test Connection**
   ```bash
   railway run php artisan tinker
   # Then in tinker:
   DB::connection()->getPdo();
   ```

### Migration Errors

If migrations fail:

1. **Check Migration Status**
   ```bash
   railway run php artisan migrate:status
   ```

2. **Rollback and Retry** (if needed)
   ```bash
   railway run php artisan migrate:rollback
   railway run php artisan migrate --force
   ```

3. **Check Logs**
   - Review Railway deployment logs
   - Check Laravel logs: `railway run php artisan log:show`

### Application Not Starting

1. **Check Build Logs**
   - Review the build logs in Railway dashboard
   - Ensure all dependencies are installed correctly

2. **Verify Start Command**
   - Make sure the start command in `railway.json` is correct
   - Check that the `$PORT` variable is being used

3. **Check Application Logs**
   ```bash
   railway logs
   ```

## Additional Configuration

### Custom Domain

1. Go to your service → Settings → Networking
2. Click "Generate Domain" or add your custom domain
3. Update `APP_URL` environment variable

### Environment-Specific Settings

For production, make sure:
- `APP_DEBUG=false`
- `APP_ENV=production`
- Use strong, unique `APP_KEY`
- Configure proper mail settings
- Set up proper session/cache drivers

## Security Checklist

- [ ] `APP_DEBUG` is set to `false`
- [ ] Strong `APP_KEY` is generated
- [ ] Database credentials are secure (handled by Railway)
- [ ] `APP_URL` matches your actual domain
- [ ] Mail configuration is set up correctly
- [ ] File permissions are correct (Railway handles this)

## Support

If you encounter issues:
1. Check Railway documentation: [docs.railway.app](https://docs.railway.app)
2. Review Laravel deployment guide: [laravel.com/docs/deployment](https://laravel.com/docs/deployment)
3. Check Railway community: [discord.gg/railway](https://discord.gg/railway)

---

**Note**: Railway automatically handles SSL certificates, load balancing, and scaling. Your application should be accessible via HTTPS once deployed.

