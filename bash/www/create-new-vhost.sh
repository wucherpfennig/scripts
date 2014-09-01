if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root - run this script as root"
	exit 1
fi

#get Username
userName=${SUDO_USER:-$USER}

# os detection
echo -e "*** please select your operation system: \n"
echo -e " 1) OSX\n"
echo -e " 2) LINUX\n"
echo -e "(1 = default, 2): "
read operationSystem

# get project name
echo "*** please enter project name:"
read projectName

# get local url
echo "please enter local url"
read localUrl

# site root
echo "*** please provide project root folder - default path is:"
echo $operationSystem
if [[ "$operationSystem" == 1 ]]; then
    DocumentRoot="/Users/"$userName"/Sites/"$projectName
fi
if [[ "$operationSystem" == 2 ]]; then
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
if [[ "$operationSystem" == 1 ]]; then
    VhostRoot="/etc/apache2/custom"
fi
if [[ "$operationSystem" == 2 ]]; then
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

echo "creating vhost file"
touch $VhostRoot"/"$localUrl
echo -e "<VirtualHost *:80>\nServerName $localUrl\nDocumentRoot $DocumentRoot\n\n\t<Directory $DocumentRoot>\n\t\tAllowOverride All\n\t\tOrder allow,deny\n\t\tAllow from all\n\t</Directory>\n\n</VirtualHost>" > $VhostRoot"/"$localUrl

echo "extending hosts file"
echo -e "\n127.0.0.1\t\t$localUrl" >> /etc/hosts
echo -e "127.0.0.1\t\twww.$localUrl\n" >> /etc/hosts

echo -e "DONE!!!\n"
