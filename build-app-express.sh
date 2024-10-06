#!/bin/bash

# 1. Inisialisasi proyek Node.js
echo "Inisialisasi npm..."
npm init -y

# 2. Install dependencies yang dibutuhkan
echo "Menginstall express, ejs, path, serve-favicon, fs, dotenv..."
npm install express ejs path serve-favicon fs dotenv

# 3. Membuat file index.js dengan konten yang diberikan
echo "Membuat file index.js..."
cat <<EOL > index.js
require('dotenv').config()

const express = require('express');
const path = require('path');
const favicon = require("serve-favicon");
const bodyParser = require('body-parser');
const pagesRouter = require('./routes/pages');

const app = express();
const PORT = process.env.PORT || 3110;

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Static folder
app.use(express.static(path.join(__dirname, 'public')));
app.use(favicon(path.join(__dirname, "public", 'images', "favicon.ico")));

// Gunakan body-parser untuk menghandle data form (urlencoded) dan JSON
app.use(bodyParser.urlencoded({ extended: false })); // Untuk form-urlencoded
app.use(bodyParser.json()); // Untuk JSON

// Gunakan router
app.use('/', pagesRouter);

// Menjalankan server
app.listen(PORT, () => {
  console.log(\`Server running on http://localhost:\${PORT}\`);
});
EOL

# 4. Membuat folder public
echo "Membuat folder public..."
mkdir -p public

# 5. Membuat folder views/partials
echo "Membuat folder views/partials..."
mkdir -p views/partials

# 6. Membuat folder routes
echo "Membuat folder routes..."
mkdir -p routes

# 7. Membuat file .gitignore dan mengisi dengan konten yang diberikan
echo "Membuat file .gitignore..."
cat <<EOL > .gitignore
node_modules
package-lock.json
EOL

# 8. Membuat file routes/pages.js dengan konten yang diberikan
echo "Membuat file routes/pages.js..."
cat <<EOL > routes/pages.js
const express = require('express');
const router = express.Router();

// Rute GET untuk halaman utama
router.get('/', (req, res) => {
  res.render('index', { title: 'Hello World!' });
});

module.exports = router;
EOL

# 9. Membuat file views/partials/header.ejs dan footer.ejs dengan isi kosong
echo "Membuat file views/partials/header.ejs dan footer.ejs..."
touch views/partials/header.ejs
touch views/partials/footer.ejs

echo "Proses selesai! Aplikasi Express.js siap digunakan."
