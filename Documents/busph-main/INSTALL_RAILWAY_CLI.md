# How to Install and Use Railway CLI on Windows

## Step-by-Step Instructions

### Step 1: Open PowerShell on Your Computer

1. Press `Windows Key + X`
2. Select "Windows PowerShell" or "Terminal"
3. Or search for "PowerShell" in the Start menu

### Step 2: Install Railway CLI

In PowerShell, run this command:

```powershell
npm install -g @railway/cli
```

**Note:** If you get an error saying "npm is not recognized", you need to install Node.js first:
- Download from: https://nodejs.org/
- Install it, then restart PowerShell
- Try the npm install command again

### Step 3: Navigate to Your Project Folder

```powershell
cd C:\Users\USER\Documents\busph-main
```

(Replace `USER` with your actual Windows username if different)

### Step 4: Login to Railway

```powershell
railway login
```

This will:
- Open your web browser
- Ask you to authorize Railway CLI
- Once authorized, you'll be logged in

### Step 5: Link to Your Railway Project

```powershell
railway link
```

You'll see a list of your Railway projects. Select:
- **"bountiful-luck"** (or whatever your project is named)

### Step 6: Run Database Migrations

Now you can run migrations:

```powershell
railway run php artisan migrate --force
```

You should see output showing tables being created!

### Step 7: Verify Migrations Ran

Check the status:

```powershell
railway run php artisan migrate:status
```

## Troubleshooting

### "npm: command not found"
- Install Node.js from https://nodejs.org/
- Restart PowerShell after installation

### "railway: command not found" after installation
- Close and reopen PowerShell
- Try running: `npm install -g @railway/cli` again

### "Permission denied" errors
- Run PowerShell as Administrator:
  - Right-click PowerShell → "Run as Administrator"
  - Then try the commands again

### Can't find your project when running `railway link`
- Make sure you're logged in: `railway login`
- Check that you're in the correct project folder

## Quick Reference Commands

```powershell
# Login to Railway
railway login

# Link to project
railway link

# Run migrations
railway run php artisan migrate --force

# Check migration status
railway run php artisan migrate:status

# View logs
railway logs

# Run any Laravel artisan command
railway run php artisan [command]
```

