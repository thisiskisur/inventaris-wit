# 🚀 DEPLOY BACKEND SEKARANG - Solusi Login Error

## ❌ **MASALAH SAAT INI:**
- Frontend sudah live di: https://inventaris-wit.vercel.app/
- Backend masih di `localhost:8001` (tidak bisa diakses dari internet)
- Error: `ERR_CONNECTION_REFUSED` saat login

## ✅ **SOLUSI CEPAT - DEPLOY KE RAILWAY**

### Langkah 1: Deploy Backend ke Railway (GRATIS)

1. **Buka [Railway.app](https://railway.app)**
2. Studio 3D **"Deploy from GitHub"**
3. **Pilih repository:** `inventaris-wit`
4. **Set Root Directory:** `backend`
5. **Railway akan otomatis detect Laravel**

### Langkah 2: Setup Database

1. **Di Railway Dashboard, klik "Add Service"**
2. **Pilih "MySQL"**
3. **Copy connection details:**
   ```
   Host: your-host.railway.internal
   Port: 3306
   Database: railway
   Username: root
   Password: your-password
   ```

### Langkah 3: Environment Variables

Di Railway, set environment variables:

```env
APP_NAME="Inventaris WIT"
APP_ENV=production
APP_DEBUG=false
APP_URL=https://your-app-name.railway.app

DB_CONNECTION=mysql
DB_HOST=your-mysql-host.railway.internal
DB_PORT=3306
DB_DATABASE=railway
DB_USERNAME=root
DB_PASSWORD=your-mysql-password

SANCTUM_STATEFUL_DOMAINS=inventaris-wit.vercel.app
```

### Langkah 4: Run Migrations

Di Railway Console:
```bash
php artisan migrate --force
php artisan db:seed --force
```

---

## 🔧 **ALTERNATIF: DEPLOY KE RENDER**

### Langkah 1: Deploy ke Render

1. **Buka [Render.com](https://render.com)**
2. **"New Web Service"**
3. **Connect GitHub:** `inventaris-wit`
4. **Root Directory:** `backend`
5. **Build Command:** `composer install --no-dev --optimize-autoloader`
6. **Start Command:** `php artisan serve --host=0.0.0.0 --port=$PORT`

### Langkah 2: Setup Database di Render

1. **"New Database"** → **"PostgreSQL"** (gratis)
2. **Atau gunakan MySQL dari Railway**

---

## ⚡ **SOLUSI TERCEPAT - DEPLOY KE HEROKU**

### Langkah 1: Deploy ke Heroku

```bash
# Install Heroku CLI
# Download dari: https://devcenter.heroku.com/articles/heroku-cli

# Login ke Heroku
heroku login

# Create app
heroku create inventaris-wit-backend

# Add MySQL addon
heroku addons:create cleardb:ignite

# Set environment variables
heroku config:set APP_ENV=production
heroku config:set APP_DEBUG=false
heroku config:set DB_CONNECTION=mysql

# Deploy
cd backend
git add .
git commit -m "Deploy backend"
git push heroku main

# Run migrations
heroku run php artisan migrate --force
heroku run php artisan db:seed --force
```

---

## 🎯 **UPDATE FRONTEND API URL**

Setelah backend deployed, update frontend:

### Opsi 1: Update di Vercel Dashboard
1. **Buka [Vercel Dashboard](https://vercel.com/dashboard)**
2. **Pilih project:** `inventaris-wit`
3. **Settings** → **Environment Variables**
4. **Add:** `VITE_API_URL` = `https://your-backend-url.com/api`

### Opsi 2: Update di GitHub
1. **Update file:** `frontend/src/services/api.js`
2. **Commit dan push**
3. **Vercel akan auto-redeploy**

---

## 🚀 **DEPLOYMENT CEPAT - PAKAI RAILWAY**

### Langkah-langkah:

1. **Buka [Railway.app](https://railway.app)**
2. **Sign up dengan GitHub**
3. **"Deploy from GitHub"**
4. **Pilih:** `inventaris-wit`
5. **Set:** Root Directory = `backend`
6. **Add MySQL service**
7. **Set environment variables:**
   ```
   APP_ENV=production
   APP_DEBUG=false
   DB_CONNECTION=mysql
   ```
8. **Deploy!**

### Setelah Deploy:

1. **Copy backend URL** (contoh: `https://inventaris-wit-backend.railway.app`)
2. **Update frontend API URL** di Vercel
3. **Test login** di https://inventaris-wit.vercel.app/

---

## 🔧 **TROUBLESHOOTING**

### Error: Database Connection
```bash
# Di Railway Console
php artisan migrate --force
php artisan db:seed --force
```

### Error: CORS
```php
// backend/app/Http/Middleware/CorsMiddleware.php
$allowedOrigins = [
    'https://inventaris-wit.vercel.app',
    'http://localhost:5173'
];
```

### Error: 500 Internal Server Error
```bash
# Check logs
railway logs
# atau
heroku logs --tail
```

---

## 🎉 **SETELAH DEPLOYMENT**

### Test Checklist:
- ✅ **Backend accessible:** `https://your-backend-url.com/api/cors-test`
- ✅ **Frontend updated:** API URL pointing to production backend
- ✅ **Login working:** Admin/Staff bisa login
- ✅ **Dashboard accessible:** Semua fitur berfungsi
- ✅ **Database populated:** 22 aset tersedia

### Akun untuk Test:
- **Admin:** `admin@wit.id` / `password123`
- **Staff:** `staff@wit.id` / `password123`

---

## 📞 **BANTUAN CEPAT**

Jika masih ada masalah:

1. **Check backend logs** di Railway/Heroku dashboard
2. **Test API endpoint** langsung di browser
3. **Check CORS settings** di backend
4. **Verify environment variables** sudah benar

**🚀 Setelah backend deployed, sistem akan bisa diakses oleh siapa saja!**
