<?php

// local alias 
$local_sites = '/var/www/';
$aliases['local'] = array(
    'root' => '/var/www/public',
    'path-aliases' => array(
        '%dump-dir' => '/tmp',
        '%files' => '/var/www/public/sites/default/files',
    ),
);

// remote alias
$remote_sites = '/home/studhalt/public_html/';
$aliases['remote'] = array(
    'remote-host' => 'example.com',
    'remote-user' => 'user',
    'root' => '/var/www/example.com/public',
    'uri' => 'example.com',
    'path-aliases' => array(
        '%dump-dir' => '/tmp',
        '%files' => '/var/www/example.com/public/sites/default/files',
    ),
);

