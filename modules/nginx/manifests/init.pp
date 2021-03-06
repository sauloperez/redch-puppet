class nginx {
  file {
    "/tmp/passenger-4.0.37.gem":
      ensure  => present,
      mode    => 777,
      owner   => root,
      group   => root,
      source  => "puppet:///modules/nginx/packages/passenger-4.0.37.gem"
  }
  exec {
    "gem install /tmp/passenger-4.0.37.gem":
      user    => root,
      group   => root,
      alias   => "install_passenger",
      timeout => 0,
      unless  => "gem list -i passenger -v4.0.37",
      require => File["/tmp/passenger-4.0.37.gem"]
  }
  file {
    "/etc/nginx/conf/passenger.conf":
      mode   => 644,
      owner  => root,
      group  => root,
      alias  => "passenger_conf",
      notify => Service["nginx"],
      source => "Puppet:///modules/nginx/passenger.conf"
  }
  exec {
    "mkdir /var/log/nginx":
      unless => "test -d /var/log/nginx"
  }
  file {
    "/etc/init.d/nginx":
      ensure  => present,
      owner   => root,
      group   => root,
      mode    => 755,
      source  => "puppet:///modules/nginx/nginx",
  }
  service {
    "nginx":
      ensure    => true,
      enable    => true,
      subscribe => File["/etc/nginx/conf/nginx.conf"],
      require   => [File["/etc/nginx/conf/nginx.conf"], File["/etc/init.d/nginx"]]
  }
  exec {
    "mkdir /etc/nginx/sites-enabled":
      alias  => "sites_enabled",
      unless => "test -d /etc/nginx/sites-enabled"
  }
  file {
    "/etc/nginx/conf/nginx.conf":
      mode   => 644,
      owner  => root,
      group  => root,
      source => "puppet:///modules/nginx/nginx.conf";
    "/etc/nginx/sites-enabled/redch.conf":
      source => "puppet:///modules/nginx/redch.conf",
      owner  => root,
      group  => root,
      notify => Service["nginx"],
      require  => Exec["sites_enabled"]
  }
  file {
    '/etc/nginx/mime.types':
      source => 'puppet:///modules/nginx/mime.types',
      mode   => 644,
      owner  => root,
      group  => root,
      notify => Service["nginx"],
  }
  file {
    '/etc/init/nginx.conf':
      source => 'puppet:///modules/nginx/nginx_upstart',
      mode   => 644,
      owner  => root,
      group  => root,
      require => File["/etc/nginx/conf/nginx.conf"]
  }
}
