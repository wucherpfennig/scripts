<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Drupal](#drupal)
  - [Features](#features)
    - [Create](#create)
    - [Update / Revert](#update--revert)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Useful code & snippets

# Drupal

## Features

### Create

1. Download features module `drush dl features`

2. Enable it `drush en -y features`

3. Create a feature (machine_name), download it

4. Copy to desired location and enable it

### Update / Revert

1. Update overriden changes with

 ```
 drush fu feature_name
 ```

2. Commit changes to git

3. Checkout latest version of repo

4. Revert to latest change

 ```
 drush fr feature_name
 ```

*Rember*

* "revert" == code to db
* "update" == db to code
