class redch {
  file { "/var/redch/shared/env_ruby_wrapper":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 755,
    source => "puppet:///modules/redch/env_ruby_wrapper",
  }
  package {
    "bundler":
      provider => gem
  }
}
