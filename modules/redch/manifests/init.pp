class redch {
  file {
    ["/var/redch/",
     "/var/redch/shared/",
     "/var/redch/shared/config/",
     "/var/redch/shared/log/",
     "/var/redch/shared/tmp/",
     "/var/redch/shared/pids/"]:
    ensure => directory,
    owner => ubuntu,
    group => ubuntu,
    mode => 775
  }
  file { "/var/redch/shared/env_ruby_wrapper":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 755,
    source => "puppet:///modules/redch/env_ruby_wrapper",
    require => File["/var/redch/shared/"]
  }
  package {
    "bundler":
      provider => gem
  }
}
