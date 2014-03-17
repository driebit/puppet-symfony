# Install Symfony application dependencies using Composer
define symfony::composer (
  $binary = 'composer',
  $dev    = true,
  $user   = undef,
  $no_interaction = true,
) {
  $devOption = $dev ? {
    true    => '--dev',
    default => '',
  }

  $interaction = $no_interaction ? {
    true    => '--no-interaction',
    default => ''
  }

  exec { "composer install ${name}" :
    command     => "${binary} install --verbose ${interaction} --working-dir ${name} ${devOption}",
    timeout     => 0,
    environment => "COMPOSER_HOME=/home/vagrant/.",
    path        => ['/usr/local/bin', '/usr/bin' ],
    user        => $user
  }
}