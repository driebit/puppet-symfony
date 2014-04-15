# Update database based on Doctrine schema
define symfony::doctrine::schema (
  $env = 'dev',
  $dir,
) {
  symfony::console { "doctrine:schema:update --force -e=${env}":
    doc_root => $dir
  }
}
