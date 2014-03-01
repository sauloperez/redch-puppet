class rabbitmq {
  package { 'rabbitmq-server':
    ensure => present    
  }
  service { 'rabbitmq-server':
    ensure => true,
    enable => true,
    subscribe => Exec['rabbitmq-plugins']
  }
  exec { 'rabbitmq-plugins':
    environment => "HOME=/root",
    command => "rabbitmq-plugins enable rabbitmq_management",
    require => Package["rabbitmq-server"],
    notify => Service['rabbitmq-server']
  }
}

