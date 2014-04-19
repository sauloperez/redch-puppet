class sos {
  exec { 'adduser ubuntu admin' }
  exec { 'chgrp admin /var/www' }
  exec { 'chmod g+x /var/www' }

  file { "/var/www/sos/shared/config":
    ensure => directory,
    owner  => ubuntu,
    group  => ubuntu,
    mode   => 750
  }

  file { "/var/www/sos/shared/config/redch.properties":
    ensure => link,
    target => "/home/ubuntu/redch.properties"
  }
}
