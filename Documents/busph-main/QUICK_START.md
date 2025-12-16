# Quick Start Guide - Railway MySQL Setup

## 🚀 Quick Setup Steps

### 1. Add MySQL Database to Railway
- In Railway dashboard → Your Project → "+ New" → "Database" → "Add MySQL"
- Wait for database to be provisioned

### 2. Configure Environment Variables
In your Laravel app service → Variables tab, add:

```bash
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:YOUR_GENERATED_KEY
APP_URL=https://your-app.up.railway.app

DB_CONNECTION=mysql
DB_HOST=${{MySQL.MYSQLHOST}}
DB_PORT=${{MySQL.MYSQLPORT}}
DB_DATABASE=${{MySQL.MYSQLDATABASE}}
DB_USERNAME=${{MySQL.MYSQLUSER}}
DB_PASSWORD=${{MySQL.MYSQLPASSWORD}}

SESSION_DRIVER=database
CACHE_DRIVER=database
QUEUE_CONNECTION=database
```

**Important**: Replace `YOUR_GENERATED_KEY` with your actual APP_KEY (run `php artisan key:generate` locally and copy the key).

### 3. Deploy
- Railway will automatically deploy when you push to your connected branch
- Migrations will run automatically on each deployment (configured in `railway.json`)

### 4. Verify
- Check your app URL
- Verify database tables exist (MySQL service → Data tab)

## 🔧 Manual Migration (if needed)

If automatic migrations don't work, run manually:

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login and link
railway login
railway link

# Run migrations
railway run php artisan migrate --force
```

## 📚 Full Documentation

See `RAILWAY_DEPLOYMENT.md` for detailed instructions and troubleshooting.

