<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Drupal](#drupal)
  - [Features](#features)
    - [Create](#create)
    - [Update / Revert](#update--revert)
- [CSS / SASS / Compass](#css--sass--compass)
  - [Generate Helper Font Classes](#generate-helper-font-classes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Useful code & snippets

# How to Setup a LAMP Stack

1. Install vagrant  
``````

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

# CSS / SASS / Compass

## Generate Helper Font Classes

**Usage:** `div.font-size-small`

```sass
$base-font-size: 100%;
$font-size-normal: $base-font-size;
$font-size-tiny: $font-size-normal * 0.7;
$font-size-small: $font-size-normal * 0.85;
$font-size-big: $font-size-normal * 1.5;
$font-size-huge: $font-size-normal * 2.5;

$font-sizes: "tiny" $font-size-tiny, "small" $font-size-small, "normal" $font-size-normal, "big" $font-size-big, "huge" $font-size-huge;
@each $size in $font-sizes {
  $key: nth($size, 1);
  $value: nth($size, 2);
  .font-size-#{$key} {
    font-size: $value;
  }
}
```
