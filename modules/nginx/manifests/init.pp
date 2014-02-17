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
  exec {
    "passenger-install-nginx-module --auto --auto-download":
      user     => root,
      group    => root,
      alias    => "passenger_nginx_module",
      before   => File["/etc/nginx/nginx.conf"],
      require  => Exec["install_passenger"]
  }
  service {
    "nginx":
      ensure    => true,
      enable    => true,
      subscribe => File["/etc/nginx/nginx.conf"]
  }
  file {
    "/etc/nginx/nginx.conf":
      source => "puppet:///modules/nginx/nginx.conf",
      mode   => 644,
      owner  => root,
      group  => root;
    "/etc/nginx/sites-enabled/redch":
      source  => "puppet:///modules/nginx/redch",
      owner   => root,
      group   => root,
      notify  => Service["nginx"],
      require => Exec["passenger_nginx_module"];
  }
}
