# How to setup a new Drupal Project

1. Install Vagrant
    ```
    vagrant plugin install vagrant-vbguest vagrant-share
    ```

2. Clone [Scotch Box](https://github.com/scotch-io/scotch-box)
    ```
    git clone https://github.com/scotch-io/scotch-box.git PROJECT
    vagrant up
    ```

3. Add new project to the ```/etc/hosts``` file
    ```
    192.168.33.10   lo.project.com
    ```
    Hint: for easier ssh access add (```ssh vagrant@vagrant.local```)
    ```
    192.168.33.10   vagrant.local
    ```

4. Login to your new vagrant machine, create ssh keys and add them to the 
   destination host.  
   **PW:vagrant** 
    ```
    ssh vagrant@192.168.33.10
    ssh-keygen -t rsa
    ssh-copy-id user@host
    ```

5. Open ```.bashrc``` on the vagrant machine go and add to the end of the file
    ```
    cd /var/www/public
    ```

6. Install ```php5-xdebug```
    ```
    sudo apt-get update
    sudo apt-get install php5-xdebug
    sudo service apache2 restart
    ```
    Add the following to your ```/etc/php5/apache2/php.ini```
    ```
    [xdebug]
    zend_extension="/usr/lib/php5/20131226/xdebug.so"
    xdebug.remote_enable=on
    xdebug.remote_connect_back=on
    xdebug.remote_host=192.168.33.10
    ```
    restart the server again
    ```
    sudo service apache2 restart
    ```
