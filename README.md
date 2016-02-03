**Example:**
```
docker run --name some-web -d -p 80 -v "$PWD":/var/www/html --link some-mysql:mysql wisya/apache-php:ubuntu
```

(Its just my first experience docker image)

**Apache mods (installed):**
mod_security, mod_rpaf, mod_evasive

**PHP extensions (installed):**
php5-apcu php5-curl php5-gd php5-mysql php5-sybase php5-pgsql php5-sqlite php5-intl php5-mcrypt php5-imagick
