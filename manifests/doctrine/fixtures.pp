# Load database fixtures
define symfony::doctrine::fixtures (
  $env  = 'dev'
) {
  symfony::console { "doctrine:fixtures:load --no-interaction --purge-with-truncate --force -e=${env}":
    doc_root => $name
  }
}