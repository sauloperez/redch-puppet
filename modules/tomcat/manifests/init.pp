class tomcat {
  package { "tomcat7":
    ensure => installed,
  }

  package { "openjdk-7-jdk":
    ensure => installed,
  }

  exec { "set default java":
    command => "update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java",
    require => Package["openjdk-7-jdk"],
  }

  package { "maven":
    ensure => installed,
  }

  package { "tomcat7-admin":
    ensure => installed,
    require => Package["tomcat7"]
  }

  package { "libtcnative-1":
    ensure => installed,
    require => Package["tomcat7"]
  }

  file { "/etc/tomcat7/tomcat-users.xml":
    ensure  => file,
    owner   => root,
    group   => tomcat7,
    mode    => 644,
    require => Package["tomcat7"],
    notify  => Service["tomcat7"],
    source  => "Puppet:///modules/tomcat/tomcat-users.xml"
  }

  service { "tomcat7":
    enable => true,
    ensure => running,
    require => Package["tomcat7"],
  }
}
