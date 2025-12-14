# Railway Deployment Guide for SummarAIzer

## ✅ Compatibility Check

**Yes, your system will work on Railway!** Here's why:

1. ✅ **PHP Support**: Railway fully supports PHP applications
2. ✅ **Composer Support**: Railway automatically detects and runs Composer
3. ✅ **ML Library**: `php-ai/php-ml` is pure PHP (no native extensions needed)
4. ✅ **File Structure**: Your `public` directory structure is perfect for Railway
5. ✅ **Relative Paths**: All file paths use `__DIR__` which works on Railway

## 🚀 Quick Deployment Steps

### Option 1: Using Railway Dashboard (Recommended)

1. **Create Railway Account**
   - Go to [railway.app](https://railway.app)
   - Sign up with GitHub

2. **Create New Project**
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Connect your GitHub account
   - Select your `summarAIzer` repository

3. **Configure Deployment**
   - Railway will auto-detect PHP
   - It will use the `nixpacks.toml` or `Dockerfile` we created
   - Set root directory to project root (not `public`)

4. **Environment Variables** (if needed)
   - Usually none required for this app
   - Railway will set `PORT` automatically

5. **Deploy**
   - Railway will automatically:
     - Run `composer install --no-dev`
     - Start PHP server on the `public` directory
   - Your app will be live!

### Option 2: Using Railway CLI

```bash
# Install Railway CLI
npm i -g @railway/cli

# Login
railway login

# Initialize project
railway init

# Deploy
railway up
```

## 📁 Project Structure for Railway

```
summarAIzer/
├── public/              ← Web root (served by Railway)
│   ├── index.html
│   ├── script.js
│   └── styles.css
├── src/
│   └── summarize.php   ← API endpoint
├── vendor/             ← Composer dependencies
├── composer.json
├── composer.lock
├── Dockerfile          ← Railway deployment config
├── nixpacks.toml       ← Alternative Railway config
└── railway.json        ← Railway settings
```

## ⚙️ Configuration Files Created

### 1. `railway.json`
- Tells Railway to use Nixpacks builder
- Sets build command: `composer install --no-dev`
- Sets start command: `php -S 0.0.0.0:$PORT -t public`

### 2. `nixpacks.toml`
- Alternative configuration for Railway
- Specifies PHP 8.2 and Composer
- Sets the start command

### 3. `Dockerfile`
- Docker-based deployment option
- Uses PHP 8.2 CLI
- Installs Composer dependencies
- Starts PHP built-in server

### 4. `.railwayignore`
- Files to exclude from deployment
- Reduces deployment size

## 🔍 Path Verification

Your current paths will work correctly:

- ✅ `script.js` → `../src/summarize.php` (relative path works)
- ✅ `summarize.php` → `__DIR__ . '/../vendor/autoload.php'` (relative path works)
- ✅ All file references use relative paths

## 🧪 Testing After Deployment

1. **Check Homepage**
   - Visit your Railway URL
   - Should see the SummarAIzer interface

2. **Test Summarization**
   - Enter some text
   - Click "Summarize"
   - Should return a summary

3. **Check Browser Console**
   - Open Developer Tools (F12)
   - Check for any errors
   - Network tab should show successful POST to `summarize.php`

## 🐛 Troubleshooting

### Issue: 404 on summarize.php
**Solution**: Check that Railway is serving from `public` directory and paths are correct.

### Issue: Composer dependencies not found
**Solution**: 
- Ensure `composer.json` and `composer.lock` are in root
- Check Railway build logs for `composer install` output

### Issue: ML library not working
**Solution**: 
- Verify `vendor/autoload.php` exists after deployment
- Check Railway build logs for Composer installation

### Issue: Port errors
**Solution**: Railway automatically sets `$PORT` environment variable - no action needed.

## 📊 Railway Free Tier Limits

- ✅ **Free tier includes**:
  - 500 hours/month compute time
  - $5 credit/month
  - Unlimited deployments
  - Custom domains

- ⚠️ **Note**: Your app will sleep after inactivity on free tier
  - First request after sleep may be slow
  - Consider upgrading for production use

## 🔗 After Deployment

1. **Get Your URL**
   - Railway provides: `https://your-app.railway.app`
   - You can add custom domain in Railway settings

2. **Update README.md**
   - Add Railway deployment URL
   - Update deployment section

3. **Test Everything**
   - Summarization functionality
   - Dark mode toggle
   - Copy to clipboard
   - Different modes and lengths

## ✅ Pre-Deployment Checklist

- [x] ML library integration complete
- [x] All paths use relative references
- [x] `composer.json` and `composer.lock` present
- [x] `public` directory contains frontend files
- [x] Railway config files created
- [ ] GitHub repository is public
- [ ] All files committed to Git
- [ ] Test locally first

## 🎯 Expected Result

After deployment, your app should:
- ✅ Load the homepage correctly
- ✅ Accept text input
- ✅ Process summarization using ML library
- ✅ Return formatted summaries
- ✅ Support all modes (paragraph/bullet)
- ✅ Support all lengths (short/medium/long)

---

**Your application is Railway-ready!** 🚂

