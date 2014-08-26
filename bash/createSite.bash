#!/bin/bash
function createSite(){
    name=$1
    p=$2
    domain=$3
    if [ -z "$name" ]; then
        echo "Usage: createSite name [path] [domain]";
        return
    fi
    if [ -z "$p" ]; then
        p="$HOME/dev/$1"
    fi
    if [ -z "$domain" ]; then
        domain="$1.localhost"
    fi

    echo "127.0.0.1   $domain" | sudo tee -a /etc/hosts
    sudo mkdir -p /var/log/apache2/vhosts/$name
    sudo tee "/etc/apache2/sites-available/$name.conf" << EOF
<VirtualHost *:80>
    ServerName $domain
    LogLevel debug
    DocumentRoot $p
    <Directory $p>
        AllowOverride all
        Options +Indexes
        Require all granted
    </Directory>
    ErrorLog /var/log/apache2/vhosts/$name/error.log
    CustomLog /var/log/apache2/vhosts/$name/access.log combined
</VirtualHost>
EOF

    sudo a2ensite "$name.conf"
    sudo service apache2 reload
    echo ""
    echo "Set up $name: $domain ~> $p"
    echo ""
}
