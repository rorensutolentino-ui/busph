# Fix Database Connection Error

The error shows Railway CLI can't connect to your MySQL database. This means your environment variables aren't set correctly.

## Step 1: Check Environment Variables in Railway

1. **Go to Railway Dashboard**
   - Open: https://railway.app/project/ea2bc511-e6fd-446c-bacb-df689f890dd6

2. **Click on your "busph" service** (not MySQL)

3. **Go to "Variables" tab**

4. **Check if these variables exist:**
   ```
   DB_CONNECTION=mysql
   DB_HOST=${{MySQL.MYSQLHOST}}
   DB_PORT=${{MySQL.MYSQLPORT}}
   DB_DATABASE=${{MySQL.MYSQLDATABASE}}
   DB_USERNAME=${{MySQL.MYSQLUSER}}
   DB_PASSWORD=${{MySQL.MYSQLPASSWORD}}
   ```

5. **If they're missing or wrong:**
   - Click "+ New Variable" for each one
   - Use the EXACT syntax: `${{MySQL.MYSQLHOST}}` (with the `${{}}` brackets)
   - Make sure DB_CONNECTION is set to `mysql`

## Step 2: After Setting Variables

After you've set/updated the variables:

1. **Redeploy your app** (or wait a few seconds for variables to update)

2. **Try running migrations again:**
   ```powershell
   railway run php artisan migrate --force
   ```

## Alternative: Auto-run Migrations on Deploy

If Railway CLI keeps having issues, we can configure migrations to run automatically on each deployment by updating `railway.json`.

