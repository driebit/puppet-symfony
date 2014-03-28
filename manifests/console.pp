# Execute a Symfony console command
define symfony::console (
  $doc_root = '/vagrant'
) {
  Symfony::Composer <| |> -> Symfony::Permissions <| |> -> Symfony::Parameters <| |> -> Symfony::Console <| |>

  exec { "${name}":
    command => "php ${doc_root}/app/console ${name}",
    path    => '/usr/bin'
  }
}