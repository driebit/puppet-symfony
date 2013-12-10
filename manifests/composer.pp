# Install Symfony application dependencies using Composer
define symfony::composer (
  $binary = 'composer',
  $dev    = true
) {
  $devOption = $dev ? {
    true    => '--dev',
    default => '',
  }

  exec { "composer install ${name}" :
    command     => "${binary} install --verbose --working-dir ${name} ${devOption}",
    timeout     => 0,
    environment => "COMPOSER_HOME=/home/vagrant/.",
    path        => ['/usr/local/bin', '/usr/bin' ]
  }
}