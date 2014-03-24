define symfony::parameters (
  $template = 'symfony/parameters.yml.dist.erb',
  $values   = {}
) {
  Symfony::Parameters <| |> -> Symfony::Composer <| |>

  # Defaults based on Symfony Standard Edition
  $defaults = {
    database_driver  => 'pdo_mysql',
    database_host    => '127.0.0.1',
    database_port    => '~',
    mailer_transport => 'smtp',
    mailer_host      => '127.0.0.1',
    mailer_user      => '~',
    mailer_password  => '~',
    locale           => 'en',
    secret           => 'ThisTokenIsNotSoSecretChangeIt',
  }

  $parameters = merge($defaults, $values)

  file { "${name}":
    ensure  => present,
    content => template($template),
  }
}