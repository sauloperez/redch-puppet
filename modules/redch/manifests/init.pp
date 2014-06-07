class redch {
  user { 'ubuntu':
    ensure => present
  }
  exec { 'passwd':
    command => 'passwd -l ubuntu'
  }
  exec { 'adduser':
    command => 'adduser ubuntu admin'
  }
  exec { 'chown':
    command => 'chown ubuntu:root /var/www'
  }

  file { "/var/www/redch/shared/env_ruby_wrapper":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 755,
    source => "puppet:///modules/redch/env_ruby_wrapper",
  }
}
