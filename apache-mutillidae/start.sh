#!/bin/sh
#service mysql start
#echo "use mysql update user set authentication_string=PASSWORD('mutillidae') where user='root';  update user set plugin='mysql_native_password' where user='root';" | mysql -u root
#service apache2 start
/usr/sbin/sigsci-agent &
/run.sh

