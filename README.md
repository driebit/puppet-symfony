driebit/puppet-symfony
====================

Introduction
------------

This Puppet module configures your [Symfony2](http://symfony.com/) application.
It is especially useful for making Vagrant VM environment meet the Symfony2
requirements.

Usage
-----

The following examples assume your Symfony2 application is stored in the
`/your-symfony-dir` directory.

### Install vendors with Composer

```puppet
symfony::composer { '/your-symfony-dir': }
```

### Set cache and log directory permissions

```puppet
symfony::permissions { '/your-symyfony-dir': }
```

Default options are:

```puppet
symfony::permissions { '/your-symfony-dir':
  cache_dir   => '/your-symfony-dir/app/cache',
  log_dir     => '/your-symfony-dir/app/logs',
  apache_user => 'apache',
  user        => 'vagrant'
}
```

### Run a console command

```puppet
symfony::console { 'cache:clear': }
```