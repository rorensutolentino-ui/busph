# How to Run Database Migrations on Railway

## ⚠️ Note: Shell Access may not be available in all Railway plans/versions
If you don't see shell access in the dashboard, use Method 2 (Railway CLI) instead.

## Method 1: Using Railway Dashboard (If Available)

1. **Go to your Railway Dashboard**
   - Navigate to: https://railway.app/project/ea2bc511-e6fd-446c-bacb-df689f890dd6

2. **Click on your "busph" service** (the Laravel app, not MySQL)

3. **Open the "Settings" tab** (in the top navigation bar)

4. **Look for "Generate Shell" or "Shell Access"** button and click it
   - This will open a browser-based terminal/console

5. **In the shell that opens, run:**
   ```bash
   php artisan migrate --force
   ```

6. **Wait for migrations to complete** - You should see output showing tables being created

**Alternative locations to try:**
- Check if there's a "Shell" tab in the service view
- In "Deployments" tab → Click on active deployment → Look for "Shell" or "Run Command" option
- Some Railway versions have a terminal icon in the top right of the service view

## Method 2: Using Railway CLI (Recommended - Works Everywhere) ✅

### Step 1: Open Terminal/PowerShell
Open PowerShell or Command Prompt on your Windows computer.

### Step 2: Navigate to Your Project
```powershell
cd C:\Users\USER\Documents\busph-main
```

### Step 3: Install Railway CLI (First Time Only)
```powershell
npm install -g @railway/cli
```

### Step 4: Login to Railway
```powershell
railway login
```
This will open your browser to authenticate.

### Step 5: Link to Your Project
```powershell
railway link
```
When prompted, select your "bountiful-luck" project.

### Step 6: Run Migrations
```powershell
railway run php artisan migrate --force
```

## Verify Migrations Ran Successfully

After running migrations, verify by checking:

1. **Check migration status:**
   ```bash
   railway run php artisan migrate:status
   ```

2. **Or check your MySQL database:**
   - Go to MySQL service in Railway
   - Click "Data" tab (if available)
   - You should see tables: `users`, `buses`, `routes`, `schedules`, `reservations`, `schedule_templates`, `migrations`, etc.

## Troubleshooting

### "Command not found" or "railway: command not found"
- Make sure Railway CLI is installed: `npm install -g @railway/cli`
- Try restarting your terminal

### "Database connection error"
- Make sure environment variables are set correctly in Railway
- Check that MySQL service is online (which it is, according to your dashboard)

### "No migrations to run"
- This means migrations already ran successfully!
- Check your database tables to confirm

## Quick Command Reference

```bash
# Check migration status
railway run php artisan migrate:status

# Run migrations
railway run php artisan migrate --force

# Rollback last migration (if needed)
railway run php artisan migrate:rollback

# See all migrations
railway run php artisan migrate:status
```

