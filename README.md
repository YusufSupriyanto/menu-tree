# 🌐 Menu Management System

Aplikasi **Menu Management System** berbasis **Laravel 11**, **React**, dan **Inertia.js** untuk mengelola struktur menu secara hierarkis (nested menu).  
Setiap menu dapat memiliki sub-menu (children), mendukung operasi **create**, **edit**, dan **delete**, serta menampilkan struktur menu dalam bentuk **tree view** interaktif.

---

##  Fitur Utama

-  Tampilkan struktur menu secara **hierarkis (tree view)**
-  Tambah menu atau submenu secara dinamis
-  Edit menu langsung dari tree
-  Hapus menu hanya jika tidak memiliki children
-  Desain responsif (mobile & desktop)
-  Integrasi penuh dengan **Laravel + Inertia.js**
-  Penyimpanan data di database via Eloquent Model

---

##  Teknologi yang Digunakan

| Layer | Teknologi |
|-------|------------|
| Backend | Laravel 11 |
| Frontend | React + Inertia.js |
| Styling | Tailwind CSS |
| Icons | Lucide React |
| State & Form Handling | Inertia useForm Hook |
| Database | MySQL |

---

##  Instalasi & Setup

###  Clone Repository
```bash
git clone https://github.com/YusufSupriyanto/menu-tree.git
cd menu-tree


## Install Depedensi Backend
 composer install

## Install Dependency Frontend
 npm install

## Konfigurasi File Environment
## Buat file .env dari contoh yang sudah ada:
cp .env.example .env

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=menu-tree
DB_USERNAME=root
DB_PASSWORD=

## Jalankan Server
# Terminal 1
php artisan serve

# Terminal 2
npm run dev

## Aksess aplikasi ke
http://127.0.0.1:8000/menus


## Struktur folder
app/
 ├── Http/
 │   └── Controllers/
 │       └── MenuController.php
 ├── Models/
 │   └── Menu.php
 ├── Repositories/
 │   └── MenuRepository.php
 └── Services/
     └── MenuService.php

resources/
 ├── js/
 │   ├── Components/
 │   │   ├── MenuForm.jsx
 │   │   ├── MenuSidebar.jsx
 │   │   └── MenuTree.jsx
 │   └── Pages/
 │       └── Menus/
 │           └── Index.jsx
 └── views/
     └── app.blade.php

routes/
 └── web.php


## Contoh routes
| Method | Endpoint      | Deskripsi                                    |
| ------ | ------------- | -------------------------------------------- |
| GET    | `/menus`      | Tampilkan halaman manajemen menu             |
| POST   | `/menus`      | Tambah menu baru                             |
| PUT    | `/menus/{id}` | Edit menu berdasarkan ID                     |
| DELETE | `/menus/{id}` | Hapus menu (hanya jika tidak punya children) |

