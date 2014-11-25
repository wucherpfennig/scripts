#!/bin/bash
if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root - run this script as root"
	exit 1
fi

#get Username
userName=${SUDO_USER:-$USER}

# os detection
echo -e "*** please select your operating system: \n"
echo -e " 1) OSX\n(Assumtion: working with apache)\n"
echo -e " 2) LINUX\n(Assumtion: working with httpd)\n"
echo -e "choose: (1 default, 2): "
read operatingSystem
if [[ "$operatingSystem" == '' ]]; then
    operatingSystem=1
fi

# get project name
echo -e "*** please enter project name: (Domain Name like: netnode.ch)"
read projectName

# get local url
echo -e "*** please provide local url - default path is:"
localUrl="lo."$projectName
echo "$localUrl"
echo "Is this url correct? (y/n):"
read status
if [[ "$status" == 'n' ]]; then
    echo "please provide new local url"
    read newUrl
    localUrl=$newUrl
fi

# site root
echo "*** please provide project root folder - default path is:"
if [[ "$operatingSystem" == 1 ]]; then
    DocumentRoot="/Users/"$userName"/Sites/"$projectName
fi
if [[ "$operatingSystem" == 2 ]]; then
    DocumentRoot="/home/"$userName"/public_html/"$projectName
fi
echo "$DocumentRoot"
echo "Is this path correct? (y/n):"
read status
if [[ "$status" == 'n' ]]; then
    echo "please provide new site root without trailing slash"
    read newRoot
    DocumentRoot=$newRoot
fi

echo "*** please provide custom vhost folder - default path is:"
if [[ "$operatingSystem" == 1 ]]; then
    VhostRoot="/etc/apache2/custom"
fi
if [[ "$operatingSystem" == 2 ]]; then
    VhostRoot="/etc/httpd/conf/vhost"
fi
echo "$VhostRoot"
echo "Is this path correct? (y/n):"
read status
if [[ "$status" == 'n' ]]; then
	echo "please provide new custom vhost file location without trailing slash"
	read newVhostRoot
	VhostRoot=$newVhostRoot
fi

echo -e "*******************"
echo -e "creating vhost file"
touch $VhostRoot"/"$localUrl
echo -e "<VirtualHost *:80>\nServerName $localUrl\nDocumentRoot $DocumentRoot\n\n\t<Directory $DocumentRoot>\n\t\tAllowOverride All\n\t\tOrder allow,deny\n\t\tAllow from all\n\t</Directory>\n\n</VirtualHost>" > $VhostRoot"/"$localUrl


echo "*******************"
echo -e "backing up hosts file (hosts.bak)"
cp /etc/hosts /etc/hosts.bak


echo -e "*******************"
echo -e "extending hosts file"
cp /etc/hosts /etc/hosts.bak
echo -e "127.0.0.1\t\t$localUrl" >> /etc/hosts
echo -e "127.0.0.1\t\twww.$localUrl\n" >> /etc/hosts

echo -e "*******************"
echo -e "DONE!!!\n"

echo -e "*******************"
echo -e "trying to restart you webserver"
if [[ "$operatingSystem" == 1 ]]; then
    echo -e "you are using osx as os: resetarting apache"
    apachectl -e info -k restart
fi
if [[ "$operatingSystem" == 2 ]]; then
    echo -e "you are using unix as os: resetarting httpd"
    httpd restart
fi


