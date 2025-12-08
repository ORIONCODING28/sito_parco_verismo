# 📚 Parco Letterario del Verismo

Piattaforma web moderna per la promozione e valorizzazione del patrimonio letterario verista siciliano, con focus su Giovanni Verga e Luigi Capuana.

## ✨ Caratteristiche

- 🌍 **Multilingua** - Contenuti in Italiano e Inglese
- 📖 **Biblioteca Digitale** - Opere, autori e analisi letterarie
- 🗺️ **Itinerari Turistici** - Percorsi letterari interattivi
- 📅 **Eventi e Notizie** - Calendario eventi e ultime notizie
- 📄 **Archivio Documentale** - Studi, ricerche e documenti
- 📝 **Sistema Prenotazioni** - Gestione prenotazioni itinerari guidati
- 🎨 **Archivio Fotografico** - Galleria fotografica organizzata
- ♿ **Accessibilità** - Conforme AGID e GDPR

## 🚀 Stack Tecnologico

- **Django 5.2.8** - Framework web Python
- **Python 3.8+** - Linguaggio backend
- **Bootstrap 5.3.3** - Framework CSS responsive
- **django-parler** - Sistema traduzioni multilingua
- **SQLite/PostgreSQL** - Database
- **python-decouple** - Gestione configurazioni

## 📁 Struttura Progetto

```
parco_verismo/
├── models/          # Modelli database organizzati per dominio
│   ├── autori_opere.py, eventi.py, documenti.py
│   ├── itinerari.py, prenotazioni.py
├── views/           # Views organizzate per funzionalità
├── admin/           # Admin Django separati per tipo
├── forms/           # Forms con validazioni
├── services/        # Business logic (email, ricerca, stats)
├── utils/           # Utilities riutilizzabili
├── templates/       # Template HTML
├── static/          # File statici (CSS, JS, immagini)
└── migrations/      # Migrazioni database
```

## 🛠️ Setup (Un Solo Comando!)

**Linux/Mac:**
```bash
git clone https://github.com/Triba14/sito_parco_verismo.git
cd sito_parco_verismo
./quick-start.sh
```

**Windows:**
```powershell
git clone https://github.com/Triba14/sito_parco_verismo.git
cd sito_parco_verismo
.\quick-start.ps1
```

Lo script `quick-start` fa **tutto automaticamente**:
- ✅ Virtual environment + dipendenze
- ✅ Database + migrazioni
- ✅ Traduzioni
- ✅ Superuser (admin/admin123)
- ✅ Dati demo
- ✅ Avvia il server

**Tempo:** ~3 minuti, poi apri http://127.0.0.1:8000

---

## 🔄 Avvio Quotidiano

**Linux/Mac:**
```bash
source .venv/bin/activate
python manage.py runserver
```

**Windows:**
```powershell
.venv\Scripts\activate
python manage.py runserver
```

**Credenziali Admin:** http://127.0.0.1:8000/admin/ (`admin` / `admin123`)

---

## 🎯 Setup Manuale (Opzionale)

Solo se preferisci controllare ogni passaggio:

```bash
# Ambiente virtuale
python3 -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate

# Dipendenze
pip install -r requirements.txt

# Database
python manage.py migrate
python manage.py createsuperuser

# Traduzioni (opzionale)
python manage.py compilemessages

# Dati demo (opzionale)
python populate_db_complete.py

# Avvia server
python manage.py runserver
```

---

## 🏗️ Architettura

### Models (Dominio)

```python
models/
├── autori_opere.py    # Autore, Opera
├── eventi.py          # Evento, Notizia
├── documenti.py       # Documento, FotoArchivio
├── itinerari.py       # Itinerario, TappaItinerario
└── prenotazioni.py    # Prenotazione
```

### Views (Funzionalità)

```python
views/
├── home.py            # Homepage
├── biblioteca.py      # Opere e autori
├── eventi.py          # Eventi e notizie
├── documenti.py       # Documenti e archivio foto
├── itinerari.py       # Itinerari letterari
├── comuni.py          # Pagine comuni (Mineo, Licodia)
└── istituzionale.py   # Chi siamo, contatti, privacy
```

### Services (Business Logic)

```python
services/
├── email_service.py   # Invio email prenotazioni
├── search_service.py  # Ricerca full-text opere
└── stats_service.py   # Statistiche admin
```

## 📖 Modelli Principali

### Biblioteca
- **Autore** - Autori veristi (Verga, Capuana, etc.)
- **Opera** - Opere letterarie con link Wikisource

### Eventi & News
- **Evento** - Eventi culturali con calendario
- **Notizia** - News e aggiornamenti

### Documenti
- **Documento** - Studi e ricerche (PDF upload)
- **FotoArchivio** - Galleria fotografica

### Itinerari
- **Itinerario** - Percorsi letterari interattivi
- **TappaItinerario** - Punti di interesse

### Sistema
- **Prenotazione** - Gestione prenotazioni guidate

## 🎯 Funzionalità

### Biblioteca Digitale
- Opere di Verga e Capuana
- Ricerca full-text
- Link diretti a Wikisource
- Filtri per autore

### Eventi & Calendario
- Calendario interattivo
- Export eventi (.ics)
- Condivisione social
- Filtri per data

### Documenti
- Upload PDF amministrativo
- Categorie (Documento/Studio/Ricerca/Saggio)
- Anteprime automatiche
- Download tracking

### Archivio Fotografico
- Carosello automatico
- Modal fullscreen
- Thumbnails responsive
- Gestione admin

### Itinerari Letterari
- Mappe interattive
- Punti di interesse georeferenziati
- Sistema prenotazioni
- Link a mappe esterne

### Sistema Prenotazioni
- Form validazione completa
- Email automatiche
- Admin panel dedicato
- Anti-spam integrato

## 🔧 Comandi Utili

### Script di Setup

```bash
# Setup completo automatico (consigliato per iniziare)
./quick-start.sh          # Linux/Mac
.\quick-start.ps1         # Windows

# Setup interattivo con opzioni
./setup.sh                # Linux/Mac
.\setup.ps1               # Windows

# Verifica configurazione ambiente
python check-setup.py     # Controlla che tutto sia OK
```

### Sviluppo
python manage.py runserver              # Avvia server
python manage.py makemigrations         # Crea migrazioni
python manage.py migrate                # Applica migrazioni
python manage.py createsuperuser        # Crea admin

# Traduzioni
python manage.py makemessages -l en     # Estrai stringhe EN
python manage.py makemessages -l it     # Estrai stringhe IT
python manage.py compilemessages        # Compila traduzioni

# Database
python manage.py dbshell                # Shell database
python manage.py dumpdata > backup.json # Backup dati
python manage.py loaddata backup.json   # Ripristina backup

# Testing
python manage.py test                   # Esegui test
python manage.py check                  # Verifica progetto

# Produzione
python manage.py collectstatic          # Raccogli file statici
python manage.py check --deploy         # Check deploy
```

## 📦 Deployment

### Variabili d'Ambiente (.env)

```bash
SECRET_KEY=your-secret-key-here
DEBUG=False
ALLOWED_HOSTS=yourdomain.com,www.yourdomain.com
DATABASE_URL=postgresql://user:pass@localhost/dbname
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_HOST_USER=your-email@gmail.com
EMAIL_HOST_PASSWORD=your-app-password
```

### Produzione (PostgreSQL)

```bash
# Installa dipendenze
pip install psycopg2-binary gunicorn

# settings.py aggiorna DATABASES
# Esegui migrazioni
python manage.py migrate

# Raccogli file statici
python manage.py collectstatic --noinput

# Avvia con Gunicorn
gunicorn mysite.wsgi:application --bind 0.0.0.0:8000
```

## 🤝 Contribuire

1. Fork il progetto
2. Clone: `git clone https://github.com/TUO-USERNAME/sito_parco_verismo.git`
3. Setup: `./quick-start.sh` (o `.ps1` su Windows)
4. Branch: `git checkout -b feature/NomeFunzionalita`
5. Commit: `git commit -m 'Descrizione chiara'`
6. Push: `git push origin feature/NomeFunzionalita`
7. Apri Pull Request su GitHub

**Best Practices:**
- ✅ Testa sempre: `python manage.py test`
- ✅ Verifica: `python manage.py check`
- ✅ Segui la struttura organizzata (models/, views/, admin/)
- ✅ Commit message chiari e descrittivi

## 📄 Licenza

Progetto open-source per la promozione culturale del patrimonio letterario siciliano.

## 👥 Contatti

**Parco Letterario del Verismo**  
Email: info@parcoletterarioverismo.it  
Web: https://parcoletterarioverismo.it

---

*Realizzato con ❤️ per la cultura siciliana*
