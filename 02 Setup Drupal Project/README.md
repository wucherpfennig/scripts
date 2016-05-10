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


