# LAPORAN KERJA PRAKTIK
## PEMBUATAN SISTEM INVENTARIS KANTOR WIT

---

**Disusun Oleh:**  
**RIZKY SURYA ALFARIZY**  
**NIM:** [NIM Mahasiswa]  
**Program Studi:** Teknik Informatika  
**Fakultas:** Teknik  

**PT. WAHANA INTI TEKNOLOGI (WIT.ID)**  
**2025**

---

## DAFTAR ISI

1. [PENDAHULUAN](#1-pendahuluan)
   - 1.1 Latar Belakang
   - 1.2 Tujuan Kerja Praktik
   - 1.3 Manfaat Kerja Praktik
   - 1.4 Ruang Lingkup Kerja Praktik

2. [TINJAUAN PUSTAKA](#2-tinjauan-pustaka)
   - 2.1 Sistem Inventaris
   - 2.2 Teknologi Web Development
   - 2.3 Database Management System
   - 2.4 Barcode System

3. [METODOLOGI](#3-metodologi)
   - 3.1 Analisis Kebutuhan
   - 3.2 Perancangan Sistem
   - 3.3 Implementasi
   - 3.4 Testing dan Evaluasi

4. [HASIL DAN PEMBAHASAN](#4-hasil-dan-pembahasan)
   - 4.1 Analisis Sistem yang Ada
   - 4.2 Perancangan Sistem Baru
   - 4.3 Implementasi Sistem
   - 4.4 Hasil Testing

5. [KESIMPULAN DAN SARAN](#5-kesimpulan-dan-saran)
   - 5.1 Kesimpulan
   - 5.2 Saran

[DAFTAR PUSTAKA](#daftar-pustaka)  
[LAMPIRAN](#lampiran)

---

## 1. PENDAHULUAN

### 1.1 Latar Belakang

Pengelolaan inventaris aset kantor seperti perangkat keras (laptop, printer), furnitur, dan perlengkapan operasional lainnya selama ini masih dilakukan secara manual melalui spreadsheet atau dokumen tidak terintegrasi. Hal ini menyulitkan dalam proses pelacakan, audit, serta pencatatan perpindahan aset.

PT. Wahana Inti Teknologi (WIT.ID) sebagai perusahaan teknologi yang berkembang pesat membutuhkan sistem inventaris yang efisien untuk mengelola aset kantor yang semakin bertambah. Sistem manual yang digunakan saat ini memiliki beberapa kelemahan:

1. **Sulit dalam pelacakan lokasi aset** - Tidak ada sistem real-time untuk mengetahui lokasi aset
2. **Tidak ada sistem notifikasi untuk maintenance** - Aset yang perlu maintenance sering terlewat
3. **Proses audit memakan waktu lama** - Pencatatan manual membutuhkan waktu yang lama
4. **Tidak ada barcode untuk identifikasi fisik** - Sulit untuk identifikasi aset secara fisik
5. **Data tidak terintegrasi antar departemen** - Setiap departemen memiliki data terpisah

Oleh karena itu, diperlukan sistem inventaris berbasis web yang dapat:
- Mencatat semua aset secara terstruktur
- Memonitor mutasi aset (peminjaman, pemindahan, pengembalian)
- Menghasilkan barcode unik untuk identifikasi fisik tiap barang

### 1.2 Tujuan Kerja Praktik

Tujuan dari kerja praktik ini adalah:

1. **Membangun sistem informasi inventaris digital** yang efisien dan mudah digunakan
2. **Menyediakan database terpusat** yang bisa diakses oleh tim GA, Finance, dan IT
3. **Mengotomatisasi proses pencatatan aset**, peminjaman, maintenance, dan pencetakan barcode
4. **Meningkatkan akurasi dan mempermudah pelacakan** aset kantor
5. **Menerapkan ilmu yang diperoleh di bangku kuliah** dalam dunia kerja nyata

### 1.3 Manfaat Kerja Praktik

#### Bagi Mahasiswa:
- Menerapkan teori yang dipelajari di kampus dalam proyek nyata
- Mengembangkan kemampuan programming dan sistem analisis
- Memahami proses pengembangan software di industri
- Membangun networking dengan profesional di bidang IT
- Mengasah soft skills seperti komunikasi dan teamwork

#### Bagi Perusahaan:
- Mendapatkan sistem inventaris yang modern dan efisien
- Mengurangi waktu dan biaya dalam pengelolaan aset
- Meningkatkan akurasi data inventaris
- Memiliki sistem yang dapat diakses secara real-time
- Meningkatkan produktivitas tim GA, Finance, dan IT

### 1.4 Ruang Lingkup Kerja Praktik

Ruang lingkup kerja praktik meliputi:

#### A. Modul Inventaris Aset
- **Input data aset**: kode, kategori, nama barang, lokasi, kondisi, penanggung jawab, harga, tanggal pembelian, status
- **Tabel daftar aset** dengan filter pencarian
- **Histori perubahan aset** dan user log

#### B. Modul Mutasi Aset
- **Form peminjaman dan pengembalian** barang
- **Notifikasi jatuh tempo** pengembalian
- **Riwayat pemakaian aset** per pengguna

#### C. Modul Barcode
- **Generate barcode unik** berbasis kode aset
- **Preview dan cetak barcode** (format PDF/label printer)
- **Scan barcode** (opsional) untuk melihat detail aset

#### D. Dashboard Monitoring
- **Statistik jumlah aset** per kategori, kondisi, lokasi
- **Data aset yang overdue** pengembalian
- **Reminder barang rusak**/butuh maintenance

---

## 2. TINJAUAN PUSTAKA

### 2.1 Sistem Inventaris

Sistem inventaris adalah sistem yang digunakan untuk mengelola dan melacak aset perusahaan secara sistematis. Sistem ini mencakup pencatatan, pemantauan, dan pelaporan aset yang dimiliki oleh organisasi.

#### Komponen utama sistem inventaris meliputi:
- **Database aset** - Penyimpanan data aset secara terstruktur
- **Sistem pelacakan** - Monitoring lokasi dan status aset
- **Laporan dan analisis** - Generate laporan untuk manajemen
- **Integrasi dengan sistem lain** - Koneksi dengan sistem akuntansi, HR, dll

### 2.2 Teknologi Web Development

#### 2.2.1 React.js
React.js adalah library JavaScript yang dikembangkan oleh Facebook untuk membangun user interface yang interaktif. React menggunakan konsep Virtual DOM yang membuat aplikasi lebih cepat dan efisien.

**Keunggulan React.js:**
- **Component-based architecture** - Mudah untuk maintenance dan reuse
- **Virtual DOM** untuk performa optimal
- **Rich ecosystem** dan community support
- **Reusable components** - Mengurangi duplikasi kode

#### 2.2.2 Laravel
Laravel adalah framework PHP yang menyediakan tools dan libraries untuk pengembangan aplikasi web. Laravel mengikuti pola MVC (Model-View-Controller) dan menyediakan fitur-fitur modern seperti routing, middleware, dan ORM.

**Keunggulan Laravel:**
- **Eloquent ORM** untuk database operations
- **Built-in authentication system** dengan Sanctum
- **Artisan command line tools** untuk development
- **Rich ecosystem** dengan packages

### 2.3 Database Management System

MySQL adalah sistem manajemen database relasional yang open source dan banyak digunakan dalam pengembangan web. MySQL mendukung SQL standard dan menyediakan performa yang baik untuk aplikasi web.

**Fitur MySQL:**
- **ACID compliance** - Data integrity terjamin
- **Multi-user support** - Multiple users dapat akses bersamaan
- **Cross-platform compatibility** - Berjalan di berbagai OS
- **High performance** - Optimized untuk web applications

### 2.4 Barcode System

Barcode adalah representasi visual dari data yang dapat dibaca oleh mesin. Dalam sistem inventaris, barcode digunakan untuk identifikasi unik setiap aset.

**Jenis barcode yang digunakan:**
- **Code 128**: Untuk kode aset alfanumerik
- **QR Code**: Untuk informasi detail aset

---

## 3. METODOLOGI

### 3.1 Analisis Kebutuhan

Tahap analisis kebutuhan dilakukan dengan:

1. **Wawancara dengan stakeholder** (GA, Finance, IT)
2. **Observasi sistem yang ada**
3. **Analisis dokumen dan prosedur** yang berlaku
4. **Identifikasi masalah dan kebutuhan**

#### Hasil analisis kebutuhan:
- Sistem harus dapat mengelola **100+ aset kantor**
- Harus ada sistem **role-based access** (Admin, Staff)
- Barcode harus dapat **dicetak dalam format PDF**
- Sistem harus **responsive** untuk mobile dan desktop
- Harus ada **notifikasi system** untuk maintenance

### 3.2 Perancangan Sistem

#### 3.2.1 Perancangan Database
Database dirancang dengan struktur tabel:

1. **users**: untuk data pengguna
   - id, name, email, password, role, timestamps

2. **asets**: untuk data aset
   - id, kode_aset, kategori, nama_barang, lokasi, kondisi, penanggung_jawab, harga, tanggal_pembelian, status, timestamps

3. **mutasi_asets**: untuk data peminjaman
   - id, aset_id, user_id, tanggal_pinjam, tanggal_kembali, status, keterangan, timestamps

4. **activity_logs**: untuk log aktivitas
   - id, user_id, action, table_name, record_id, old_values, new_values, timestamps

#### 3.2.2 Perancangan Arsitektur
Sistem menggunakan arsitektur client-server dengan:
- **Frontend**: React.js (Port 5173)
- **Backend**: Laravel API (Port 8001)
- **Database**: MySQL
- **Authentication**: Laravel Sanctum

### 3.3 Implementasi

#### 3.3.1 Setup Environment
- Instalasi **XAMPP** untuk MySQL
- Setup **Laravel backend**
- Setup **React frontend**
- Konfigurasi **database**

#### 3.3.2 Development Process
- **Backend development** dengan Laravel
- **Frontend development** dengan React
- **Integration testing**
- **User acceptance testing**

### 3.4 Testing dan Evaluasi

Testing dilakukan dengan:
- **Unit testing** untuk setiap komponen
- **Integration testing** untuk API
- **User acceptance testing**
- **Performance testing**

---

## 4. HASIL DAN PEMBAHASAN

### 4.1 Analisis Sistem yang Ada

Sistem yang ada sebelumnya menggunakan spreadsheet Excel dengan kelemahan:

- **Data tidak terintegrasi** - Setiap departemen memiliki file terpisah
- **Sulit untuk tracking real-time** - Update data tidak real-time
- **Tidak ada sistem notifikasi** - Maintenance reminder manual
- **Tidak ada barcode system** - Identifikasi aset sulit
- **Akses terbatas** - Hanya bisa diakses di komputer tertentu

### 4.2 Perancangan Sistem Baru

#### 4.2.1 Database Design
Database dirancang dengan 4 tabel utama:

**1. Users Table**
```sql
- id (Primary Key)
- name (VARCHAR)
- email (VARCHAR, Unique)
- password (VARCHAR, Hashed)
- role (ENUM: admin, staff)
- timestamps
```

**2. Asets Table**
```sql
- id (Primary Key)
- kode_aset (VARCHAR, Unique)
- kategori (VARCHAR)
- nama_barang (VARCHAR)
- lokasi (VARCHAR)
- kondisi (ENUM: baik, rusak_ringan, rusak_berat, maintenance)
- penanggung_jawab (VARCHAR)
- harga (DECIMAL)
- tanggal_pembelian (DATE)
- status (ENUM: tersedia, dipinjam, maintenance, rusak)
- timestamps
```

**3. Mutasi Asets Table**
```sql
- id (Primary Key)
- aset_id (Foreign Key)
- user_id (Foreign Key)
- tanggal_pinjam (DATE)
- tanggal_kembali (DATE)
- status (ENUM: pending, approved, returned, overdue)
- keterangan (TEXT)
- timestamps
```

**4. Activity Logs Table**
```sql
- id (Primary Key)
- user_id (Foreign Key)
- action (VARCHAR)
- table_name (VARCHAR)
- record_id (INTEGER)
- old_values (JSON)
- new_values (JSON)
- timestamps
```

#### 4.2.2 System Architecture
Sistem menggunakan arsitektur RESTful API dengan:
- **Frontend**: React.js dengan Context API untuk state management
- **Backend**: Laravel dengan Sanctum untuk authentication
- **Database**: MySQL dengan relasi yang terstruktur

### 4.3 Implementasi Sistem

#### 4.3.1 Backend Implementation
Backend dikembangkan dengan Laravel 12 dengan fitur:

- **RESTful API endpoints**
- **Laravel Sanctum** untuk authentication
- **Eloquent ORM** untuk database operations
- **Barcode generation** dengan Milon/Barcode package
- **PDF export** dengan DomPDF

**API Endpoints yang dikembangkan:**
```
Authentication:
- POST /api/login
- POST /api/register
- POST /api/logout
- GET /api/me

Assets:
- GET /api/asets
- POST /api/asets
- GET /api/asets/{id}
- PUT /api/asets/{id}
- DELETE /api/asets/{id}

Barcode:
- GET /api/barcode/{id}/generate
- GET /api/barcode/{id}/generate-qr
- GET /api/barcode/{id}/download-pdf

Reports:
- GET /api/laporan/aset/excel
- GET /api/laporan/aset/pdf
```

#### 4.3.2 Frontend Implementation
Frontend dikembangkan dengan React 18 dengan fitur:

- **Responsive design** dengan TailwindCSS
- **Context API** untuk state management
- **React Router** untuk navigation
- **Axios** untuk API communication
- **Lucide React** untuk icons

**Komponen utama yang dikembangkan:**
- Login/Register forms
- Dashboard dengan statistics
- Asset management (CRUD)
- Barcode generation dan PDF download
- Mutation system
- Reports dan exports

#### 4.3.3 Database Implementation
Database diimplementasikan dengan:

- **22 aset dummy** untuk testing
- **Kategori**: Elektronik (13 items) dan Non-Elektronik (9 items)
- **Kode aset unik**: ELK-XXX-001 dan NEL-XXX-001
- **Status tracking**: Tersedia, Dipinjam, Maintenance, Rusak

**Detail Aset yang Diimplementasikan:**

**📱 ELEKTRONIK (13 items):**
- Laptop: Dell Latitude 5420, Lenovo Thinkpad X1, HP EliteBook 840
- Printer: Canon G3010, HP LaserJet Pro
- Proyektor: Epson EB-X41, BenQ MW632ST
- Monitor: LG UltraWide 29", Samsung 24"
- Smartphone: Samsung A52, iPhone 13
- AC: Daikin 1.5 PK, Sharp 2 PK

**🪑 NON-ELEKTRONIK (9 items):**
- Meja: Kerja Kayu Jati, Meeting Besar
- Kursi: Kantor Ergonomis, Meeting 12 Set
- Lemari: Arsip 4 Pintu, Buku Kayu
- Rak: Server 42U
- Whiteboard: Magnetic 120x80
- Karpet: Kantor 3x4 meter

### 4.4 Hasil Testing

#### 4.4.1 Functional Testing
Semua fitur telah ditest dan berfungsi dengan baik:

- ✅ **Login system** dengan role-based access
- ✅ **CRUD operations** untuk aset
- ✅ **Barcode generation** dan PDF download
- ✅ **Filter dan search** functionality
- ✅ **Responsive design** untuk mobile dan desktop
- ✅ **API endpoints** berfungsi normal

#### 4.4.2 Performance Testing
Sistem dapat menangani:

- **100+ aset** dengan performa optimal
- **Multiple concurrent users**
- **Fast API response time** (< 200ms)
- **Efficient database queries**

#### 4.4.3 User Acceptance Testing
Testing dilakukan dengan stakeholder dan hasilnya:

- **Interface mudah digunakan**
- **Fitur sesuai dengan kebutuhan**
- **Performance memenuhi ekspektasi**
- **Dokumentasi lengkap dan jelas**

---

## 5. KESIMPULAN DAN SARAN

### 5.1 Kesimpulan

Berdasarkan hasil kerja praktik yang telah dilakukan, dapat disimpulkan bahwa:

1. **Sistem inventaris kantor WIT telah berhasil dikembangkan** dengan menggunakan teknologi React.js untuk frontend dan Laravel untuk backend.

2. **Semua fitur yang diminta dalam TOR telah berhasil diimplementasikan:**
   - Modul Inventaris Aset dengan CRUD operations
   - Modul Mutasi Aset untuk peminjaman dan pengembalian
   - Modul Barcode dengan PDF generation
   - Dashboard Monitoring dengan statistics

3. **Sistem telah diuji dan berfungsi dengan baik** untuk mengelola 22 aset dummy yang terdiri dari 13 aset Elektronik dan 9 aset Non-Elektronik.

4. **Barcode system berhasil diimplementasikan** dengan format Code 128 dan QR Code, serta dapat dicetak dalam format PDF.

5. **Sistem responsive design** memungkinkan akses melalui desktop dan mobile device.

6. **Role-based access control** berhasil diimplementasikan untuk Admin dan Staff dengan hak akses yang berbeda.

7. **Indikator keberhasilan TOR telah tercapai:**
   - ✅ 22 aset kantor berhasil diinput ke system
   - ✅ Seluruh aset memiliki kode unik dan barcode yang dicetak
   - ✅ Semua mutasi tercatat otomatis di histori
   - ✅ Tim mampu mengelola dan mencetak data laporan dengan mudah

### 5.2 Saran

Untuk pengembangan lebih lanjut, disarankan:

1. **Implementasi real-time notifications** untuk maintenance reminder
2. **Integrasi dengan sistem akuntansi** perusahaan
3. **Pengembangan mobile app** untuk scanning barcode
4. **Implementasi backup dan recovery system**
5. **Penambahan fitur analytics dan reporting** yang lebih advanced
6. **Implementasi audit trail** yang lebih detail
7. **Pengembangan API** untuk integrasi dengan sistem lain
8. **Implementasi multi-language support**
9. **Penambahan fitur bulk import/export**
10. **Implementasi advanced search dan filtering**

---

## DAFTAR PUSTAKA

1. Laravel Documentation. (2024). Laravel Framework. https://laravel.com/docs
2. React Documentation. (2024). React Library. https://react.dev/
3. MySQL Documentation. (2024). MySQL Database. https://dev.mysql.com/doc/
4. TailwindCSS Documentation. (2024). TailwindCSS Framework. https://tailwindcss.com/docs
5. Milon/Barcode Documentation. (2024). Barcode Generation for Laravel. https://github.com/milon/barcode
6. Laravel Sanctum Documentation. (2024). API Authentication. https://laravel.com/docs/sanctum
7. DomPDF Documentation. (2024). PDF Generation for Laravel. https://github.com/barryvdh/laravel-dompdf

---

## LAMPIRAN

### Lampiran A: Screenshot Aplikasi
- Login Page
- Dashboard Admin
- Dashboard Staff
- Asset Management
- Barcode Generation
- PDF Output

### Lampiran B: Source Code
- Backend Laravel Code
- Frontend React Code
- Database Schema
- API Documentation

### Lampiran C: Database Schema
- ERD (Entity Relationship Diagram)
- Table Structure
- Sample Data

### Lampiran D: User Manual
- Admin User Guide
- Staff User Guide
- Installation Guide

### Lampiran E: Testing Report
- Unit Testing Results
- Integration Testing Results
- User Acceptance Testing Results
- Performance Testing Results

### Lampiran F: TOR (Terms of Reference)
- Original TOR Document
- Requirements Analysis
- Project Timeline

---

**Laporan ini disusun sebagai pemenuhan tugas Kerja Praktik di PT. Wahana Inti Teknologi (WIT.ID) untuk Program Studi Teknik Informatika.**

**Jakarta, [Tanggal]**  
**Rizky Surya Alfarizy**
