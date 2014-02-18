define symfony::parameters ($original = "${name}.dist")
{
  Symfony::Parameters <| |> -> Symfony::Composer <| |>

  file { "${name}":
      ensure => present,
      content => template("$original"),
  }
}