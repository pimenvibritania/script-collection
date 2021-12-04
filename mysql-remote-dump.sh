#!/bin/bash

SOURCE_IP={SSH_HOST}
MYSQL=mysql
PORT=3306
MYSQLDUMP=mysqldump
HOSTPROD={DB_HOST}
USERPROD={DB_USER}
PASSPROD={DB_PASS}

# remove the passphare temporarily
openssl rsa -in ~/.ssh/id_rsa -out id_rsa_passless_temp
chmod 400 id_rsa_passless_temp

echo "Cloning Account database from $HOSTPROD"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_account | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_account

echo "Cloning Region database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_region | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_region

echo "Cloning Support database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_support | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_support

echo "Cloning Article database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_article | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_article

echo "Cloning Internationalization database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_i18n | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_i18n

echo "Cloning Main database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_main | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_main

echo "Cloning Catering database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_catering | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_catering

echo "Cloning Corporate database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_corporate | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_corporate

echo "Cloning Coach database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_coach | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_coach

echo "Cloning Feed database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_feed | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_feed

echo "Cloning Preference database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_preference | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_preference

echo "Cloning Blog database from $SOURCE_IP"
$MYSQLDUMP -h $HOSTPROD -u $USERPROD --password="$PASSPROD" admin_production_blog | $MYSQL -h 127.0.0.1 -P $PORT -u root --password='root' doogether_legacy_blog

removing all garbages
rm id_rsa_passless_temp
