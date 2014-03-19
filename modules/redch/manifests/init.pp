class redch {
  file {
    ["/var/redch/",
     "/var/redch/shared/",
     "/var/redch/shared/config/"]:
    ensure => directory,
    owner => ubuntu,
    group => ubuntu,
    mode => 775
  }
  package {
    "bundler":
      provider => gem
  }
}
