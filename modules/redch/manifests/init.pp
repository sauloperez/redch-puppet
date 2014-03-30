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
  file { "/etc/init/redch.conf":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644,
    source => "puppet:///modules/redch/redch.conf"
  }
  package {
    "bundler":
      provider => gem
  }
}
