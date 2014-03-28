# Load database fixtures
define symfony::doctrine::fixtures (
  $env  = 'dev'
) {
  Symfony::Doctrine::Schema <| |> -> Symfony::Doctrine::Fixtures <| |>

  symfony::console { "doctrine:fixtures:load --no-interaction --purge-with-truncate -e=${env}":
    doc_root => $name
  }
}
