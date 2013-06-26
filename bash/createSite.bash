#!/bin/bash
function createSite(){
    name=$1
    path=$2
    domain=$3
    if [ -z "$name" ]; then
        echo "Usage: createSite name [path] [domain]";
        return
    fi
    if [ -z "$path" ]; then
        path="$HOME/dev/$1"
    fi
    if [ -z "$domain" ]; then
        domain="$1.localhost"
    fi

    echo "127.0.0.1   $domain" | sudo tee -a /etc/hosts
    sudo tee "/etc/apache2/sites-available/$name" << EOF
<VirtualHost *:80>
    ServerName $domain
    DocumentRoot $path
    <Directory $path>
        AllowOverride all
        Options +Indexes
    </Directory>
</VirtualHost>
EOF

    sudo a2ensite "$1"
    sudo service apache2 reload
    echo ""
    echo "Set up $name: $domain ~> $path"
    echo ""
}
