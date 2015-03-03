define symfony::parameters (
  $template = 'symfony/parameters.yml.dist.erb',
  $values   = {},
  $defaults = true,
) {
  Symfony::Parameters <| |> -> Symfony::Composer <| |>

  # Merge defaults
  if $defaults {
    # Defaults based on Symfony Standard Edition
    $parameters = merge(
      {
        database_host    => '127.0.0.1',
        database_driver  => 'pdo_mysql',
        database_port    => '~',
        mailer_transport => 'smtp',
        mailer_host      => '127.0.0.1',
        mailer_user      => '~',
        mailer_password  => '~',
        locale           => 'en',
        secret           => 'ThisTokenIsNotSoSecretChangeIt',
      },
      $values
    )
  } else {
    $parameters = $values
  }

  file { "${name}":
    ensure  => present,
    content => template($template),
  }
}
