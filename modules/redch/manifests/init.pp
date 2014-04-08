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
    mode => 775,
    alias => dir_tree
  }
  file { "/etc/init/redch.conf":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 644,
    source => "puppet:///modules/redch/redch.conf"
  }
  file { "/var/redch/shared/env_ruby_wrapper":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 755,
    source => "puppet:///modules/redch/env_ruby_wrapper",
    require => File["dir_tree"]
  }
  package {
    "bundler":
      provider => gem
  }
}
