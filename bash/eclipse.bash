if [ -d ~/local/bin/eclipse/ ]; then
    export PATH=~/local/bin/eclipse:$PATH
fi

function installEclipse(){
    if [ -d ~/local/bin/eclipse/ ]; then
        echo 'Eclipse already installed'
        return
    fi

    wget http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/kepler/SR2/eclipse-standard-kepler-SR2-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz
    mkdir -p ~/local/bin/eclipse
    tar -xzvvf /tmp/eclipse.tar.gz -C ~/local/bin
    export PATH=~/local/bin/eclipse:$PATH
}

function installEclimd(){
    installEclipse
    wget http://garr.dl.sourceforge.net/project/eclim/eclim/2.3.4/eclim_2.3.4.jar -O /tmp/eclimd.jar
    java -jar /tmp/eclimd.jar
}
