# Make cache and log directories writable for both Vagrant and Apache user
define symfony::permissions (
  $cache_dir   = "${name}/cache",
  $log_dir     = "${name}/logs",
  $apache_user = 'apache',
  $user        = 'vagrant'
) {
  # Make sure ACL is installed
  if !defined(Package['acl']) {
    package { 'acl':
      ensure => installed
    }
  }

  # Make sure directories exist
  file { [ $name, $cache_dir, $log_dir ]:
    ensure => 'directory'
  }

  # Apply ACL to the directories
  exec { "symfony permissions ${name}":
    command => "setfacl -R -m u:${apache_user}:rwX -m u:${user}:rwX ${cache_dir} ${log_dir} &&
      setfacl -dR -m u:${apache_user}:rwX -m u:${user}:rwX ${cache_dir} ${log_dir}",
    path    => '/usr/bin',
    require => Package['acl']
  }
}