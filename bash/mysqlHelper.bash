#!/bin/bash
if [ ! -d "$HOME/.mysqlconfig" ]; then
    mkdir $HOME/.mysqlconfig
fi
chmod 700 $HOME/.mysqlconfig

function createMysqlUserFileIfNecessary(){
    file=$HOME/.mysqlconfig/user
    if [ ! -f $file ]; then
        createMysqlUserFile
    fi
    export user=`cat $file | head -n 1`
    export pass=`cat $file | tail -n 1`
}
function createMysqlUserFile(){
    read "Username: "
    read user
}
function connectToMysql(){
    createMysqlUserFileIfNecessary
    echo $user
return
#user=$1                                                                         
#if [ -z "$user" ]; then                                                         
    #user="wp_fa_mysql_user"                                                     
    #pass="VJGAvXAyJoICxKn"                                                      
#fi                                                                              
#if [ -z "$pass" ]; then                                                         
    #mysql -u $user -p -h wpfamysql.cciv0evirhof.eu-west-1.rds.amazonaws.com     
#else                                                                            
    #mysql -u $user --password=$pass -h wpfamysql.cciv0evirhof.eu-west-1.rds.amazonaws.com
#fi
}
