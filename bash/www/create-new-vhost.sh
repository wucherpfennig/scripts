if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root - run this script as root"
	exit 1
fi

#get Username
userName=${SUDO_USER:-$USER}

# get project name
echo "*** please enter project name:"
read projectName

# get local url
echo "please enter local url"
read localUrl


# site root
echo "*** please provide project root folder - default path is:"
DocumentRoot="/Users/"$userName"/Sites/"$projectName
echo "$DocumentRoot"
echo "Is this path correct? (y/n):"
read status
if [[ "$status" == 'n' ]]; then
	echo "please provide new site root without trailing slash"
	read newRoot
	DocumentRoot=$newRoot
fi

# generating vhost file
echo "*** creating vhost file"

echo "*** please provide custom vhost folder - default path is:"
VhostRoot="/etc/apache2/custom"
echo "$VhostRoot"
echo "Is this path correct? (y/n):"
read status
if [[ "$status" == 'n' ]]; then
	echo "please provide new custom vhost file location without trailing slash"
	read newVhostRoot
	VhostRoot=newVhostRoot
fi

echo "creating vhost file"
touch $VhostRoot"/"$localUrl
echo "<VirtualHost *:80>\nServerName $localUrl\nDocumentRoot $DocumentRoot\n\n\t<Directory $DocumentRoot>\n\t\tAllowOverride All\n\t\tOrder allow,deny\n\t\tAllow from all\n\t</Directory>\n\n</VirtualHost>" > $VhostRoot"/"$localUrl

echo "extending hosts file"
echo "\n127.0.0.1\t\t$localUrl" >> /etc/hosts
echo "127.0.0.1\t\twww.$localUrl\n" >> /etc/hosts

echo "DONE!!!\n"
