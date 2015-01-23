## Features

### Create
1. Download features module `drush dl features`
2. Enable it `drush en -y features`
3. Create a feature (machine_name), download it
4. Copy to desired location and enable it

### Update / Revert
1. Update overriden changes with
    drush fu feature_name
2. Commit changes to git
3. Checkout latest version of repo
4. Revert to latest change
    drush fr feature_name

*Rember*
* "revert" == code to db
* "update" == db to code
